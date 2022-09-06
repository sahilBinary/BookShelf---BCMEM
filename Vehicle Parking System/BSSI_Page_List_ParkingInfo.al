page 50108 BSSI_Page_List_ParkingInfo
{
    Caption = 'Parking Info List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BSSI_Table_ParkingInfo;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(BSSI_Field_Date; rec.BSSI_Field_Date)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarId; rec.BSSI_Field_CarId)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarNo; rec.BSSI_Field_CarNo)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_CheckIn; Rec.BSSI_Field_CheckIn)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_CheckOut; Rec.BSSI_Field_CheckOut)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_ParkedTime; Rec.BSSI_Field_ParkedTime)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_TotalFare; rec.BSSI_Field_TotalFare)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(CheckInCard)
            {
                Caption = 'Check In';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Page.Run(50109);
                end;
            }
            action(CheckOutCard)
            {
                Caption = 'Check Out';
                ApplicationArea = All;

                trigger OnAction();
                begin
                    Page.Run(50114);
                end;
            }
        }
    }
}