codeunit 50100 "STA Event Subscribers"
{

    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeSendEmail, '', false, false)]
    local procedure DocumentMailing_OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean)
    var
        RecordRef: RecordRef;
        AttachementImpl: Interface "STA Attachement";
    begin
        if Enum::"STA Attachement".Ordinals().Contains(ReportUsage) then begin
            AttachementImpl := Enum::"STA Attachement".FromInteger(ReportUsage);
            AttachementImpl.GetSourceDocument(PostedDocNo, RecordRef);
            AttachementImpl.AddAttachements(TempEmailItem, RecordRef);
        end;
    end;
}