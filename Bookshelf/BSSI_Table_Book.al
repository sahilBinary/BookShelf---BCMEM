table 50100 BSSI_Table_Book
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; BSSI_Field_BookNo; Code[20])
        {
            Caption = 'Book No.';
            DataClassification = CustomerContent;
        }

        field(2; BSSI_Field_Title; Text[50])
        {
            caption = 'Title';
            DataClassification = CustomerContent;
        }

        field(3; BSSI_Field_Author; Text[50])
        {
            caption = 'Author.';
            DataClassification = CustomerContent;
        }

        field(4; BSSI_Field_Hardcover; Boolean)
        {
            caption = 'Hardcover';
            DataClassification = CustomerContent;
        }

        field(5; BSSI_Field_PageCount; Integer)
        {
            caption = 'Page Count';
            DataClassification = CustomerContent;
        }
        field(6; BSSI_Field_Price; Decimal)
        {
            Caption = 'Price ($)';
            DataClassification = CustomerContent;
        }
        field(7; BSSI_Field_QuantitySold; Integer)
        {
            Caption = 'Quantity Sold';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_Quantity where(BSSI_Field_BookNo = field(BSSI_Field_BookNo)));
        }
        field(8; BSSI_Field_TotalSales; Decimal)
        {
            Caption = 'Total Book Sales';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_BookNo = field(BSSI_Field_BookNo)));
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.BSSI_Field_AvailableInventory := Rec.BSSI_Field_InventoryCapacity - Rec.BSSI_Field_TotalSales;
            end;
        }
        field(9; BSSI_Field_InventoryCapacity; Integer)
        {
            Caption = 'Inventory Capacity';
            DataClassification = CustomerContent;
        }
        field(10; BSSI_Field_AvailableInventory; Integer)
        {
            Caption = 'Available Inventory';
        }

    }


    keys
    {
        key(PK; BSSI_Field_BookNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; BSSI_Field_BookNo, BSSI_Field_Title, BSSI_Field_Author)
        {
        }
    }


}