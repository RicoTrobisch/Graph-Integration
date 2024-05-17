table 90200 "COM Graph API Setup"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Code"; Code[10])
        {

            DataClassification = ToBeClassified;
        }
        field(2; "ClientId"; Text[100])
        {

            DataClassification = ToBeClassified;
        }
        field(3; "Client Secret"; Text[100])
        {

            DataClassification = ToBeClassified;
        }
        field(4; "Scope"; Text[100])
        {

            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

}
