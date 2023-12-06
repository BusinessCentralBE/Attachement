codeunit 50100 "DGR Event Subscribers"
{

    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Document-Mailing", OnBeforeSendEmail, '', false, false)]
    local procedure DocumentMailing_OnBeforeSendEmail(var TempEmailItem: Record "Email Item" temporary; var IsFromPostedDoc: Boolean; var PostedDocNo: Code[20]; var HideDialog: Boolean; var ReportUsage: Integer; var EmailSentSuccesfully: Boolean; var IsHandled: Boolean)
    var
        RecordRef: RecordRef;
        AttachementImpl: Interface "DGR Attachement";
    begin
        if Enum::"DGR Attachement".Ordinals().Contains(ReportUsage) then begin
            AttachementImpl := Enum::"DGR Attachement".FromInteger(ReportUsage);
            AttachementImpl.GetSourceDocument(PostedDocNo, RecordRef);
            AttachementImpl.AddAttachements(TempEmailItem, RecordRef);
        end;
    end;
}