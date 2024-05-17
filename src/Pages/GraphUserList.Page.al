page 90201 "COM Graph User List"
{
    Caption = 'Graph User List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "COM Graph User";
    PromotedActionCategories = 'New,Process,Report,Personio,API';
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    CardPageId = "COM Graph User Card";

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
                field("Display Name"; Rec."Display Name")
                {
                    ApplicationArea = All;
                }
                field("Given Name"; Rec."Given Name")
                {
                    ApplicationArea = All;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("User Principal Name"; Rec."User Principal Name")
                {
                    ApplicationArea = All;
                }
                field("Mail"; Rec.Mail)
                {
                    ApplicationArea = All;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Preferred Language"; Rec."Preferred Language")
                {
                    ApplicationArea = All;
                }
                field("Synchronized on"; Rec."Synchronized on")
                {
                    ApplicationArea = All;
                }
                field("Office Location"; Rec."Office Location")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
            part("COM Graph User License Factbox"; "COM Graph User License Factbox")
            {
                ApplicationArea = all;
                SubPageLink = id = field(ID);
            }
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
            action(OpenLicenseList)
            {
                Caption = 'Open License List';
                ApplicationArea = All;
                Image = PreviewChecks;
                RunObject = page "COM Graph User License List";
                RunPageLink = id = field(ID);
            }
        }
    }
}