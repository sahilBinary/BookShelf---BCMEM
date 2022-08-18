codeunit 50100 CustomerCode
{
    procedure CelebrateCustomer(MyCustomer: Record Customer; ExtraMessage: Text)
    begin
        Message('Whoa!!  We have a new Customer %1!!\\%2', MyCustomer."No.", ExtraMessage);
    end;



    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterInsertEvent', '', true, true)]
    local procedure MyProcedure(Rec: Record Customer)
    begin
        CelebrateCustomer(Rec, 'Congrats from the codeunit');
    end;

}


//data types
//arithmatics with data types
//Control flow statements
//arrays
//loops
//functions, methods, return types