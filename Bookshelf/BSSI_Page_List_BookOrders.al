page 50112 BSSI_Page_List_BookOrders
{
    Caption = 'Book Sales Orders';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BSSI_Table_BookOrders;
    CardPageId = BSSI_Page_Card_BookOrdersNonEd;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(BSSI_Field_OrderID; Rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_PersonID; rec.BSSI_Field_PersonID)
                {
                    ApplicationArea = all;
                }

                field(BSSI_Field_DateOfPurchase; Rec.BSSI_Field_DateOfPurchase)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_TotalAmount; rec.BSSI_Field_TotalAmount)
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