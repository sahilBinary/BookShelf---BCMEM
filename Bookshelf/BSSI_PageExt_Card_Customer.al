pageextension 50100 BSSI_PageExt_Card_Customer extends "Customer Card"
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

            }

            part("Book List"; BSSI_Page_ListPart_BookRead)
            {
                Caption = 'Books Read list';
                ApplicationArea = All;
                SubPageLink = BSSI_Field_PersonID = field("No.");
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
            part(BookSalesList; BSSI_Page_ListPart_BookSalesP)
            {
                Caption = 'List of Books Purchased';
                ApplicationArea = All;
                SubPageLink = BSSI_Field_PersonID = field("No.");
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
                    myreport: Report BSSI_Report_BookSales;
                    myrec: Record BSSI_Table_BookSalesLines;
                begin
                    myrec.SetFilter(BSSI_Field_PersonID, '=%1', Rec."No.");
                    myreport.SetTableView(myrec);
                end;
            }
        }
    }
}

