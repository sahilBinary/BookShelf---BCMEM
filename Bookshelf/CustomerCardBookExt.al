pageextension 50100 CustomerCardBookExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Shoe Size"; rec.ShoeSize)
            {
                ApplicationArea = All;
            }
        }
        addafter(General)
        {
            group("Book Details")
            {
                field("Favourite Book No."; Rec."Favourite Book No.")
                {
                    ApplicationArea = All;
                }
                field("Favourite Book Name"; Rec."Favourite Book Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Books Read"; Rec."Total Books Read")
                {
                    ApplicationArea = All;
                }

                field("Total Reading Time"; Rec."Total Reading Time")
                {
                    ApplicationArea = All;
                }
                // field("Books Purchased"; Rec."Books Purchased")
                // {
                //     ApplicationArea = All;
                // }
                // field("Amount Spent on Books"; Rec."Book Sales")
                // {
                //     ApplicationArea = All;
                // }

            }

            part("Book List"; BookReadListPart)
            {
                Caption = 'Books Read list';
                ApplicationArea = All;
                SubPageLink = "Person ID" = field("No.");
            }

            group(BookSales)
            {
                Caption = 'Book Sales Details';
                field(BooksPurchased; rec.TotalOrdersPlaced)
                {
                    ApplicationArea = All;
                }
                field(TotalBooksPurchased; rec.TotalBooksPurchased)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AmountSpent; rec.BookSales)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            part(BookSalesList; BookSalesListPartPerm)
            {
                Caption = 'List of Books Purchased';
                ApplicationArea = All;
                SubPageLink = "Person ID" = field("No.");
            }

        }
    }

    actions
    {
        addafter(BackgroundStatement)
        {
            action(BookReport)
            {
                Caption = 'Book Report';
                ApplicationArea = All;
                Image = "Report";

                trigger OnAction()
                var
                    myreport: Report MyReport1;
                    myrec: Record BookSalesLines;
                begin
                    myrec.SetFilter("Person ID", '=%1', Rec."No.");
                    myreport.SetTableView(myrec);
                end;
            }
        }
    }
}

