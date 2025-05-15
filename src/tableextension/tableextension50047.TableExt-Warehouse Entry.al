tableextension 50047 tableextension50047 extends "Warehouse Entry"
{
    keys
    {
        key(Key1; "Item No.", "Bin Code", "Location Code", "Variant Code", "Unit of Measure Code")
        {
            SumIndexFields = Quantity;
        }
    }
}

