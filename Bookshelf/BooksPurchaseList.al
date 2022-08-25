page 50112 BooksPurchaseList
{
    Caption = 'Books Purchase List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BooksPurchase;
    CardPageId = BooksPurchaseCard;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Book No."; rec."Book No.")
                {
                    ApplicationArea = all;
                }
                field("Quantity"; rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Person ID"; rec."Person ID")
                {
                    ApplicationArea = all;
                }
                field("Date of Purchase"; rec."Date of Purchase")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    
}