table 50105 "VehicleMaster"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CarID; Code[20])
        {
            Caption = 'Car ID';
            DataClassification = ToBeClassified;
        }
        field(2; CarType; Text[50])
        {
            Caption = 'Car Type';
            DataClassification = ToBeClassified;

        }
        field(3; TotalParkingSlots; Integer)
        {
            Caption = 'Total Parking Slots';
            DataClassification = ToBeClassified;

        }
        field(4; AvailableParking; Integer)
        {
            Caption = 'Available Parking';
            DataClassification = ToBeClassified;

        }
        field(5; RatePerHour; Decimal)
        {
            Caption = 'Rate Per Hour ($)';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; CarID)
        {
            Clustered = true;
        }
    }

    procedure InsertValues(var myRec: Record VehicleMaster)
    var
        punch: Record VehicleMaster;
    begin
        //punch.LockTable();
        punch.Get(myRec.CarID);
        punch.TotalParkingSlots := myRec.TotalParkingSlots;
        punch.AvailableParking := myRec.AvailableParking;
        punch.Modify();
        //Message('punch.totalparking = %1, punch.availparking = %2',punch.TotalParkingSlots,punch.AvailableParking);

    end;

}