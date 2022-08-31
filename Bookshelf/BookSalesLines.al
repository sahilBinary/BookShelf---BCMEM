table 50107 BookSalesLines
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Order ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Person ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Book No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Book;
        }
        field(4; "Quantity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Date of Purchase"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "LineAmount"; Decimal)
        {
            Caption = 'Line Amount ($)';
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(PK; "Order ID", "Book No.")
        {
            Clustered = true;
        }
    }
    // procedure ConfirmPurchase(var myRec: Record BooksPurchase)
    // var
    //     punch: record BooksPurchase;
    // begin
    //     punch.Init();
    //     punch.TransferFields(myRec);
    //     punch.Insert();
    // end;

    // procedure CalcAmount(var myrec: record BooksPurchase)
    // var
    //     MyBook: Record Book;
    // begin
    //     MyBook.Get(myrec."Book No.");
    //     rec.Amount := myrec.Quantity * MyBook.Price;
    // end;


}

page 50116 BookSalesListPartList
{
    Caption = 'Book Sales List Part';
    PageType = ListPart;
    SourceTable = BookSalesLines;
    // SourceTableTemporary = true;
    UsageCategory = Administration;
    //ApplicationArea = All;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order ID"; rec."Order ID")
                {
                    ApplicationArea = All;
                }
                field("Person ID"; Rec."Person ID")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Book No."; Rec."Book No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec2: Record BooksPurchase;
                    begin
                        myRec2.Get(Rec."Order ID");
                        Rec."Person ID" :=  myRec2."Person ID";
                    end;
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record Book;
                        myRec2: Record BooksPurchase;
                    begin
                        myRec.Get(Rec."Book No.");
                        rec.LineAmount := rec.Quantity * myRec.Price;
                        
                        //myRec2.Get(Rec."Order ID");
                        //Rec."Person ID" :=  myRec2."Person ID";
                    end;
                }
                field("Line Amount"; Rec.LineAmount)
                {
                    Caption = ' Line Amount ($)';
                    ApplicationArea = all;
                }


            }
        }

    }
    // procedure GetRecords(): Record BookSalesLines
    // var
    //     myRec: Record BookSalesLines;
    // begin
    //     myRec.SetFilter("Order ID", '=%1', Rec."Order ID");
    //     if myRec.FindSet() then begin
    //         repeat begin
    //             Message('myRec."Order ID" = %1, myRec."Book No" = %2, myRec.Quantity = %3',myRec."Order ID", myRec."Book No.",myRec.Quantity);
    //         end until myRec.Next() = 0;
    //     end else begin
    //         Message('myRec.Findset() failed');
    //     end;
    //     exit(myRec);
    // end;


}



page 50117 BookSalesList
{
    Caption = 'Book Sales Lines';
    PageType = List;
    SourceTable = BookSalesLines;
    UsageCategory = Administration;
    ApplicationArea = All;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Order ID"; rec."Order ID")
                {
                    ApplicationArea = All;
                }
                field("Person ID"; rec."Person ID")
                {
                    ApplicationArea = All;
                }
                field("Book No."; Rec."Book No.")
                {
                    ApplicationArea = all;
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = all;
                }
                field("Line Amount"; Rec.LineAmount)
                {
                    Caption = ' Line Amount ($)';
                    ApplicationArea = all;
                }


            }
        }

    }
    // procedure GetRecords(): Record BookSalesLines
    // var
    //     myRec: Record BookSalesLines;
    // begin
    //     myRec.SetFilter("Order ID", '=%1', Rec."Order ID");
    //     if myRec.FindSet() then begin
    //         repeat begin
    //             Message('myRec."Order ID" = %1, myRec."Book No" = %2, myRec.Quantity = %3',myRec."Order ID", myRec."Book No.",myRec.Quantity);
    //         end until myRec.Next() = 0;
    //     end else begin
    //         Message('myRec.Findset() failed');
    //     end;
    //     exit(myRec);
    // end;


}
