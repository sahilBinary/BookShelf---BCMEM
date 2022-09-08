pageextension 50101 BSSI_PageExt_RoleCenter extends "Business Manager Role Center"
{
    layout
    {
        addbefore(Control16)
        {
            part(BookRoleCenter; BSSI_Page_CardPart_BookRoleCen)
            {
                ApplicationArea = all;
            }
        }
    }

}