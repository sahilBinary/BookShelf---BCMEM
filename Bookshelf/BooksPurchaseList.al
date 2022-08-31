page 50112 BooksPurchaseList
{
    Caption = 'Book Sales Orders';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BooksPurchase;
    CardPageId = BooksPurchaseCard;
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = all;
                }
                field("Person ID"; rec."Person ID")
                {
                    ApplicationArea = all;
                }

                field("Date of Purchase"; Rec."Date of Purchase")
                {
                    ApplicationArea = all;
                }
                field("Total Amount"; rec."Total Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }


}