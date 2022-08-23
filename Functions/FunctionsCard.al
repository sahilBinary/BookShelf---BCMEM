page 50105 FunctionsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Functions;

    layout
    { ///
        area(Content)
        {
            group(General)
            {
                field(FID; Rec.FID)
                {

                    ApplicationArea = All;

                }
                field(Function; Rec.Function)
                {
                    ApplicationArea = All;
                }
                field("Number 1"; Rec."Number 1")
                {
                    //Caption = 'Always fill this field';
                    ApplicationArea = All;
                }
                field("Number 2"; Rec."Number 2")
                {
                    //Caption = 'Fill this field if you want to use the "Greater of the three" or "Swap Numbers" action';
                    ApplicationArea = All;
                }
                field("Number 3"; Rec."Number 3")
                {
                    //Caption = 'Fill this field if you want to use the "Greater of the three" action';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Odd or Even")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.IsEvenorOdd();
                end;
            }
            action("Check Prime")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.CheckifPrime();
                end;
            }
            action("Greater of the three")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.GreaterNumber();
                end;
            }
            action("Odd Series")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.OddSeries();
                end;
            }
            action("Reverse Number")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.ReverseNumber();
                end;
            }
            action("Swap Numbers")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.SwapNumbers();
                end;
            }
            action("Counter")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Codeunit.Run(50109);
                end;
            }

        }
    }



}


