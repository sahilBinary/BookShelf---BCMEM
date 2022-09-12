page 50113 BSSI_Page_Card_Test
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
            action(BSSI_Query_BooksRead)
            {
                Caption = 'Execute Query: BooksRead';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    myQuery.Open();
                    while myQuery.Read() do begin
                        Message('Name: %1, No.: %2, Fav Book: %3, Amount: %4', myQuery.Name, myQuery.No, myQuery.FavBook);
                    end;
                end;
            }
            action(BSSI_Xmlport_BookList_1)
            {
                Caption = 'Import/Export BookList 1';
                ApplicationArea = all;
                trigger onAction()
                begin
                    Xmlport.Run(50100);
                end;
            }
            action(BSSI_Xmlport_BookList_2)
            {
                Caption = 'Import/Export BookList 2';
                ApplicationArea = all;
                trigger onAction()
                begin
                    Xmlport.Run(50103);
                end;
            }
            action(BSSI_Xmlport_ExportNewContact)
            {
                Caption = 'Export New Contacts';
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
                    booklistXml: XmlPort BSSI_Xmlport_BookList_2;
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
            action(OpenRoleCenterPage)
            {
                ApplicationArea = All;
                Caption = 'Open Role Center Page';
                trigger OnAction()
                var
                    myPage:Page "Business Manager Role Center";
                    mycode:Codeunit BSSI_Codeunit_Customer;
                begin
                    mycode.UpdateDateCheckFields();
                end;
            }
        }
    }
    var
        myQuery: Query BSSI_Query_BooksRead;
}