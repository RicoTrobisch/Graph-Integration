codeunit 90202 "COM Helper"
{
    trigger Onrun()
    begin

    end;

    PROCEDURE OpenDialog(pDialogText: Text; pRecCounter: Integer);
    BEGIN
        IF pRecCounter = 0 THEN
            EXIT;

        gCounter := 0;
        IF GUIALLOWED() THEN BEGIN
            gDialog.OPEN(pDialogText + '...' +
                         '\#1############################' +
                         '\@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
            gFactor := 9999 / pRecCounter;
        END;
    END;

    PROCEDURE UpdateDialog(pUpdateText: Text; pUpdateStep: Integer; pDoCommit: Boolean; pDoCommitMultiplier: Integer);
    VAR
        lDoUpdate: Boolean;
        lDoCommit: Boolean;
    BEGIN
        gCounter += 1;

        lDoUpdate := gCounter MOD pUpdateStep = 0;
        IF NOT lDoUpdate THEN
            EXIT;

        IF GUIALLOWED() THEN
            IF (pUpdateStep > 0) AND lDoUpdate THEN BEGIN
                gDialog.UPDATE(1, pUpdateText);
                gDialog.UPDATE(2, (gCounter * gFactor) DIV 1);
            END;


        IF NOT pDoCommit THEN
            EXIT;

        lDoCommit := gCounter MOD (pUpdateStep * pDoCommitMultiplier) = 0;
        IF pDoCommit AND lDoCommit THEN
            COMMIT();
    END;

    PROCEDURE CloseDialog();
    BEGIN
        IF GUIALLOWED() THEN
            gDialog.CLOSE();
    END;

    procedure GetPercentage(pCounter: Integer; pTotalCount: Integer): Integer
    begin
        exit(Round((pCounter / pTotalCount) * 100, 1, '='));
    end;

    var
        gFactor: Decimal;
        gcounter: Integer;
        gDialog: Dialog;



    procedure ConvertListToText(pList: List of [Text]; pDelimiter: Text) rText: Text
    var
        lCounter: Integer;
    begin

        rText += pList.Get(1);

        for lCounter := 2 to pList.Count() do
            rText += StrSubstNo('%1%2', pDelimiter, pList.Get(lCounter));

    end;
}