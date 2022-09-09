page 50116 BSSI_Page_ListPart_BookSales
{
    Caption = 'Book Sales List Part';
    PageType = ListPart;
    SourceTable = BSSI_Table_BookSalesLines;
    SourceTableTemporary = true;
    UsageCategory = Administration;
    //ApplicationArea = All;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(BSSI_Field_OrderID; rec.BSSI_Field_OrderID)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(BSSI_Field_PersonID; Rec.BSSI_Field_PersonID)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Visible = false;
                }
                field(BSSI_Field_DateOfPurchase; Rec.BSSI_Field_DateOfPurchase)
                {
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field(BSSI_Field_BookNo; Rec.BSSI_Field_BookNo)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record BSSI_Table_BookSalesLines;
                        text001: Label 'Sales line with Book No: %1 already present.';
                    begin
                        if Rec.Get(Rec.BSSI_Field_OrderID, Rec.BSSI_Field_BookNo) then begin
                            Message(text001, Rec.BSSI_Field_BookNo);
                            Rec.BSSI_Field_BookNo := xRec.BSSI_Field_BookNo;
                        end;
                    end;
                }
                field(BSSI_Field_Quantity; Rec.BSSI_Field_Quantity)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record BSSI_Table_Book;
                        myRec2: Record BSSI_Table_BookOrders;
                    begin
                        myRec.Get(Rec.BSSI_Field_BookNo);
                        rec.BSSI_Field_LineAmount := rec.BSSI_Field_Quantity * myRec.BSSI_Field_Price;

                    end;
                }
                field(BSSI_Field_LineAmount; Rec.BSSI_Field_LineAmount)
                {
                    Caption = ' Line Amount ($)';
                    ApplicationArea = all;
                    Editable = false;
                }


            }
        }

    }

    procedure PunchRecord()
    var
        punch1: Record BSSI_Table_BookSalesLines;
        myrec: Record BSSI_Table_BookOrders;
        myrec1: Record BSSI_Table_Book;
    begin
        Rec.FindFirst();
        repeat begin
            punch1.Init();
            myrec.Get(Rec.BSSI_Field_OrderID);
            punch1.TransferFields(Rec);
            /////
            punch1.BSSI_Field_PersonID := myrec.BSSI_Field_PersonID;
            punch1.BSSI_Field_DateOfPurchase := myrec.BSSI_Field_DateOfPurchase;
            /////
            punch1.Insert();
            punch1.Reset();
        end until Rec.Next() = 0;
    end;
}