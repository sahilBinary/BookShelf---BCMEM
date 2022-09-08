page 50126 BSSI_Page_List_ConfirmedOrders
{
    Caption = 'Open Book Orders';
    PageType = List;
    //ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BSSI_Table_BookOrders;
    CardPageId = BSSI_Page_Card_BookOrdersNonEd;
    Editable = false;
    SourceTableView = where (BSSI_Field_status = const("Order Confirmed"));

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
                field(BSSI_Field_Status;Rec.BSSI_Field_Status)
                {
                    ApplicationArea = All;
                    StyleExpr = StatusStyleTxt;
                }
                field(BSSI_Field_TotalAmount; rec.BSSI_Field_TotalAmount)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(FactBoxes)
        {
            part(CustomerPicture; "Customer Picture")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field(BSSI_Field_PersonID);
            }
            part(OrderStats; BSSI_Page_ListPart_OrderStats)
            {
                ApplicationArea = all;
                SubPageLink = BSSI_Field_OrderID = field(BSSI_Field_OrderID);
            }
            part(OrderStats2; BSSI_Page_CardPart_TotalQty)
            {
                ApplicationArea = all;
                SubPageLink = BSSI_Field_OrderID = field(BSSI_Field_OrderID);
            }
            part(CustomerDetails; "Customer Details FactBox")
            {
                ApplicationArea = all;
                SubPageLink = "No." = field(BSSI_Field_PersonID);
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

    trigger OnAfterGetRecord()
    begin
        if Rec.BSSI_Field_Status = Rec.BSSI_Field_Status::Open then begin
            StatusStyleTxt := 'Favorable';
        end else begin
            StatusStyleTxt := 'Strong';
        end;
    end;
    var
        StatusStyleTxt: Text;

}