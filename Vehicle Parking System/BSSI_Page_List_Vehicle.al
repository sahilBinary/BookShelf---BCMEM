page 50105 BSSI_Page_List_Vehicle
{
    Caption = 'Vehicle List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = BSSI_Table_VehicleMaster;
    CardPageId = BSSI_Page_Card_VehicleType;
    //Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(BSSI_Field_CarID; rec.BSSI_Field_CarID)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarType; rec.BSSI_Field_CarType)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_TotalParkingSlots; rec.BSSI_Field_TotalParkingSlots)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_AvailableParking; rec.BSSI_Field_AvailableParking)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_RatePerHour; rec.BSSI_Field_RatePerHour)
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