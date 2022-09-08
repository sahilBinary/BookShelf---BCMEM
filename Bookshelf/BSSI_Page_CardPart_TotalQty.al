page 50123 BSSI_Page_CardPart_TotalQty
{
    Caption = ' ';
    PageType = CardPart;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookOrders;
    
    layout
    {
        area(Content)
        {
            cuegroup(Quantity)
            {
                Caption = ' ';
                field(BSSI_Field_TotalQuantity;Rec.BSSI_Field_TotalQuantity)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}

