table 50106 BSSI_Table_ParkingInfo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; BSSI_Field_Date; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(2; BSSI_Field_CarNo; Code[20])
        {
            Caption = 'Car No';
            DataClassification = ToBeClassified;
        }
        field(3; BSSI_Field_CarId; Code[20])
        {
            Caption = 'Car Id';
            TableRelation = BSSI_Table_VehicleMaster;
            DataClassification = ToBeClassified;
        }
        field(4; BSSI_Field_CheckIn; Time)
        {
            Caption = 'Check In Time';
            DataClassification = ToBeClassified;
        }
        field(5; BSSI_Field_CheckOut; Time)
        {
            Caption = 'Check Out Time';
            DataClassification = ToBeClassified;
        }
        field(6; BSSI_Field_ParkedTime; Duration)
        {
            Caption = 'Parked Time';
            DataClassification = ToBeClassified;
        }
        field(7; BSSI_Field_TotalFare; Decimal)
        {
            Caption = 'Total Fare ($)';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; BSSI_Field_CarNo)
        {
        }
        key(sec; BSSI_Field_CheckIn)
        {
            //ordering by checkin time
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; BSSI_Field_CarId, BSSI_Field_CarNo, BSSI_Field_CheckIn, BSSI_Field_CheckOut)
        {
        }
    }
    procedure InsertCheckIn(var myRec: Record BSSI_Table_ParkingInfo)
    var
        myRec2: Record BSSI_Table_ParkingInfo;
        myRec1: Record BSSI_Table_VehicleMaster;
        myrec3: Record BSSI_Table_CheckIn;
    begin
        //parking info table
        myrec2.Init();
        myRec2.TransferFields(myRec);
        myRec2.Insert();
        //check in table
        // myrec3.Init();
        // myRec3.BSSI_Field_CarId := myRec.BSSI_Field_CarId;
        // myRec3.Insert();

        myRec1.Get(myRec.BSSI_Field_CarId);
        myRec1.BSSI_Field_AvailableParking := myRec1.BSSI_Field_AvailableParking - 1;
        myRec1.Modify();
    end;

    procedure FillDetails(var myrec: Record BSSI_Table_ParkingInfo)
    var
        Rec2: Record BSSI_Table_ParkingInfo;
    begin
        Rec2.Get(Rec.BSSI_Field_CarNo);
        myrec.BSSI_Field_CheckIn := Rec2.BSSI_Field_CheckIn;
        myrec.BSSI_Field_CarId := Rec2.BSSI_Field_CarId;
    end;

    procedure CalcData(var myRec: Record BSSI_Table_ParkingInfo)
    var
        Rec2: Record BSSI_Table_ParkingInfo;
        Rec3: Record BSSI_Table_VehicleMaster;
        interval: Duration;
        hours: Decimal;
    begin
        Rec2.Get(myRec.BSSI_Field_CarNo);
        Rec3.Get(myRec.BSSI_Field_CarId);
        interval := myRec.BSSI_Field_CheckOut - Rec2.BSSI_Field_CheckIn;

        myRec.BSSI_Field_ParkedTime := interval;
        myRec.BSSI_Field_TotalFare := (interval / 3600000) * Rec3.BSSI_Field_RatePerHour;
    end;

    procedure UpdateRecord(var myRec: Record BSSI_Table_ParkingInfo)
    var
        Rec1: Record BSSI_Table_ParkingInfo;
        Rec2: Record BSSI_Table_VehicleMaster;
    begin
        Rec1.Get(myRec.BSSI_Field_CarNo);
        Rec2.Get(myRec.BSSI_Field_CarId);
        Rec1.BSSI_Field_CheckOut := myRec.BSSI_Field_CheckOut;
        Rec1.BSSI_Field_ParkedTime := myRec.BSSI_Field_ParkedTime;
        Rec1.BSSI_Field_TotalFare := myRec.BSSI_Field_TotalFare;
        Rec2.BSSI_Field_AvailableParking := Rec2.BSSI_Field_AvailableParking + 1;

        Rec1.Modify();
        Rec2.Modify();
    end;
}