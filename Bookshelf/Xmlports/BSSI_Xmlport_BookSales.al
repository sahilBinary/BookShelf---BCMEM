xmlport 50101 BSSI_Xmlport_BookSales
{
    //UseRequestPage = false;

    schema
    {
        textelement(SalesOrder)
        {
            tableelement(BookOrder; BSSI_Table_BookOrders)
            {
                fieldelement(OrderID; BookOrder.BSSI_Field_OrderID) { }
                fieldelement(PersonID; BookOrder.BSSI_Field_PersonID) { }
                fieldelement(DateOfPurchase; BookOrder.BSSI_Field_DateOfPurchase) { }
                tableelement(BookSalesLine; BSSI_Table_BookSalesLines)
                {
                    AutoSave = true;
                    LinkTable = BookOrder;
                    LinkFields = BSSI_Field_OrderID = field(BSSI_FIeld_OrderID);
                    fieldelement(BookNo; BookSalesLine.BSSI_Field_BookNo) { }
                    fieldelement(Quantity; BookSalesLine.BSSI_Field_Quantity) { }
                }
            }

        }
    }

}