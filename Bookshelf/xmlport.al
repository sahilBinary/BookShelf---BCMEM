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
                // tableelement(BookSalesLines;BookSalesLines)
                // {
                //     LinkTable = Book;
                //     LinkFields = "Book No." = field("No.");
                //     fieldelement(OrderID;BookSalesLines."Order ID")
                //     {

                //     }
                // }
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


    // requestpage
    // {
    //     layout
    //     {
    //         area(content)
    //         {
    //             group(GroupName)
    //             {
    //             field(BookNo; Book."No.")
    //             {
    //                 ApplicationArea = all;
    //             }
    //             field(BookTitle; Book.Title)
    //             {
    //                 ApplicationArea = all;
    //             }
    //             field(Author; Book.Author)
    //             {
    //                 ApplicationArea = all;
    //             }
    //             field(PageCount; Book."Page Count")
    //             {
    //                 ApplicationArea = all;
    //             }
    //             field(Price; Book.Price)
    //             {
    //                 ApplicationArea = all;
    //             }
    //             field(Hardcover; Book.Hardcover)
    //             {
    //                 ApplicationArea = all;
    //             }
    //         }
    //     }
    // }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {

    //             }
    //         }
    //     }
    //

    var
        text001: Label 'Import/Export Book List';
}


xmlport 50101 BookSalesOrder
{
    schema
    {
        textelement(SalesOrder)
        {
            tableelement(BookOrder; BooksPurchase)
            {
                fieldelement(orderID;BookOrder."Order ID"){}
                fieldelement(PersonID; BookOrder."Order ID"){}
                fieldelement(DateOfPurchase;BookOrder."Date of Purchase"){}

                tableelement(BookSalesLine;BookSalesLines)
                {
                    LinkTable = BookOrder;
                    LinkFields = "Order ID" = field("Order ID");
                    fieldelement(DateOfPurchase;BookSalesLine."Date of Purchase"){}
                    fieldelement(BookNo;BookSalesLine."Book No."){}
                    fieldelement(Quantity;BookSalesLine.Quantity){}
                    fieldelement(LineAmount;BookSalesLine.LineAmount){}
                }
            }

        }
    }
    
    var
        myInt: Integer;
}