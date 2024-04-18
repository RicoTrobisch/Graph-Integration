table 90202 "COM Graph User License"
{
    DataClassification = ToBeClassified;

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

    }

    keys
    {
        key(PK; "id", skuPartNumber)
        {
            Clustered = true;
        }
    }

}