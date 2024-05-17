page 90202 "COM Graph User License List"
{
    Caption = 'Graph User License List';
    PageType = List;
    UsageCategory = Lists;
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
                field(OfficeLocation; Rec."User Office Location")
                {
                    ApplicationArea = All;
                }
                field(DisplayName; Rec."User Display Name")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshAllUsers)
            {
                ApplicationArea = All;
                Caption = 'Refresh all Users';
                Image = CoupledUsers;

                trigger OnAction()
                var
                    GraphAPIMgt: Codeunit "COM Graph API Management";
                begin
                    GraphAPIMgt.GetAllGraphUsers();
                end;
            }
            action(UpdateSingleGraphUser)
            {
                ApplicationArea = All;
                Caption = 'Update Single Graph User';
                Image = UserSetup;

                trigger OnAction()
                var
                    GraphAPIMgt: Codeunit "COM Graph API Management";
                begin
                    GraphAPIMgt.UpdateSingleGraphUsers(Rec.ID);
                end;
            }
            action(CheckDeletedUser)
            {
                ApplicationArea = All;
                Caption = 'Check Deleted Graph User';
                Image = ViewCheck;

                trigger OnAction()
                var
                    GraphAPIMgt: Codeunit "COM Graph API Management";
                begin
                    GraphAPIMgt.CheckDeletedUser(Rec.ID);
                end;
            }
        }
    }
}