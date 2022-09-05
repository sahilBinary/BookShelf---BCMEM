page 50112 BooksPurchaseList
{
    Caption = 'Book Sales Orders';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BooksPurchase;
    CardPageId = BooksPurchaseCardNonEditable;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Order ID"; Rec."Order ID")
                {
                    ApplicationArea = all;
                }
                field("Person ID"; rec."Person ID")
                {
                    ApplicationArea = all;
                }

                field("Date of Purchase"; Rec."Date of Purchase")
                {
                    ApplicationArea = all;
                }
                field("Total Amount"; rec."Total Amount")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(BookReport)
            {
                Caption = 'Book Report';
                ApplicationArea = All;
                Image = "Report";

                trigger OnAction()
                begin
                    Report.Run(50101);
                end;
            }
        }
        area(Creation)
        {
            action(NewOrder)
            {
                Caption = 'Create New Order';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Page.Run(50111);
                end;
            }
        }

        area(Processing)
        {
            action(xmlport)
            {
                ApplicationArea = All;
                Caption = 'Import/Export Book Orders';
                trigger OnAction()
                begin
                    Xmlport.Run(50101);
                end;
            }
        }


    }


}