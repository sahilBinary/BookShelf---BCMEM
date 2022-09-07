query 50100 BSSI_Query_BooksRead
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
            dataitem(PurchasedHistory; BSSI_Table_BookOrders)
            {
                DataItemLink = BSSI_Field_PersonID = Customer."No.";
                SqlJoinType = InnerJoin;
                // column(Amount; Amount)
                // {

                // }
            }
        }
    }

}