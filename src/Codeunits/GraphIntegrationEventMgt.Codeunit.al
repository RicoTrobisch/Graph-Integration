codeunit 90203 "COM Graph Integration Mgt."
{
    [EventSubscriber(ObjectType::Table, Database::"COM Graph User", OnAfterDeleteEvent, '', false, false)]
    local procedure TabGraphUserOnAfterDelete(var Rec: Record "COM Graph User"; RunTrigger: Boolean)
    var
        lGraphUserLicense: Record "COM Graph User License";
    begin
        if not RunTrigger then
            exit;

        lGraphUserLicense.SetRange(id, Rec.ID);
        if lGraphUserLicense.FindSet() then
            lGraphUserLicense.Delete();
    end;
}