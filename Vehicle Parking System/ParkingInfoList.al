page 50108 ParkingInfoList
{
    Caption = 'Parking Info List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ParkingInfo;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CarId; rec.CarId)
                {
                    ApplicationArea = All;
                }
                field(CarNo; rec.CarNo)
                {
                    ApplicationArea = all;
                }
                field(CheckIn; Rec.CheckIn)
                {
                    ApplicationArea = all;
                }
                field(CheckOut; Rec.CheckOut)
                {
                    ApplicationArea = all;
                }
                field(ParkedTime; Rec.ParkedTime)
                {
                    ApplicationArea = all;
                }
                field(TotalFare; rec.TotalFare)
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