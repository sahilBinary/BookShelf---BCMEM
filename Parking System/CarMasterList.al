page 50105 "Car Master List"
{
    Caption = 'Car Master List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Car Master";
    CardPageId = "Car Type Master";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CarID; rec.CarID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(CarType; rec.CarType)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(TotalParkingSlots; rec.TotalParkingSlots)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(AvailableParking; rec.AvailableParking)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(RatePerHour; rec.RatePerHour)
                {
                    ApplicationArea = All;
                    Editable = false;
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}