page 50114 CheckOutCard
{
    Caption = 'Check Out Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BSSI_Table_ParkingInfo;
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(BSSI_Field_CarNo; rec.BSSI_Field_CarNo)
                {
                    TableRelation = BSSI_Table_ParkingInfo;
                    ApplicationArea = all;
                    ToolTip = 'Specifies the Car No';
                    trigger OnValidate()
                    begin
                        Rec.FillDetails(Rec);
                    end;
                }
                field(BSSI_Field_CarId; rec.BSSI_Field_CarId)
                {
                    TableRelation = BSSI_Table_VehicleMaster;
                    ApplicationArea = all;
                    Editable = false;
                }
                field(BSSI_Field_CheckIn; rec.BSSI_Field_CheckIn)
                {
                    ApplicationArea = all;
                    ToolTip = 'Your Check In Time';
                    Editable = false;
                }
                field(BSSI_Field_CheckOut; rec.BSSI_Field_CheckOut)
                {
                    Caption = 'Check Out Time';
                    ApplicationArea = all;
                    ToolTip = 'Enter Check Out Time';
                    trigger OnValidate()
                    begin
                        rec.CalcData(rec);
                    end;
                }
                field(BSSI_Field_ParkedTime; rec.BSSI_Field_ParkedTime)
                {
                    Caption = 'Parked Time';
                    ApplicationArea = all;
                    ToolTip = 'Your parked time based on the Check out time entered';
                    Editable = false;
                }
                field(BSSI_Field_TotalFare; rec.BSSI_Field_TotalFare)
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
            action(CheckOut)
            {
                Caption = 'Punch Check out Time';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.UpdateRecord(Rec);
                end;
            }
        }
    }

}