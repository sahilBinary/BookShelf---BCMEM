page 50109 CheckInCard
{
    Caption = 'Check In';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ParkingInfo;

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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

}