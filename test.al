//data types
// Objects (page, table)
//arithmatics with data types #############################
//Control flow statementsnm ###################################
//arrays #############################################
//loops ###############################################
//functions, methods, return types

//Videos on Pages Tables


// Language Elements
// code -> converted to uppercase and removes any trailing or leading spaces.


codeunit 50109 Counter
{
    trigger OnRun()
    var
        l1: List of [Integer];
        l2: List of [Integer];
        index: Integer;
        Ok: Boolean;
        num: Integer;
        myarr: array[20] of Codeunit 50109;
    begin
        index := l1.IndexOf(50);
        Message('ArrayLen(myarr) = %1', ArrayLen(myarr));
        Ok:= l1.Get(2,num);
        l2 := l1.GetRange(2,19);
    end;
}