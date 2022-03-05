CREATE TABLE [dbo].[SyndicationFeed]
(
    [Id]                    BIGINT          NOT NULL IDENTITY (1, 1),
    [SyndicationSourceId]   INT             NOT NULL,
    [IsActive]              BIT             NOT NULL DEFAULT (1),

    -- Begin Feed Data
    [Sha512]                VARCHAR  (128)  NOT NULL,
    [SourceId]              VARCHAR  (512)  NOT NULL,
    [ChannelId]             VARCHAR  (32)   NULL,
    [VideoId]               VARCHAR  (32)   NULL,
    [Title]                 NVARCHAR (1024) NOT NULL,
    [Summary]               NVARCHAR (MAX)  NULL,
    [Description]           NVARCHAR (MAX)  NULL,
    [Author]                NVARCHAR (128)  NULL,
    [Link]                  VARCHAR  (512)  NULL,
    [Enclosure]             VARCHAR  (512)  NULL,
    [ContentEncoded]        NVARCHAR (MAX)  NULL,
    [Thumbnail]             VARCHAR  (512)  NULL,
    [PublishedDate]         DATETIME2       NULL,
    [PublishedDateUpdated]  DATETIME2       NULL,
    -- End Feed Data
    
    [LastUpdated]           DATETIME2       NOT NULL DEFAULT (GetUtcDate()),
    [DateCreated]           DATETIME2       NOT NULL DEFAULT (GetUtcDate())

    CONSTRAINT [PK_dbo.SyndicationFeed] 
        PRIMARY KEY CLUSTERED ([Id] ASC), 
    CONSTRAINT [FK_SyndicationFeed_SyndicationSource] 
        FOREIGN KEY ([SyndicationSourceId]) REFERENCES [SyndicationSource]([Id]), 
)

GO

CREATE INDEX [IX_SyndicationFeed_Sha512] ON [dbo].[SyndicationFeed] ([Sha512])

GO

CREATE INDEX [IX_SyndicationFeed_DateCreate] ON [dbo].[SyndicationFeed] ([DateCreated], [IsActive])

GO

CREATE INDEX [IX_SyndicationFeed_Title] ON [dbo].[SyndicationFeed] ([Title])

GO

CREATE INDEX [IX_SyndicationFeed_Author] ON [dbo].[SyndicationFeed] ([Author])