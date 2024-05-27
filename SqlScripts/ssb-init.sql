-- https://chaitanyasuvarna.wordpress.com/2020/08/23/sql-server-service-broker/
CREATE DATABASE PaymentProcessing;

ALTER DATABASE PaymentProcessing
	SET ENABLE_BROKER
	WITH ROLLBACK IMMEDIATE;


CREATE MESSAGE TYPE [PaymentRequestMessage]
    VALIDATION = WELL_FORMED_XML;

CREATE MESSAGE TYPE [PaymentResponseMessage]
    VALIDATION = WELL_FORMED_XML;

CREATE CONTRACT [PaymentProcessContract]
(
	[PaymentRequestMessage]		SENT BY INITIATOR
	, [PaymentResponseMessage]	SENT BY TARGET
);

CREATE QUEUE PaymentProcess_TargetQueue;

CREATE QUEUE PaymentProcess_InitiatorQueue;

CREATE SERVICE [PaymentProcess_TargetService]
	ON QUEUE PaymentProcess_TargetQueue
	([PaymentProcessContract]);

CREATE SERVICE [PaymentProcess_InitiatorService]
    ON QUEUE PaymentProcess_InitiatorQueue
    ([PaymentProcessContract]);

