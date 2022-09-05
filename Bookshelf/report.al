report 50101 MyReport1
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';

    dataset
    {
        dataitem(DataItem1; BookSalesLines)
        {
            column(Date_of_Purchase; "Date of Purchase")
            {

            }
            column(Order_ID; "Order ID")
            {

            }
            column(Person_ID; "Person ID")
            {

            }
            column(Book_No_; "Book No.")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(LineAmount; LineAmount)
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

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var
        myInt: Integer;
}