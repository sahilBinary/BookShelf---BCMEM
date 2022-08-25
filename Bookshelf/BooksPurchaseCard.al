page 50111 BooksPurchaseCard
{
    Caption = 'Books Purchase Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BooksPurchase;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
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

    actions
    {
        area(Processing)
        {
            action("Confirm Purchase")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.ConfirmPurchase(Rec);
                end;
            }
        }
    }


}