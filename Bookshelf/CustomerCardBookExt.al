pageextension 50100 CustomerCardBookExtension extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Favourite Book No."; Rec."Favourite Book No.")
            {
                ApplicationArea = All;
            }

            field("Shoe Size"; rec.ShoeSize)
            {
                ApplicationArea = All;
            }
        }



    }

}

