page 50104 FunctionsCard
{
    Caption = 'Functions';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    //SourceTable = Functions;
    SourceTable = Data;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Number 1"; Rec."Number 1")
                {
                    ToolTip = 'Always fill this field';
                    ApplicationArea = All;
                }
                field("Number 2"; Rec."Number 2")
                {
                    ToolTip = 'Fill this field if you want to use the "Greater of the three" or "Swap Numbers" action';
                    ApplicationArea = All;
                }
                field("Number 3"; Rec."Number 3")
                {
                    ToolTip = 'Fill this field if you want to use the "Greater of the three" action';
                    ApplicationArea = All;
                }
                field("Month"; Rec.Month)
                {
                    ApplicationArea = All;
                }
                field("year"; Rec.Year)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(add)
            {
                ApplicationArea = All;
                
                // trigger OnAction()
                // var
                //     mycode: codeunit functions;
                // begin
                //     codeunit.run(50104);
                // end;
            }
            action("Odd or Even")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.IsEvenorOdd();
                end;
            }
            action("Check Prime")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CheckifPrime();
                end;
            }
            action("Greater of the three")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.GreaterNumber();
                end;
            }
            action("Odd Series")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.OddSeries();
                end;
            }
            action("Reverse Number")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.ReverseNumber();
                end;
            }
            action("Swap Numbers")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.SwapNumbers();
                end;
            }
            action("Days in a Month")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.DaysInMonth();
                end;
            }

        }
    }

}


