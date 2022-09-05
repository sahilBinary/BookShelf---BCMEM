table 50107 BookSalesLines
{
    Caption = 'Book Sales Lines';
    DataClassification = CustomerContent;
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
            //DataClassification = ToBeClassified;
            FieldClass = FlowField;
            CalcFormula = lookup(BooksPurchase."Date of Purchase" where("Order ID" = field("Order ID")));
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
    SourceTableTemporary = true;
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
                    Visible = false;
                }
                field("Date"; Rec."Date of Purchase")
                {
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Book No."; Rec."Book No.")
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var
                        myRec: Record BookSalesLines;
                        text001: Label 'Sales line with Book No: %1 already present.';
                    begin
                        if Rec.Get(Rec."Order ID", Rec."Book No.") then begin
                            Message(text001, Rec."Book No.");
                            Rec."Book No." := xRec."Book No.";
                        end;
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
                    Editable = false;
                }


            }
        }

    }
    // procedure GetRecords(): Record BookSalesLines
    // var
    //     returnvalue: Record BookSalesLines;
    // begin
    //     Rec.FindFirst();
    //     repeat begin
    //         //Message('Rec."Order ID" = %1, Rec."Book No." = %2, Rec.count = %3',Rec."Order ID",Rec."Book No.",Rec.Count());
    //     end until Rec.next() = 0;
    //     exit(Rec);
    // end;

    procedure PunchRecord()
    var
        punch1: Record BookSalesLines;
        myrec: Record BooksPurchase;
    begin
        Rec.FindFirst();
        repeat begin
            punch1.Init();
            myrec.Get(Rec."Order ID");
            punch1.TransferFields(Rec);
            /////
            punch1."Person ID" := myrec."Person ID";
            punch1."Date of Purchase" := myrec."Date of Purchase";
            /////
            punch1.Insert();
            punch1.Reset();
        end until Rec.Next() = 0;
    end;


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
                field("Date"; rec."Date of Purchase")
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
}


page 50118 BookSalesListPartPerm
{
    Caption = 'Book Sales Lines';
    PageType = ListPart;
    SourceTable = BookSalesLines;
    UsageCategory = Administration;
    //ApplicationArea = All;
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
                field("Date"; rec."Date of Purchase")
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

}
