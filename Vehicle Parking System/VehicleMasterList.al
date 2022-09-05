page 50105 VehicleMasterList
{
    Caption = 'Vehicle Master List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = VehicleMaster;
    CardPageId = VehicleTypeMaster;
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(CarID; rec.CarID)
                {
                    ApplicationArea = All;
                }
                field(CarType; rec.CarType)
                {
                    ApplicationArea = All;
                }
                field(TotalParkingSlots; rec.TotalParkingSlots)
                {
                    ApplicationArea = All;
                }
                field(AvailableParking; rec.AvailableParking)
                {
                    ApplicationArea = All;
                }
                field(RatePerHour; rec.RatePerHour)
                {
                    ApplicationArea = All;
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
            action(ParkingSlotDetails)
            {
                Caption = 'Update Parking Slot Details';
                ApplicationArea = All;
                Promoted = true;
                trigger OnAction();
                begin
                    Page.Run(50106);
                end;
            }
        }
    }
}