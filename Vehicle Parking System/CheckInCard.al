page 50109 CheckInCard
{
    Caption = 'Check In';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ParkingInfo;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
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
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PunchCheckInCard)
            {
                Caption = 'Confirm Check In';
                ApplicationArea = All;

                trigger OnAction()
                var

                begin
                    Rec.InsertCheckIn(Rec);
                end;
            }
        }
    }

}