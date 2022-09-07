codeunit 50102 BSSI_Codeunit_Test
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::BSSI_Codeunit_Test, 'testProc', '', true, true)]
    procedure MyProcedure()
    var
        myInt: Integer;
    begin
        Message('Event published,subscribed to and raised successfully');
    end;

    trigger OnRun()
    var
        varXmlFile: File;
        varOutputStream: OutStream;
        varInputStream: InStream;
    begin
        // varXmlFile.CREATE(“FilePath\myXmlfile.xml”);
        // varXmlFile.CREATEOUTSTREAM(varOutputStream);
        // XMLPORT.EXPORT(XMLPORT::XMLportName, varOutputStream);
        // varXmlFile.CLOSE;
    end;

    [BusinessEvent(true)]
    procedure testProc()
    begin
        // Message('testProc runs');
    end;

}