table 90201 "COM Graph User"
{
    Caption = 'Graph User';
    DrillDownPageId = "COM Graph User List";
    LookupPageId = "COM Graph User Card";


    fields
    {
        field(1; "ID"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(2; "Display Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Given Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Job Title"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Mail"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(6; "Mobile Phone"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(7; "Office Location"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(8; "Preferred Language"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(9; "Surname"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(10; "User Principal Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(11; "Department"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Synchronized on"; DateTime)
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "ID")
        {
            Clustered = true;
        }
    }
}
