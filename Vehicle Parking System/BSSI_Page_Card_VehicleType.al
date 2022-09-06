page 50107 BSSI_Page_Card_VehicleType
{
    Caption = 'Vehicle Type Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_VehicleMaster;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(BSSI_Field_CarID; rec.BSSI_Field_CarID)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarType; rec.BSSI_Field_CarType)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_RatePerHour; rec.BSSI_Field_RatePerHour)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}