page 50106 BSSI_Page_Card_ParkingAlloc
{
    Caption = 'Parking Allocation Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_VehicleMaster;
    SourceTableTemporary = true; // Temporary table

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(BSSI_Field_CarID; Rec.BSSI_Field_CarID)
                {
                    TableRelation = BSSI_Table_VehicleMaster;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myrec:Record BSSI_Table_VehicleMaster;
                    begin
                        myrec.Get(rec.BSSI_Field_CarID);
                        rec.BSSI_Field_CarType := myrec.BSSI_Field_CarType;
                    end;
                }
                field(BSSI_Field_CarType; Rec.BSSI_Field_CarType)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(BSSI_Field_TotalParkingSlots; Rec.BSSI_Field_TotalParkingSlots)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myRec: Record BSSI_Table_VehicleMaster;
                    begin
                        //check logic again
                        myRec.Get(Rec.BSSI_Field_CarID);
                        rec.BSSI_Field_AvailableParking := rec.BSSI_Field_TotalParkingSlots - (myRec.BSSI_Field_TotalParkingSlots - myRec.BSSI_Field_AvailableParking);
                    end;
                }
                field(AvailableParking; Rec.BSSI_Field_AvailableParking)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ParkingSlots)
            {
                Caption = 'Confirm Parking Slot Details';
                ApplicationArea = All;                
                trigger OnAction()
                begin
                    Rec.InsertValues(Rec);
                end;
            }
        }
    }

}