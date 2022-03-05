CREATE TABLE [dbo].[SyndicationSource] (
    [Id]                INT             NOT NULL IDENTITY (1, 1),
    [IsActive]          BIT             NOT NULL DEFAULT (1),
    [IntervalSeconds]   INT             NOT NULL DEFAULT (1800),
    [Title]             NVARCHAR (128)  NOT NULL,
    [BaseUri]           VARCHAR  (512)  NOT NULL,
    [Copyright]         VARCHAR  (32)   NULL,
    [Description]       VARCHAR  (MAX)  NULL,
    [LastRunDate]       DATETIME2       NULL,
    [DateCreated]       DATETIME2       NOT NULL DEFAULT (GetUtcDate()),
    [LastUpdated]       DATETIME2       NOT NULL DEFAULT (GetUtcDate()),

    CONSTRAINT [PK_dbo.SyndicationSource] 
        PRIMARY KEY CLUSTERED ([Id] ASC)
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationSource_BaseUri] 
    ON [dbo].[SyndicationSource]([BaseUri] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_SyndicationSource_BaseUri_IsActive] 
    ON [dbo].[SyndicationSource]([BaseUri] ASC, [IsActive] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_SyndicationSource_Title_IsActive] 
    ON [dbo].[SyndicationSource]([Title] ASC, [IsActive] ASC);

