codeunit 50100 BSSI_Codeunit_Customer
{
    procedure CelebrateCustomer(MyCustomer: Record Customer; ExtraMessage: Text)
    begin
        Message('Whoa!!  We have a new Customer %1!!\\%2', MyCustomer."No.", ExtraMessage);
    end;

    //hello
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]
    local procedure MyProcedure(Rec: Record Customer)
    begin
        CelebrateCustomer(Rec, 'Congrats from codeunit 50100');
    end;


    [EventSubscriber(ObjectType::Page, page::"Business Manager Role Center", 'OnOpenPageEvent', '', true, true)]
    procedure UpdateDateCheckFields()
    var
        myrec: Record BSSI_Table_BookSalesLines;
    begin
        if myrec.BSSI_Field_DateOfPurchase = today then begin
            myrec.BSSI_Field_TodayCheck := true;
        end else begin
            myrec.BSSI_Field_TodayCheck := false;
        end;

        if ((DATE2DMY(myrec.BSSI_Field_DateOfPurchase, 2) = DATE2DMY(Today, 2))
           and (DATE2DMY(myrec.BSSI_Field_DateOfPurchase, 3) = DATE2DMY(Today, 3))) then begin
            myrec.BSSI_Field_CurrentMonthCheck := true;
        end else begin
            myrec.BSSI_Field_CurrentMonthCheck := false;
        end;
    end;

}