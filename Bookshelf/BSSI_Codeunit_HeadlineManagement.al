codeunit 50103 "Headline Management"
{
    trigger OnRun()
    begin

    end;

    procedure Emphasize(PayloadText: Text): Text
    begin
        exit(PayloadText)
    end;

    procedure GetHeadlineText(QualifierText: Text; PayloadText: Text; var FirstInsightText: Text)
    var
        myrec: Record BSSI_Table_Book;
        myint: Integer;
        Title: Text;
        bookNo: Code[20];
    begin
        bookNo := findMaxBooksSold();
        if myrec.Get(bookNo) then begin
            myint := myrec.BSSI_Field_QuantitySold;
            Title := myrec.BSSI_Field_Title;
        end;
        FirstInsightText := PayloadText + Title + ' with ' + '' + QualifierText;
    end;

    procedure findMaxBooksSold(): Code[20]
    var
        maxQuantity: Integer;
        bookNo: Code[20];
        myrec: Record BSSI_Table_Book;
    begin
        myrec.FindSet();
        maxQuantity := 0;
        Message('qty sold = %1', myrec.BSSI_Field_QuantitySold);
        repeat begin
            if myrec.BSSI_Field_QuantitySold > maxQuantity then begin
                maxQuantity := myrec.BSSI_Field_QuantitySold;
                bookNo := myrec.BSSI_Field_BookNo;
                Message('bookNo = %1', bookNo);
            end;
        end until myrec.Next() = 0;
        exit(bookNo)
    end;


}