table 50106 ParkingInfo
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CarNo; Code[20])
        {
            Caption = 'Car No';
            DataClassification = ToBeClassified;
        }
        field(2; CarId; Code[20])
        {
            Caption = 'Car Id';
            TableRelation = VehicleMaster;
            DataClassification = ToBeClassified;
        }
        field(3; CheckIn; Time)
        {
            Caption = 'Check In Time';
            DataClassification = ToBeClassified;
        }
        field(4; CheckOut; Time)
        {
            Caption = 'Check Out Time';
            DataClassification = ToBeClassified;
        }
        field(5; ParkedTime; Duration)
        {
            Caption = 'Parked Time';
            DataClassification = ToBeClassified;
        }
        field(6; TotalFare; Decimal)
        {
            Caption = 'Total Fare ($)';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; CarNo)
        {
        }
        key(sec; CheckIn)
        {
            //ordering by checkin time
            Clustered = true;
        }
    }


    procedure InsertCheckIn(var myRec: Record ParkingInfo)
    var
        myRec2: Record ParkingInfo;
        myRec1: Record VehicleMaster;
    begin
        myrec2.Init();
        myRec2.TransferFields(myRec);
        myRec2.Insert();

        myRec1.Get(myRec.CarId);
        myRec1.AvailableParking := myRec1.AvailableParking -1;
        myRec1.Modify();
    end;

    procedure FillDetails(var myrec: Record ParkingInfo)
    var
        Rec2: Record ParkingInfo;
    begin
        Rec2.Get(Rec.CarNo);
        myrec.CheckIn := Rec2.CheckIn;
        myrec.CarId := Rec2.CarId;
    end;

    procedure CalcData(var myRec: Record ParkingInfo)
    var
        Rec2: Record ParkingInfo;
        Rec3: Record VehicleMaster;
        interval: Duration;
        hours: Decimal;
    begin
        Rec2.Get(myRec.CarNo);
        Rec3.Get(myRec.CarId);
        interval := myRec.CheckOut - Rec2.CheckIn;

        myRec.ParkedTime := interval;
        myRec.TotalFare := (interval / 3600000) * Rec3.RatePerHour;
    end;

    procedure UpdateRecord(var myRec: Record ParkingInfo)
    var
        Rec1: Record ParkingInfo;
        Rec2: Record VehicleMaster;
    begin
        Rec1.Get(myRec.CarNo);
        Rec2.Get(myRec.CarId);
        Rec1.CheckOut := myRec.CheckOut;
        Rec1.ParkedTime := myRec.ParkedTime;
        Rec1.TotalFare := myRec.TotalFare;
        Rec2.AvailableParking := Rec2.AvailableParking + 1;

        Rec1.Modify();
        Rec2.Modify();
    end;
}