page 50111 BooksPurchaseCard
{
    Caption = 'Books Order Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BooksPurchase;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record BooksPurchase;
                        text001: Label 'An order with Order ID : %1 is already present. Enter a unique Order ID.';
                    begin
                        if myRec.Get(rec."Order ID") then begin
                            Message(text001,Rec."Order ID");
                            Rec."Order ID" := 'b-ord';
                        end;
                    end;
                }
                field("Person ID"; Rec."Person ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the ID of the customer : Code[20]';
                }
                field("Date of Purchase"; Rec."Date of Purchase")
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the date of purchase.';
                }

            }
            group(BookSalesLines)
            {
                part(Lines; BookSalesListPartList)
                {
                    ApplicationArea = all;
                    SubPageLink = "Order ID" = field("Order ID");
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
                    CurrPage.Lines.Page.PunchRecord();
                end;
            }
        }
    }
}


page 50115 BooksPurchaseCardNonEditable
{
    Caption = 'Books Order Card';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BooksPurchase;
    Editable = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = all;
                }

                field("Person ID"; Rec."Person ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the ID of the customer : Code[20]';
                }
                field("Date of Purchase"; Rec."Date of Purchase")
                {
                    ApplicationArea = all;
                    ToolTip = 'Enter the date of purchase.';
                }

            }
            group(BookSalesLines)
            {
                part(Lines; BookSalesListPartPerm)
                {
                    ApplicationArea = all;
                    SubPageLink = "Order ID" = field("Order ID");
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
        }
    }
}



