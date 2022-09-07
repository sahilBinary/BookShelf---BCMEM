xmlport 50102 BSSI_Xmlport_ExportNewContact
{
    Caption = 'Export Contact';
    Direction = Export;
    Format = Xml;
    // TableSeparator = '<NewLine>';
    // TextEncoding = UTF8;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'ContactHeader';
                SourceTableView = sorting(Number) where(Number = const(1));
                textelement(ContNoTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ContNoTitle := Contact.FieldCaption("No.");
                    end;
                }
                textelement(ContNameTitle)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ContNameTitle := Contact.FieldCaption(Name);
                    end;
                }
                textelement("ContE-MailTitle")
                {
                    trigger OnBeforePassVariable()
                    begin
                        "ContE-MailTitle" := Contact.FieldCaption("E-Mail");
                    end;
                }
            }
            tableelement(Contact; Contact)
            {
                RequestFilterFields = "No.";
                XmlName = 'Contact';
                fieldelement(No; Contact."No.")
                {
                }
                fieldelement(Name; Contact.Name)
                {
                }
                fieldelement("E-Mail"; Contact."E-Mail")
                {
                }
            }
        }
    }
}