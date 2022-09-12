pageextension 50101 BSSI_PageExt_RoleCenter extends "Business Manager Role Center"
{
    layout
    {
        addafter(Control139)
        {
            part(BSSI_Page_HeadLinePart_RC;BSSI_Page_HeadLinePart_RC)
            {
                ApplicationArea = all;
            }
        }
        addbefore(Control16)
        {
            part(BookRoleCenter; BSSI_Page_CardPart_BookRoleCen)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        addafter(Customers)
        {
            action(BookList)
            {
                ApplicationArea = all;
                Caption = 'Books';
                RunObject = Page BSSI_Page_List_Book;
                ToolTip = 'View or Edit the Book List';
            }
        }
        addbefore("Sales Quote")
        {
            action("AddBook")
            {
                ApplicationArea = all;
                Caption = 'Add Book';
                Image = NewOrder;
                RunObject = Page BSSI_Page_Card_Book;
                RunPageMode = Create;
                ToolTip = 'Add new book to your inventory';
            }
            action("CreatOrder")
            {
                ApplicationArea = all;
                Caption = 'Book Order';
                Image = NewOrder;
                RunObject = Page BSSI_Page_Card_BookOrders;
                RunPageMode = Create;
                ToolTip = 'Create a new Book Order';
            }

        }

    }

}