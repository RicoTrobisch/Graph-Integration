codeunit 90200 "COM Graph API Management"
{
    var
        JsonManagement: Codeunit "COM JSON Management";
        Helper: Codeunit "COM Helper";

    procedure GetAllGraphUsers()
    var
        GraphAPISetup: Record "COM Graph API Setup";
        MicrosoftGraphAuth: Codeunit "Graph Authorization";
        MicrosoftGraphClient: Codeunit "Graph Client";
        HttpResponseMsg: Codeunit "Http Response Message";
        AzureADTenant: Codeunit "Azure AD Tenant";
        MicrosoftGraphAuthorization: Interface "Graph Authorization";
        TenantId: Text;
        ClientId: Text;
        ClientSecret: Text;
        Scopes: Text;
    begin

        GraphAPISetup.Get();

        TenantId := AzureADTenant.GetAadTenantId();

        //Get Authorization Parameters
        ClientId := GraphAPISetup.ClientId;
        ClientSecret := GraphAPISetup."Client Secret";
        Scopes := GraphAPISetup.Scope;

        //Create Microsoft Graph Authorization
        MicrosoftGraphAuthorization := MicrosoftGraphAuth.CreateAuthorizationWithClientCredentials(TenantId, ClientId, ClientSecret, Scopes);
        //Initialize Microsoft Graph Client
        MicrosoftGraphClient.Initialize(Enum::"Graph API Version"::"v1.0", MicrosoftGraphAuthorization);
        //Create Microsoft Graph GET,PATCH,POST,DELETE
        MicrosoftGraphClient.Get('users?$select=displayName,givenName,jobTitle,mail,mobilePhone,officeLocation,preferredLanguage,surname,userPrincipalName,id,department', HttpResponseMsg);
        SaveUsers(HttpResponseMsg.GetContent().AsText(), true);
    end;


    procedure UpdateSingleGraphUsers(pid: Text)
    var
        GraphAPISetup: Record "COM Graph API Setup";
        MicrosoftGraphAuth: Codeunit "Graph Authorization";
        MicrosoftGraphClient: Codeunit "Graph Client";
        HttpResponseMsg: Codeunit "Http Response Message";
        AzureADTenant: Codeunit "Azure AD Tenant";
        MicrosoftGraphAuthorization: Interface "Graph Authorization";
        TenantId: Text;
        ClientId: Text;
        ClientSecret: Text;
        Scopes: Text;
    begin

        GraphAPISetup.Get();

        TenantId := AzureADTenant.GetAadTenantId();

        //Get Authorization Parameters
        ClientId := GraphAPISetup.ClientId;
        ClientSecret := GraphAPISetup."Client Secret";
        Scopes := GraphAPISetup.Scope;

        //Create Microsoft Graph Authorization
        MicrosoftGraphAuthorization := MicrosoftGraphAuth.CreateAuthorizationWithClientCredentials(TenantId, ClientId, ClientSecret, Scopes);
        //Initialize Microsoft Graph Client
        MicrosoftGraphClient.Initialize(Enum::"Graph API Version"::"v1.0", MicrosoftGraphAuthorization);
        //Create Microsoft Graph GET,PATCH,POST,DELETE
        MicrosoftGraphClient.Get(StrSubstNo('users/{%1}?$select=displayName,givenName,jobTitle,mail,mobilePhone,officeLocation,preferredLanguage,surname,userPrincipalName,id,department', pid), HttpResponseMsg);
        SaveUsers(HttpResponseMsg.GetContent().AsText(), false);
    end;


    local procedure SaveUsers(pHttpResponseMsg: Text; pIsBulk: Boolean)
    var
        lGraphUser: Record "COM Graph User";
        JObject: JsonObject;
        JArray: JsonArray;
        JToken: JsonToken;
        i: Integer;

    begin
        //Check Response
        if not JObject.ReadFrom(pHttpResponseMsg) then
            Error('Error read JSON');

        if pIsBulk then begin
            JArray := JsonManagement.GetJsonToken(JObject, 'value').AsArray();
            Helper.OpenDialog('Communication with Graph API', JArray.Count());
            for i := 0 to JArray.Count() - 1 do begin
                Helper.UpdateDialog(StrSubstNo('Synchronizing Graph Users %1/%2', i, JArray.Count()), i + 1, false, 1);
                JArray.Get(i, JToken);
                if not lGraphUser.Get(JsonManagement.GetStringFromJObject(JToken.AsObject(), 'id')) then begin
                    lGraphUser.Init();
                    lGraphUser.ID := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'id');
                    lGraphUser.Insert(true);
                end else begin
                    lGraphUser."Display Name" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'displayName');
                    lGraphUser."Given Name" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'givenName');
                    lGraphUser."Job Title" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'jobTitle');
                    lGraphUser.Mail := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'mail');
                    lGraphUser."Mobile Phone" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'mobilePhone');
                    lGraphUser."Office Location" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'officeLocation');
                    lGraphUser."Preferred Language" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'preferredLanguage');
                    lGraphUser.Surname := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'surname');
                    lGraphUser."User Principal Name" := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'userPrincipalName');
                    lGraphUser.Department := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'department');
                    lGraphUser."Synchronized on" := CurrentDateTime;
                    lGraphUser.Modify(true);
                    GetLicensePerUser(lGraphUser.ID);
                end;
            end;
            Helper.CloseDialog();
        end else begin
            if lGraphUser.Get(JsonManagement.GetStringFromJObject(JObject, 'id')) then begin
                lGraphUser."Display Name" := JsonManagement.GetStringFromJObject(JObject, 'displayName');
                lGraphUser."Given Name" := JsonManagement.GetStringFromJObject(JObject, 'givenName');
                lGraphUser."Job Title" := JsonManagement.GetStringFromJObject(JObject, 'jobTitle');
                lGraphUser.Mail := JsonManagement.GetStringFromJObject(JObject, 'mail');
                lGraphUser."Mobile Phone" := JsonManagement.GetStringFromJObject(JObject, 'mobilePhone');
                lGraphUser."Office Location" := JsonManagement.GetStringFromJObject(JObject, 'officeLocation');
                lGraphUser."Preferred Language" := JsonManagement.GetStringFromJObject(JObject, 'preferredLanguage');
                lGraphUser.Surname := JsonManagement.GetStringFromJObject(JObject, 'surname');
                lGraphUser."User Principal Name" := JsonManagement.GetStringFromJObject(JObject, 'userPrincipalName');
                lGraphUser.Department := JsonManagement.GetStringFromJObject(JObject, 'department');
                lGraphUser."Synchronized on" := CurrentDateTime;
                lGraphUser.Modify(true);
                GetLicensePerUser(lGraphUser.ID);
            end;
        end;
    end;

    local procedure GetLicensePerUser(pUserid: Text)
    var
        GraphAPISetup: Record "COM Graph API Setup";
        MicrosoftGraphAuth: Codeunit "Graph Authorization";
        MicrosoftGraphClient: Codeunit "Graph Client";
        HttpResponseMsg: Codeunit "Http Response Message";
        AzureADTenant: Codeunit "Azure AD Tenant";
        MicrosoftGraphAuthorization: Interface "Graph Authorization";
        TenantId: Text;
        ClientId: Text;
        ClientSecret: Text;
        Scopes: Text;
    begin

        GraphAPISetup.Get();

        TenantId := AzureADTenant.GetAadTenantId();

        //Get Authorization Parameters
        ClientId := GraphAPISetup.ClientId;
        ClientSecret := GraphAPISetup."Client Secret";
        Scopes := GraphAPISetup.Scope;

        //Create Microsoft Graph Authorization
        MicrosoftGraphAuthorization := MicrosoftGraphAuth.CreateAuthorizationWithClientCredentials(TenantId, ClientId, ClientSecret, Scopes);
        //Initialize Microsoft Graph Client
        MicrosoftGraphClient.Initialize(Enum::"Graph API Version"::"v1.0", MicrosoftGraphAuthorization);
        //Create Microsoft Graph GET,PATCH,POST,DELETE
        MicrosoftGraphClient.Get(StrSubstNo('users/{%1}/licenseDetails', pUserid), HttpResponseMsg);
        SaveLicense(HttpResponseMsg.GetContent().AsText(), pUserid);
    end;

    local procedure SaveLicense(pHttpResponseMsg: Text; pUserId: Text)
    var
        lGraphUserLicense: Record "COM Graph User License";

        JObject: JsonObject;
        JArray: JsonArray;
        JToken: JsonToken;
        i: Integer;
    begin
        //Check Response
        if not JObject.ReadFrom(pHttpResponseMsg) then
            Error('Error read JSON');

        //Delete old License information
        DeleteLicenseInformation(pUserId);

        //INsert License Information
        JArray := JsonManagement.GetJsonToken(JObject, 'value').AsArray();
        for i := 0 to JArray.Count() - 1 do begin
            JArray.Get(i, JToken);
            if not lGraphUserLicense.Get(pUserId, JsonManagement.GetStringFromJObject(JToken.AsObject(), 'skuPartNumber')) then begin
                lGraphUserLicense.Init();
                lGraphUserLicense.ID := pUserId;
                lGraphUserLicense.skuPartNumber := JsonManagement.GetStringFromJObject(JToken.AsObject(), 'skuPartNumber');
                lGraphUserLicense.Insert(true);
                lGraphUserLicense."Synchronized on" := CurrentDateTime;
                lGraphUserLicense.Modify(true);
            end;
        end;
    end;

    procedure CheckDeletedUser(pId: Text)
    var
        GraphAPISetup: Record "COM Graph API Setup";
        GraphUser: Record "COM Graph User";
        MicrosoftGraphAuth: Codeunit "Graph Authorization";
        MicrosoftGraphClient: Codeunit "Graph Client";
        HttpResponseMsg: Codeunit "Http Response Message";
        AzureADTenant: Codeunit "Azure AD Tenant";
        MicrosoftGraphAuthorization: Interface "Graph Authorization";
        TenantId: Text;
        ClientId: Text;
        ClientSecret: Text;
        Scopes: Text;
        JObject: JsonObject;
        JToken: JsonToken;
    begin

        GraphAPISetup.Get();

        TenantId := AzureADTenant.GetAadTenantId();

        //Get Authorization Parameters
        ClientId := GraphAPISetup.ClientId;
        ClientSecret := GraphAPISetup."Client Secret";
        Scopes := GraphAPISetup.Scope;

        //Create Microsoft Graph Authorization
        MicrosoftGraphAuthorization := MicrosoftGraphAuth.CreateAuthorizationWithClientCredentials(TenantId, ClientId, ClientSecret, Scopes);
        //Initialize Microsoft Graph Client
        MicrosoftGraphClient.Initialize(Enum::"Graph API Version"::"v1.0", MicrosoftGraphAuthorization);
        //Create Microsoft Graph GET,PATCH,POST,DELETE
        MicrosoftGraphClient.Get(StrSubstNo('users/{%1}', pId), HttpResponseMsg);

        //Delete User, if is doesn't exist in Graph and Call returns an error.
        JObject.ReadFrom(HttpResponseMsg.GetContent().AsText());
        If JObject.Get('error', JToken) then
            if GraphUser.Get(pId) then
                GraphUser.Delete(true);
    end;

    local procedure DeleteLicenseInformation(pUserId: Text)
    var
        lUserLicenses: Record "COM Graph User License";
    begin
        lUserLicenses.SetRange(id, pUserId);
        if lUserLicenses.FindSet() then
            lUserLicenses.DeleteAll(true);
    end;
}