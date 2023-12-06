interface "STA Attachement"
{

    /// <summary>
    /// Add attachements to the e-mail message.
    /// </summary>
    /// <param name="TempEmailItem"></param>
    /// <param name="SourceRecordRef"></param>
    procedure AddAttachements(var TempEmailItem: Record "Email Item" temporary; SourceRecordRef: RecordRef);

    /// <summary>
    /// Get the releated source document and assign it to the recordref parameter.
    /// Gives a boolean result if the source document is found.
    /// </summary>
    /// <param name="PostedDocNo"></param>
    /// <param name="SourceRecordRef"></param>
    /// <returns></returns>
    procedure GetSourceDocument(PostedDocNo: Code[20]; var SourceRecordRef: RecordRef): Boolean;

}