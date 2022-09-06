query 50100 MyQuery
{
    QueryType = Normal;
    Caption = 'Top Book Reader';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {

            }
            column(No; "No.")
            {

            }
            column(FavBook; "Favourite Book Name")
            {

            }
            dataitem(PurchasedHistory; BooksPurchase)
            {
                DataItemLink = "Person ID" = Customer."No.";
                SqlJoinType = InnerJoin;
                // column(Amount; Amount)
                // {

                // }
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}

page 50113 TestCard
{
    Caption = 'Test Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Execute Query")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    myQuery.Open();
                    while myQuery.Read() do begin
                        //Message('Name: %1, No.: %2, Fav Book: %3, Amount: %4', myQuery.Name, myQuery.No, myQuery.FavBook, myQuery.Amount);
                    end;
                end;
            }
            action("Execute simple xmlport")
            {
                ApplicationArea = all;
                trigger onAction()
                begin
                    Xmlport.Run(50100);
                end;
            }
            action("xmlport contacts")
            {
                ApplicationArea = All;
                Image = XMLFile;

                trigger OnAction()
                begin
                    Xmlport.Run(50102);
                end;
            }
            action(ExportToXml)
            {
                Caption = 'Export to XML';
                ApplicationArea = All;
                Image = XMLFile;

                trigger OnAction()
                var
                    booklistXml: XmlPort "booklist XML";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutStr);
                    booklistXml.SetDestination(OutStr);
                    booklistXml.Export();
                    TempBlob.CreateInStream(InStr);
                    FileName := 'Customers.xml';
                    File.DownloadFromStream(InStr, 'Download', '',
                                            '', FileName);
                end;
            }
        }
    }
    var
        myQuery: Query MyQuery;
}

codeunit 50102 TestCodeunit
{

    [BusinessEvent(true)]
    procedure testProc()
    begin
        // Message('testProc runs');
    end;


}
codeunit 50103 MyCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::TestCodeunit, 'testProc', '', true, true)]
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

}