page 50124 BSSI_Page_CardPart_BookRoleCen
{
    Caption = 'Book Statistics';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_BookRoleCenter;

    layout
    {
        area(Content)
        {
            cuegroup(BookSales)
            {
                Caption = ' ';
                CuegroupLayout = Wide;

                field(BSSI_Field_BookSalesCurrMonth; Rec.BSSI_Field_BookSalesCurrMonth)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_CurrMonthSales;
                }

                field(BSSI_Field_BookSalesToday; Rec.BSSI_Field_BookSalesToday)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_TodaySales;
                }

                field(BSSI_Field_TotalBookSales; Rec.BSSI_Field_TotalBookSales)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }

                field(BSSI_Field_PotentialSales; Rec.BSSI_Field_PotentialSales)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }

            }

            cuegroup(BookStats)
            {
                Caption = ' ';
                field(BSSI_Field_TotalBooksSold; Rec.BSSI_Field_TotalBooksSold)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_BookSales;
                }
                field(BSSI_Field_OrdersPlaced; Rec.BSSI_Field_OrdersPlaced)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_BookOrders;
                }
                field(BSSI_Field_OpenOrders; Rec.BSSI_Field_OpenOrders)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_OpenOrders;
                }
                field(BSSI_Field_ConfirmedOrders; Rec.BSSI_Field_ConfirmedOrders)
                {
                    ApplicationArea = All;
                    DrillDownPageId = BSSI_Page_List_ConfirmedOrders;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateCurrentStats)
            {
                Caption = 'Refresh Data';
                Image = Refresh;
                ApplicationArea = All;

                trigger OnAction()
                var
                    mycode:Codeunit BSSI_Codeunit_Customer;
                begin
                    mycode.UpdateDateCheckFields();
                end;
            }
        }

    }


}