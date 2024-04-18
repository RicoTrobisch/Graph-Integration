codeunit 90201 "COM JSON Management"
{
    var
        TokenNotFoundErr: Label 'Token %1 not found';

    procedure GetJsonToken(JsonObject: JsonObject; TokenKey: Text) JsonToken: JsonToken;
    begin
        if not JsonObject.Get(TokenKey, JsonToken) then
            Error(TokenNotFoundErr, TokenKey);
    end;

    procedure GetStringFromJObject(JsonObjectIn: JsonObject; TokenKey: Text): Text
    var
        JsonTokenResultValue: JsonToken;
    begin
        if not JsonObjectIn.SelectToken(TokenKey, JsonTokenResultValue) then
            exit('');

        if JsonTokenResultValue.AsValue().IsNull() then
            exit('');

        exit(JsonTokenResultValue.AsValue().AsText());
    end;

}