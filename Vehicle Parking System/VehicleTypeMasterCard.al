page 50107 VehicleTypeMaster
{
    Caption = 'Vehicle Type Master Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VehicleMaster;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CarID; rec.CarID)
                {
                    ApplicationArea = All;
                }
                field(CarType; rec.CarType)
                {
                    ApplicationArea = All;
                }
                field(RatePerHour; rec.RatePerHour)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}