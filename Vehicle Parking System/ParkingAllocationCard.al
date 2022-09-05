page 50106 ParkingAllocationMaster
{
    Caption = 'Parking Allocation Master';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = VehicleMaster;
    SourceTableTemporary = true; // Temporary table

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CarID; Rec.CarID)
                {
                    TableRelation = VehicleMaster;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myrec:Record VehicleMaster;
                    begin
                        myrec.Get(rec.CarID);
                        rec.CarType := myrec.CarType;
                    end;
                }
                field(CarType; Rec.CarType)
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field(TotalParkingSlots; Rec.TotalParkingSlots)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myRec: Record VehicleMaster;
                    begin
                        //check logic again
                        myRec.Get(Rec.CarID);
                        rec.AvailableParking := rec.TotalParkingSlots - (myRec.TotalParkingSlots - myRec.AvailableParking);
                    end;
                }
                field(AvailableParking; Rec.AvailableParking)
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