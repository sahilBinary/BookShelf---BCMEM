table 50102 Data
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Number 1"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Number 2"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Number 3"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Month"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    protected var
        Codes: Codeunit functions;

    procedure IsEvenorOdd()
    begin
        Codes.checkNumber("Number 1");
    end;

    procedure CheckifPrime()
    begin
        Codes.checkPrime("Number 1");
    end;

    procedure ReverseNumber()
    begin
        Codes.reverse("Number 1");
    end;

    procedure OddSeries()
    begin
        Codes.oddSeries("Number 1");
    end;

    procedure SwapNumbers()
    begin
        Codes.swap("Number 1", "Number 2");
    end;

    procedure GreaterNumber()
    begin
        Codes.checkGreater("Number 1", "Number 2", "Number 3");
    end;

    procedure DaysInMonth()
    begin
        Codes.DaysInMonth(Month,Year);
    end;

}


