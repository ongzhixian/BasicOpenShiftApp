DECLARE @message_body XML;
DECLARE @conversation_handle UNIQUEIDENTIFIER;
DECLARE @message_type_name sysname;

BEGIN TRANSACTION;

WAITFOR
( RECEIVE TOP(1)
    @conversation_handle = conversation_handle,
    @message_body = CAST(message_body AS XML),
	@message_type_name = message_type_name
  FROM PaymentProcess_InitiatorQueue
), TIMEOUT 1000;

IF (@message_type_name = N'PaymentResponseMessage')
BEGIN
	END CONVERSATION @conversation_handle;
END

SELECT @message_body AS ReceivedPaymentResponseMessage;

COMMIT TRANSACTION;
GO

--Check for EndDialog message in TargetQueue
SELECT *, CAST(message_body AS XML) AS message_body_xml
FROM PaymentProcess_TargetQueue;
GO

