page 90200 "COM Graph API Setup Card"
{
    Caption = 'Graph API Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "COM Graph API Setup";
    PromotedActionCategories = 'New,Process,Report,Personio,API';
    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(ClientId; Rec.ClientId)
                {
                    ApplicationArea = All;
                }
                field("Client Secret"; Rec."Client Secret")
                {
                    ApplicationArea = All;
                }
                field(Scope; Rec.Scope)
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
    trigger OnInit()
    begin
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}