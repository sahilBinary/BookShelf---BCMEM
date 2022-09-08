page 50122 BSSI_Page_ListPart_OrderStats
{
    Caption = 'Order Statistics';
    PageType = ListPart;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookSalesLines;
    
    layout
    {
        area(Content)
        {
            Repeater(group)
            {
                Caption = 'Order Statistics';
                field(BSSI_Field_BookNo;Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_Quantity;Rec.BSSI_Field_Quantity)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_LineAmount;Rec.BSSI_Field_LineAmount)
                {
                    ApplicationArea = All;
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