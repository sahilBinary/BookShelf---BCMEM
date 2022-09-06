table 50108 BSSI_Table_CheckIn
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
        field(5; BSSI_Field_ParkedTime; Duration)
        {
            Caption = 'Parked Time';
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
        fieldgroup(DropDown; BSSI_Field_CarId, BSSI_Field_CarNo, BSSI_Field_CheckIn)
        {
        }
    }



}