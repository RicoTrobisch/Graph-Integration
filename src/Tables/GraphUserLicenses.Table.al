table 90202 "COM Graph User License"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "id"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "skuPartNumber"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Synchronized on"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "User Office Location"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("COM Graph User"."Office Location" where(ID = field(id)));
        }
        field(11; "User Display Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("COM Graph User"."Display Name" where(ID = field(id)));
        }

    }

    keys
    {
        key(PK; "id", skuPartNumber)
        {
            Clustered = true;
        }
    }

}