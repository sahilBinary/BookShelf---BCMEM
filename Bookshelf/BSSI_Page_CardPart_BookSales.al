page 50120 BSSI_Page_CardPart_BookSales
{
    Caption = 'Book Sales Details';
    PageType = CardPart;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_Book;

    layout
    {
        area(Content)
        {
            cuegroup(BookSalesDetails)
            {
                Caption = ' ';
                field(BSSI_Field_Quantity; Rec.BSSI_Field_QuantitySold)
                {
                    Caption = 'Units Sold';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the no. of units sold';
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }
                field(BSSI_Field_TotalSales; Rec.BSSI_Field_TotalSales)
                {
                    Caption = 'Book Sales ($)';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total sales for the selected book';
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }
                field(BSSI_Field_InventoryCapacity; Rec.BSSI_Field_InventoryCapacity)
                {
                    Caption = 'Inventory Capacity';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total Inventory Capacity for the selected book';
                }
                field(BSSI_Field_AvailableInventory;Rec.BSSI_Field_AvailableInventory)
                {
                    Caption = 'Available Inventory';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the quantity of the selected book available in the Inventory';
                }

            }
        }
    }

}

page 50121 BSSI_Page_List_BookSalesFB
{
    Caption = 'Book Sales Factbox';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BSSI_Table_BookSalesLines;
    CardPageId = BSSI_Page_CardPart_BookSales;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(BSSI_Field_OrderID; Rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_BookNo; Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_Quantity; Rec.BSSI_Field_Quantity)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}