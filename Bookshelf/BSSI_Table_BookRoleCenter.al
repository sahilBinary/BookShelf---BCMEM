table 50109 BSSI_Table_BookRoleCenter
{
    DataClassification = CustomerContent;
    // flow field on flow field error
    fields
    {
        field(1; PK; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; BSSI_Field_TotalBooksSold; Integer)
        {
            Caption = 'Books Sold';
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_Quantity where(BSSI_Field_Status = const("Order Confirmed")));
            //CalcFormula = sum(BSSI_Table_Book.BSSI_Field_QuantitySold);
        }
        field(3; BSSI_Field_OrdersPlaced; Integer)
        {
            Caption = 'Orders Placed';
            FieldClass = FlowField;
            CalcFormula = count(BSSI_Table_BookOrders);
        }
        field(4; BSSI_Field_OpenOrders; Integer)
        {
            Caption = 'Open Orders';
            FieldClass = FlowField;
            CalcFormula = count(BSSI_Table_BookOrders where(BSSI_Field_Status = const(Open)));
        }
        field(5; BSSI_Field_ConfirmedOrders; Integer)
        {
            Caption = 'Confirmed Orders';
            FieldClass = FlowField;
            CalcFormula = count(BSSI_Table_BookOrders where(BSSI_Field_Status = const("Order Confirmed")));
        }
        field(6; BSSI_Field_TotalBookSales; Decimal)
        {
            Caption = 'Total Book Sales';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_Status = const("Order Confirmed")));
        }
        field(7; BSSI_Field_BookSalesToday; Decimal)
        {
            Caption = 'Book Sales Today';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_Status = const("Order Confirmed"),BSSI_Field_TodayCheck = const(true)));
        }
        field(8; BSSI_Field_BookSalesCurrMonth; Decimal)
        {
            Caption = 'Book Sales This Month';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_Status = const("Order Confirmed"), BSSI_Field_CurrentMonthCheck = const(true)));
        }
        field(9; BSSI_Field_PotentialSales; Decimal)
        {
            Caption = 'Potential Book Sales';
            AutoFormatExpression = GetAmountFormat;
            AutoFormatType = 11;
            DecimalPlaces = 0 : 0;
            FieldClass = FlowField;
            CalcFormula = sum(BSSI_Table_BookSalesLines.BSSI_Field_LineAmount where(BSSI_Field_Status = const(Open)));
        }

    }

    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }
    procedure GetAmountFormat(): Text
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        UserPersonalization: Record "User Personalization";
        CurrencySymbol: Text[10];
    begin
        GeneralLedgerSetup.Get();
        CurrencySymbol := GeneralLedgerSetup.GetCurrencySymbol;

        if UserPersonalization.Get(UserSecurityId) and (CurrencySymbol <> '') then
            case UserPersonalization."Locale ID" of
                1030, // da-DK
              1053, // sv-Se
              1044: // no-no
                    exit('<Precision,0:0><Standard Format,0>' + CurrencySymbol);
                2057, // en-gb
              1033, // en-us
              4108, // fr-ch
              1031, // de-de
              2055, // de-ch
              1040, // it-it
              2064, // it-ch
              1043, // nl-nl
              2067, // nl-be
              2060, // fr-be
              3079, // de-at
              1035, // fi
              1034: // es-es
                    exit(CurrencySymbol + '<Precision,0:0><Standard Format,0>');
            end;

        exit(GetDefaultAmountFormat);
    end;

    local procedure GetDefaultAmountFormat(): Text
    begin
        exit('$<Precision,0:0><Standard Format,0>');
    end;

    var
        mydate: Date;
        myd: text;

    trigger OnInsert()
    var
        myInt: Integer;
    begin
        mydate := today;
    end;




}