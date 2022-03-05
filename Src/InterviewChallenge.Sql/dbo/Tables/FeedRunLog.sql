CREATE TABLE [dbo].[FeedRunLog] (
    [Id]                        BIGINT          NOT NULL IDENTITY (1, 1),
    [SyndicationSourceId]       INT             NOT NULL,
    [FeedPayload]               VARCHAR (MAX)   NULL,
    [HttpStatus]                INT             NOT NULL,
    [ContentLength]             BIGINT          NOT NULL,
    [DateCreated]               DATETIME2       NOT NULL DEFAULT (GetUtcDate()),

    CONSTRAINT [PK_dbo.FeedRunLog]
        PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.FeedRunLog_Feed]
        FOREIGN KEY ([SyndicationSourceId])
        REFERENCES [dbo].[SyndicationSource] ([Id])
);

GO
CREATE NONCLUSTERED INDEX [IX_FeedRunLog_HttpStatusSyndicationSourceId] 
    ON [dbo].[FeedRunLog] ([DateCreated] DESC, [HttpStatus] ASC, [SyndicationSourceId] ASC)
