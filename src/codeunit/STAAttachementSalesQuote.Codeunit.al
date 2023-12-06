codeunit 50101 "STA Attachement Sales Quote" implements "STA Attachement"
{
    procedure AddAttachements(var TempEmailItem: Record "Email Item" temporary; SourceRecordRef: RecordRef);
    var
        SalesHeader: Record "Sales Header";
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
    begin
        //example, only add the file for Belgium customers
        SourceRecordRef.SetTable(SalesHeader);
        if SalesHeader."Bill-to Country/Region Code" = 'BE' then begin
            TempBlob.CreateInStream(InStream);
            TempEmailItem.AddAttachment(InStream, 'BelgiumChocolate.pdf');
        end;
    end;

    procedure GetSourceDocument(PostedDocNo: Code[20]; var SourceRecordRef: RecordRef): Boolean;
    var
        SalesHeader: Record "Sales Header";
    begin
        if SalesHeader.Get(Enum::"Sales Document Type"::Quote, PostedDocNo) then
            SourceRecordRef.GetTable(SalesHeader);
    end;
}