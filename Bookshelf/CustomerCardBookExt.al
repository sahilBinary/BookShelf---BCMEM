pageextension 50110 CustomerCardBookExtension extends "Customer Card"
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
                    TableRelation = Book;

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

            part("Book List"; BookReadList)
            {
                Caption = 'Books Read list';
                ApplicationArea = All;
                SubPageLink = "Person ID" = field("No.");
            }


        }





    }

}

