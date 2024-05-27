-- Receive the End Dialog and clean up
DECLARE @conversation_handle UNIQUEIDENTIFIER;
DECLARE @message_body XML;
DECLARE @message_type_name sysname;

BEGIN TRANSACTION;

WAITFOR
( RECEIVE TOP(1)
    @conversation_handle = conversation_handle,
    @message_body = CAST(message_body AS XML),
    @message_type_name = message_type_name
  FROM PaymentProcess_TargetQueue
), TIMEOUT 1000;

--check if message type is EndDialog
IF (@message_type_name = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog')
BEGIN
     END CONVERSATION @conversation_handle;
END

COMMIT TRANSACTION;
GO

-- Check for a message in the target queue
SELECT *, CAST(message_body AS XML) AS message_body_xml
FROM PaymentProcess_TargetQueue;
GO

-- Check for a  message in the initiator queue
SELECT *, CAST(message_body AS XML) AS message_body_xml
FROM PaymentProcess_InitiatorQueue;
GO