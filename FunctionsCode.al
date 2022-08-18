codeunit 50110 functions
{


    procedure checkNumber(myInt: Integer)
    begin
        
        if myInt < 0 then begin
            Message('The Number %1 is not a valid input', myInt);
        end;
        if (myInt mod 2 = 0) then begin
            Message('The Number %1 is Even', myInt);
        end else begin
            Message('The Number %1 is Odd', myInt);
        end;
    end;



    procedure checkPrime(myInt: Integer)
    var
        Count: Integer;
        Check: Boolean;
    begin
        Check := true;
        for Count := 2 to (myInt - 1) do begin
            if ((myInt mod Count) = 0) then begin
                Check := false;
            end;
        end;
        if (check) then begin
            Message('The Number %1 is Prime', myInt);
        end else begin
            Message('The Number %1 is not Prime', myInt);
        end;
    end;

    procedure checkGreater(myInt1: Integer; myInt2: Integer; myInt3: Integer)
    var
        temp: Integer;
    begin
        temp := myInt1;
        if (myInt2 > myInt1) then begin
            temp := myInt1;
        end;
        if (myInt3 > temp) then begin
            temp := myInt3;
        end;

        Message('The greater number out of %1, %2 and %3 is %4', myInt1, myInt2, myInt3, temp);

    end;

    procedure swap(myInt1: Integer; myInt2: Integer)
    var
        temp: Integer;
    begin
        Message('Before Swapping: %1, %2', myInt1, myInt2);
        temp := myInt1;
        myInt1 := myInt2;
        myInt2 := temp;
        Message('After Swapping: %1, %2', myInt1, myInt2);
    end;

    procedure oddSeries(myInt: Integer)
    var
        Count: Integer;
        Mean: Decimal;
        Variance: Decimal;
        n: Integer;
        Sequence: array[100] of Integer;
        l1: list of [Integer];
    begin
        Mean := 0;
        n := 0;
        for Count := 1 to myInt do begin
            if (Count mod 2 <> 0) then begin
                Mean += Count;
                //Sequence[n] := Count;
                l1.Add(Count);
                n += 1;
                //Message('%1',Count);
            end;
        end;
        Mean := Mean / n;
        Variance := 0;
        for Count := 1 to myInt do begin
            if (Count mod 2 <> 0) then begin
                Variance += (Count - Mean) * (Count - Mean);
            end;
        end;
        Variance := Variance / (n - 1);
        if (myInt mod 2 = 0) then begin
            myInt := myInt - 1;
        end;
        Message('Sequence of numbers: 1, 3 .. %1 \\ Adjusted Variance: %2', myInt, Variance);
    end;

    procedure reverse(myInt: Integer)
    var
        tempInt: Integer;
        temp: Integer;
        reversedNumber: Integer;
        remainder: Integer;
        orignal: Integer;

    begin
        orignal := myInt;
        while (tempInt > 0) do begin
            temp := tempInt mod 10;
            tempInt := (tempInt - temp) / 10;
        end;
        reversedNumber := 0;
        while (myInt <> 0) do begin
            remainder := myInt mod 10;
            reversedNumber := reversedNumber * 10 + remainder;
            myInt := (myInt - (myInt mod 10)) / 10;
        end;
        Message('Orignal No: %1 \\ Reversed No: %2', orignal, reversedNumber);

    end;

}