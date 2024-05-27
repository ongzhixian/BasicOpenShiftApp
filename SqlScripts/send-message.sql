-- INITIATE DIALOG 

DECLARE @conversation_handle UNIQUEIDENTIFIER;
DECLARE @message_body XML;

BEGIN TRANSACTION;


--Begin conversation
BEGIN DIALOG @conversation_handle
    FROM SERVICE [PaymentProcess_InitiatorService]
    TO SERVICE N'PaymentProcess_TargetService'
    ON CONTRACT [PaymentProcessContract]
    WITH ENCRYPTION = OFF;

SELECT @message_body = N'<PaymentRequestMessage>PAYREQ001</PaymentRequestMessage>';

--send message on conversation using the same GUID
SEND ON CONVERSATION @conversation_handle
	MESSAGE TYPE [PaymentRequestMessage]
	(@message_body);

COMMIT TRANSACTION;
GO


SELECT *, CAST(message_body AS XML) AS message_body_xml
FROM PaymentProcess_TargetQueue
;