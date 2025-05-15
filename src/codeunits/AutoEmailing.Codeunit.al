codeunit 50002 "Auto Emailing"
{
    // Project: Weidmuller
    // ********************************************************************************************************************************
    // Developer: ZiniosEdge
    // ********************************************************************************************************************************
    // -+------+---------+----------+---------+----+--------------------------------------
    // T|ID_RIC|MOD  REL |DATE      |SEARCH   |Developer|DESCRIPTION
    // -+------+---------+----------+---------+----+--------------------------------------
    // ?|ZE    |         |24.04.2020|ZE_LIJO  |LIJO     |For auto emailing Dunning Report to customers.


    trigger OnRun()
    begin
        //ZE_LIJO 24.04.2020
        //++
        //CustomerCreditCheck.RUN();
        DunningEmail();
        //--
    end;

    var
        FileName: Text;
        FileManagement: Codeunit "419";
        SMTPMailSetup: Record "409";
        SMTPMail: Codeunit "400";
        CustomerCreditCheck: Codeunit "50003";

    local procedure DunningEmail()
    var
        DE_CustDunning: Report "50024";
        DE_Customer: Record "18";
        DE_CLE: Record "21";
        DE_CustEmail: Text;
        DE_EmailBody: Text;
        DE_Cust: Record "18";
    begin
        IF (DATE2DMY(TODAY, 1) = 1) OR (DATE2DMY(TODAY, 1) = 15) THEN BEGIN
            CLEAR(DE_CustEmail);
            CLEAR(DE_EmailBody);
            DE_Customer.RESET;
            DE_Customer.CHANGECOMPANY('GO_LIVE');
            //DE_Customer.SETRANGE(DE_Customer."No.",'IN00010');
            //DE_Customer.SETRANGE(DE_Customer.Blocked,DE_Customer.Blocked::" ");
            DE_Customer.SETFILTER("E-Mail", '<>%1', '');
            //++ 15-06-2020
            DE_Customer.CALCFIELDS(Balance);
            DE_Customer.SETFILTER(Balance, '>10');
            //--
            IF DE_Customer.FINDSET THEN
                REPEAT
                    DE_CustEmail := DE_Customer."E-Mail";
                    DE_CLE.RESET;
                    DE_CLE.CHANGECOMPANY('GO_LIVE');
                    DE_CLE.SETFILTER(DE_CLE."Customer No.", DE_Customer."No.");
                    DE_CLE.SETRANGE(DE_CLE.Open, TRUE);
                    DE_CLE.SETFILTER(DE_CLE."Due Date", '<%1', TODAY);//ZE.RSF.1095
                    IF DE_CLE.FINDSET THEN BEGIN
                        DE_CLE.CALCFIELDS("Remaining Amount");
                        IF (DE_CLE."Remaining Amount" > 10) OR (DE_CLE."Remaining Amount" < -10) THEN BEGIN
                            DE_Cust.RESET;
                            DE_Cust.CHANGECOMPANY('GO_LIVE');
                            DE_Cust.SETFILTER("No.", DE_Customer."No.");
                            FileName := FileManagement.ServerTempFileName('Customer-wise Dunning');
                            DE_CustDunning.SETTABLEVIEW(DE_Cust);
                            DE_CustDunning.USEREQUESTPAGE := FALSE;
                            DE_CustDunning.SAVEASPDF(FileName);
                            CLEAR(DE_CustDunning);
                            IF EXISTS(FileName) THEN BEGIN
                                SMTPMailSetup.GET;
                                SMTPMail.CreateMessage('Weidmuller Electronics India Pvt. Ltd', SMTPMailSetup."User ID", DE_CustEmail, 'Dunning Report' + DE_Customer."No.", '', TRUE);
                                SMTPMail.AddCC('hitesh.poonacha@weidmueller.com');
                                //SMTPMail.AddCC('mahesh.c@ziniosedge.com');
                                SMTPMail.AddAttachment(FileName, DE_Customer."No." + '.pdf');
                                SMTPMail.AppendBody('Dear Sir/Madam');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('<HR>');
                                DE_EmailBody := 'Please find attachment.';
                                SMTPMail.AppendBody(DE_EmailBody);
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('This is computer generated Document.');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('<HR>');
                                SMTPMail.AppendBody('Regards,');
                                SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('Team Weidmuller');
                                //                 SMTPMail.AppendBody('<br><br>');
                                //                 SMTPMail.AppendBody('(A humble Initiative to save environment)');
                                //                 SMTPMail.AppendBody('<br><br>');
                                SMTPMail.AppendBody('<HR>');
                                SMTPMail.Send;
                            END;
                        END;
                    END;
                    CLEAR(FileName);
                UNTIL DE_Customer.NEXT = 0;

        END;
        //MESSAGE('Done');
    end;
}

