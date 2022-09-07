report 50101 BSSI_Report_BookSales
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Bookshelf/Reports/MyRDLReport.rdl';

    dataset
    {
        dataitem(DataItem1; BSSI_Table_BookSalesLines)
        {
            column(Date_of_Purchase; BSSI_Field_DateOfPurchase)
            {

            }
            column(Order_ID; BSSI_Field_OrderID)
            {

            }
            column(Person_ID; BSSI_Field_PersonID)
            {

            }
            column(Book_No_; BSSI_Field_BookNo)
            {

            }
            column(Quantity; BSSI_Field_Quantity)
            {

            }
            column(LineAmount; BSSI_Field_LineAmount)
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }

    }

    var
        myInt: Integer;
}