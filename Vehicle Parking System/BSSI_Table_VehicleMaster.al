table 50105 "BSSI_Table_VehicleMaster"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BSSI_Field_CarID; Code[20])
        {
            Caption = 'Car ID';
            DataClassification = ToBeClassified;
        }
        field(2; BSSI_Field_CarType; Text[50])
        {
            Caption = 'Car Type';
            DataClassification = ToBeClassified;
        }
        field(3; BSSI_Field_TotalParkingSlots; Integer)
        {
            Caption = 'Total Parking Slots';
            DataClassification = ToBeClassified;
        }
        field(4; BSSI_Field_AvailableParking; Integer)
        {
            Caption = 'Available Parking';
            DataClassification = ToBeClassified;
        }
        field(5; BSSI_Field_RatePerHour; Decimal)
        {
            Caption = 'Rate Per Hour ($)';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; BSSI_Field_CarID)
        {
            Clustered = true;
        }
    }

    procedure InsertValues(var myRec: Record BSSI_Table_VehicleMaster)
    var
        punch: Record BSSI_Table_VehicleMaster;
    begin
        //punch.LockTable();
        punch.Get(myRec.BSSI_Field_CarID);
        punch.BSSI_Field_TotalParkingSlots := myRec.BSSI_Field_TotalParkingSlots;
        punch.BSSI_Field_AvailableParking := myRec.BSSI_Field_AvailableParking;
        punch.Modify();
    end;

}