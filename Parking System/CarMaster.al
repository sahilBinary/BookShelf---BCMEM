table 50103 "Car Master"
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
            Caption = 'Rate Per Hour';
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


}