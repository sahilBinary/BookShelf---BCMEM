page 50107 "Car Type Master"
{
    Caption = 'Car Type Master';
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
                field(CarID; rec.CarID)
                {
                
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myRec: Record "Car Master";
                    begin
                        if myRec.Get(Rec.CarID) then begin
                            //Message('Record with Car ID = %1 already exists. Please use a different Car ID', Rec.CarID);
                            //Rec.CarID := xrec.CarID;
                        end;
                    end;
                }
                field(CarType; rec.CarType)
                {
                    ApplicationArea = All;
                }
                field(RatePerHour; rec.RatePerHour)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}