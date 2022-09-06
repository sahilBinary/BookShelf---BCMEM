page 50109 BSSI_Page_Card_CheckIn
{
    Caption = 'Check In Card';
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
                field(BSSI_Field_Date; rec.BSSI_Field_Date)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarId; rec.BSSI_Field_CarId)
                {
                    ApplicationArea = All;
                }
                field(BSSI_Field_CarNo; rec.BSSI_Field_CarNo)
                {
                    ApplicationArea = all;
                }
                field(BSSI_Field_CheckIn; Rec.BSSI_Field_CheckIn)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PunchCheckInCard)
            {
                Caption = 'Punch Check In Time';
                ApplicationArea = All;

                trigger OnAction()
                var

                begin
                    Rec.InsertCheckIn(Rec);
                end;
            }
        }
    }

}