page 50114 CheckOutCard
{
    Caption = 'Check Out Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ParkingInfo;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CarNo; rec.CarNo)
                {
                    TableRelation = ParkingInfo;
                    ApplicationArea = all;
                    ToolTip = 'Enter your Car No';
                    trigger OnValidate()
                    begin
                        Rec.FillDetails(Rec);
                    end;
                }
                field(CarId; rec.CarId)
                {
                    TableRelation = VehicleMaster;
                    ApplicationArea = all;
                    Editable = false;
                }
                field(CheckIn; rec.CheckIn)
                {
                    ApplicationArea = all;
                    ToolTip = 'Your Check In Time';
                    Editable = false;
                }
                field(CheckOut; rec.CheckOut)
                {
                    Caption = 'Check Out Time';
                    ApplicationArea = all;
                    ToolTip = 'Enter Check Out Time';
                    trigger OnValidate()
                    begin
                        rec.CalcData(rec);
                    end;
                }
                field(ParkedTime; rec.ParkedTime)
                {
                    Caption = 'Parked Time';
                    ApplicationArea = all;
                    ToolTip = 'Your parked time based on the Check out time entered';
                    Editable = false;
                }
                field(TotalFare; rec.TotalFare)
                {
                    Caption = 'Total Fare ($)';
                    ToolTip = 'Total Fare';
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
            action("Confirm Check Out")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.UpdateRecord(Rec);
                end;
            }
        }
    }

}