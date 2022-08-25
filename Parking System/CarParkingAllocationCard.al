page 50106 "Car Parking Allocation"
{
    Caption = 'Car Parking Allocation';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Car Master";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CarID; MyCar.CarID)
                {
                    ApplicationArea = All;
                    TableRelation = "Car Master";
                    trigger OnValidate()
                    var
                        Ok: Boolean;
                    begin
                        Ok := Rec.Get(MyCar.CarID);
                    end;
                }
                field(CarType; Rec.CarType)
                {
                    ApplicationArea = All;
                    // TableRelation = "Car Master";
                }

                field(TotalParkingSlots; MyCar.TotalParkingSlots)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.TotalParkingSlots := MyCar.TotalParkingSlots;
                    end;
                }
                field(AvailableParking; MyCar.AvailableParking)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.AvailableParking := MyCar.AvailableParking;
                    end;
                }

            }
        }
    }

    var
        MyCar: Record "Car Master";
        newrec: Record "Car Master";

}