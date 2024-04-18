page 90203 "COM Graph User Card"
{
    ApplicationArea = All;
    Caption = 'Graph User Card';
    PageType = Card;
    SourceTable = "COM Graph User";
    PromotedActionCategories = 'New,Process,Report,Personio,API';
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                }
                field("Display Name"; Rec."Display Name")
                {
                }
                field("Given Name"; Rec."Given Name")
                {
                }
                field(Surname; Rec.Surname)
                {
                }
                field("User Principal Name"; Rec."User Principal Name")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field(Mail; Rec.Mail)
                {
                }
                field("Mobile Phone"; Rec."Mobile Phone")
                {
                }
                field("Office Location"; Rec."Office Location")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Preferred Language"; Rec."Preferred Language")
                {
                }
                field("Synchronized on"; Rec."Synchronized on")
                {
                    ApplicationArea = All;
                }
            }
            part(UserLicensesPart; "COM Graph User License Subpage")
            {
                ApplicationArea = All;
                SubPageLink = id = field(id);
            }
        }

    }
}
