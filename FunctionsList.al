page 50108 FunctionsList
{


    PageType = List;
    SourceTable = Functions;
    CardPageId = FunctionsCard;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(FID; Rec.FID)
                {
                    ApplicationArea = All;

                }
                field(Function; Rec.Function)
                {
                    //Caption = 'General Description of the function/action you want to use';
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

}