-- Receive the request and send a reply
DECLARE @conversation_handle UNIQUEIDENTIFIER;
DECLARE @message_body XML;
DECLARE @message_type_name sysname;

BEGIN TRANSACTION;

WAITFOR
( RECEIVE TOP(1)
    @conversation_handle = conversation_handle,
    @message_body = message_body,
    @message_type_name = message_type_name
  FROM PaymentProcess_TargetQueue
), TIMEOUT 1000;

SELECT @message_body AS ReceivedPaymentRequestMsg;

--check message type
IF (@message_type_name = N'PaymentRequestMessage')
BEGIN
     DECLARE @reply_message_body XML;

	 
--You can enter the logic to process the message here
	 SELECT @reply_message_body = N'<PaymentResponseMessage>PAYREQ001</PaymentResponseMessage>';
 
     SEND ON CONVERSATION @conversation_handle
          MESSAGE TYPE [PaymentResponseMessage]
     (@reply_message_body);
END

SELECT @reply_message_body AS PaymentResponseMessage;

COMMIT TRANSACTION;
GO


-- Check for the reply message in the initiator queue
SELECT *, CAST(message_body AS XML) AS message_body_xml
FROM PaymentProcess_InitiatorQueue;
GO