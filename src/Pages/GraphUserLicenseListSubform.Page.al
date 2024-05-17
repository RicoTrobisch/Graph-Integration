page 90204 "COM Graph User License Subpage"
{
    Caption = 'Graph User Licenses';
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "COM Graph User License";
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(skuPartNumber; Rec.skuPartNumber)
                {
                    ApplicationArea = All;
                }
                field("Synchronized on"; Rec."Synchronized on")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

        }
    }
}