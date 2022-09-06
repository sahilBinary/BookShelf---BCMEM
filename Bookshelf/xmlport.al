xmlport 50100 "Export/Import Book List"
{
    schema
    {
        textelement(BookList)
        {
            tableelement(Book; Book)
            {

                fieldelement(BookNo; Book."No.")
                {

                }
                fieldelement(BookTitle; Book.Title)
                {

                }
                fieldelement(Author; Book.Author)
                {

                }
                fieldelement(PageCount; Book."Page Count")
                {

                }
                fieldelement(Price; Book.Price)
                {

                }
                fieldelement(Hardcover; Book.Hardcover)
                {

                }
            }

        }

    }
    var
        text001: Label 'Import/Export Book List';
}


xmlport 50101 BookSalesOrder
{
    FileName = 'Book_Sales_Order.xml';
    //UseRequestPage = false;

    schema
    {
        textelement(SalesOrder)
        {
            tableelement(BookOrder; BooksPurchase)
            {
                fieldelement(orderID; BookOrder."Order ID") { }
                fieldelement(PersonID; BookOrder."Person ID") { }
                fieldelement(DateOfPurchase; BookOrder."Date of Purchase") { }
                tableelement(BookSalesLine; BookSalesLines)
                {
                    AutoSave = true;
                    LinkTable = BookOrder;
                    LinkFields = "Order ID" = field("Order ID");
                    fieldelement(BookNo; BookSalesLine."Book No.") { }
                    fieldelement(Quantity; BookSalesLine.Quantity) { }
                    //fieldelement(LineAmount; BookSalesLine.LineAmount) { }
                }
            }

        }
    }

}


xmlport 50102 "ExportNewContact"
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

xmlport 50103 "BookList XML"
{
    Caption = 'BookList XML';
    Direction = Export;
    Format = Xml;

    schema
    {
        textelement(Root)
        {
            XmlName = 'Root';
            tableelement(Book; Book)
            {
                fieldattribute(BookNo; Book."No.") { }
                fieldelement(Title; Book.Title) { }
                fieldelement(Author; Book.Author) { }
                textelement(Details)
                {
                    XmlName = 'Details';
                    fieldelement(pagecount; Book."Page Count") { }
                    fieldelement(Price; Book.Price) { }
                    fieldelement(Hardcover; Book.Hardcover) { }
                }
            }
        }
    }
}

