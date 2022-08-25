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

            }

            part("Book List"; BookReadListPart)
            {
                Caption = 'Books Read list';
                ApplicationArea = All;
                SubPageLink = "Person ID" = field("No.");
            }


        }





    }

}

