table 50116 Functions
{
    DataClassification = ToBeClassified;
    fields
    {
        field(3; "Number 1"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Number 2"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Number 3"; Integer)
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


}


