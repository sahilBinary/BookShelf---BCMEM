page 50111 BooksPurchaseCard
{
    Caption = 'Books Order Card';
    PageType = Card;
    //ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BooksPurchase;
    //SourceTableTemporary = true;

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
            // action("Confirm Purchase")
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var
            //         SalesLines: Record BookSalesLines;
            //     // BooksLines: Record BookSalesLines;
            //     begin

            //         Rec.ConfirmPurchase(Rec);
            //         SalesLines.SetFilter("Order ID", '=%1', Rec."Order ID");
            //         if SalesLines.FindSet() then begin
            //             repeat begin
            //                 SalesLines."Person ID" := Rec."Person ID";
            //                 SalesLines.Modify()
            //             end until SalesLines.Next() = 0;
            //         end;
            //         // BooksLines := CurrPage.Lines.Page.GetRecords();
            //         // //CurrPage.Lines.Page.GetRecord(BooksLines);
            //         // if BooksLines.FindSet() then begin
            //         //     repeat begin
            //         //         Message('BooksLines."Order ID" = %1, BooksLines."Book No" = %2, BooksLines.Quantity = %3', BooksLines."Order ID", BooksLines."Book No.", BooksLines.Quantity);
            //         //     end until BooksLines.Next() = 0;
            //         // end else begin
            //         //     Message('BooksLines.Findset() failed');
            //         // end;

            //     end;
            // }
        }
    }

    procedure GetRecBookPurchase() : Record BooksPurchase
    begin
        exit(Rec);
    end;
}

