/*
    Deployment script for InterviewChallenge
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


CREATE DATABASE [InterviewChallenge]
GO

USE [InterviewChallenge];
GO

PRINT N'Creating Table [dbo].[Category]...';


GO
CREATE TABLE [dbo].[Category] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [IsActive] BIT            NOT NULL,
    [Name]     NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_dbo._Category] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[Category].[UX_Category_Name]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Category_Name]
    ON [dbo].[Category]([Name] ASC);


GO
PRINT N'Creating Table [dbo].[FeedRunLog]...';


GO
CREATE TABLE [dbo].[FeedRunLog] (
    [Id]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [SyndicationSourceId] INT           NOT NULL,
    [FeedPayload]         VARCHAR (MAX) NULL,
    [HttpStatus]          INT           NOT NULL,
    [ContentLength]       BIGINT        NOT NULL,
    [DateCreated]         DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_dbo.FeedRunLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[FeedRunLog].[IX_FeedRunLog_HttpStatusSyndicationSourceId]...';


GO
CREATE NONCLUSTERED INDEX [IX_FeedRunLog_HttpStatusSyndicationSourceId]
    ON [dbo].[FeedRunLog]([DateCreated] DESC, [HttpStatus] ASC, [SyndicationSourceId] ASC);


GO
PRINT N'Creating Table [dbo].[SyndicationFeed]...';


GO
CREATE TABLE [dbo].[SyndicationFeed] (
    [Id]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [SyndicationSourceId]  INT             NOT NULL,
    [IsActive]             BIT             NOT NULL,
    [Sha512]               VARCHAR (128)   NOT NULL,
    [SourceId]             VARCHAR (512)   NOT NULL,
    [ChannelId]            VARCHAR (32)    NULL,
    [VideoId]              VARCHAR (32)    NULL,
    [Title]                NVARCHAR (1024) NOT NULL,
    [Summary]              NVARCHAR (MAX)  NULL,
    [Description]          NVARCHAR (MAX)  NULL,
    [Author]               NVARCHAR (128)  NULL,
    [Link]                 VARCHAR (512)   NULL,
    [Enclosure]            VARCHAR (512)   NULL,
    [ContentEncoded]       NVARCHAR (MAX)  NULL,
    [Thumbnail]            VARCHAR (512)   NULL,
    [PublishedDate]        DATETIME2 (7)   NULL,
    [PublishedDateUpdated] DATETIME2 (7)   NULL,
    [LastUpdated]          DATETIME2 (7)   NOT NULL,
    [DateCreated]          DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_dbo.SyndicationFeed] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[SyndicationFeed].[IX_SyndicationFeed_Sha512]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationFeed_Sha512]
    ON [dbo].[SyndicationFeed]([Sha512] ASC);


GO
PRINT N'Creating Index [dbo].[SyndicationFeed].[IX_SyndicationFeed_DateCreate]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationFeed_DateCreate]
    ON [dbo].[SyndicationFeed]([DateCreated] ASC, [IsActive] ASC);


GO
PRINT N'Creating Index [dbo].[SyndicationFeed].[IX_SyndicationFeed_Title]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationFeed_Title]
    ON [dbo].[SyndicationFeed]([Title] ASC);


GO
PRINT N'Creating Index [dbo].[SyndicationFeed].[IX_SyndicationFeed_Author]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationFeed_Author]
    ON [dbo].[SyndicationFeed]([Author] ASC);


GO
PRINT N'Creating Table [dbo].[SyndicationFeedToCategory]...';


GO
CREATE TABLE [dbo].[SyndicationFeedToCategory] (
    [Id]                UNIQUEIDENTIFIER NOT NULL,
    [SyndicationFeedId] BIGINT           NOT NULL,
    [CategoryId]        INT              NOT NULL,
    CONSTRAINT [PK_dbo.SyndicationFeedToCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[SyndicationFeedToCategory].[UX_SyndicationFeedToCategory_FeedIdCategoryId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationFeedToCategory_FeedIdCategoryId]
    ON [dbo].[SyndicationFeedToCategory]([SyndicationFeedId] ASC, [CategoryId] ASC);


GO
PRINT N'Creating Table [dbo].[SyndicationSource]...';


GO
CREATE TABLE [dbo].[SyndicationSource] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [IsActive]        BIT            NOT NULL,
    [IntervalSeconds] INT            NOT NULL,
    [Title]           NVARCHAR (128) NOT NULL,
    [BaseUri]         VARCHAR (512)  NOT NULL,
    [Copyright]       VARCHAR (32)   NULL,
    [Description]     VARCHAR (MAX)  NULL,
    [LastRunDate]     DATETIME2 (7)  NULL,
    [DateCreated]     DATETIME2 (7)  NOT NULL,
    [LastUpdated]     DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dbo.SyndicationSource] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[SyndicationSource].[UX_SyndicationSource_BaseUri]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationSource_BaseUri]
    ON [dbo].[SyndicationSource]([BaseUri] ASC);


GO
PRINT N'Creating Index [dbo].[SyndicationSource].[IX_SyndicationSource_BaseUri_IsActive]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationSource_BaseUri_IsActive]
    ON [dbo].[SyndicationSource]([BaseUri] ASC, [IsActive] ASC);


GO
PRINT N'Creating Index [dbo].[SyndicationSource].[IX_SyndicationSource_Title_IsActive]...';


GO
CREATE NONCLUSTERED INDEX [IX_SyndicationSource_Title_IsActive]
    ON [dbo].[SyndicationSource]([Title] ASC, [IsActive] ASC);


GO
PRINT N'Creating Table [dbo].[SyndicationToCategory]...';


GO
CREATE TABLE [dbo].[SyndicationToCategory] (
    [Id]                  UNIQUEIDENTIFIER NOT NULL,
    [SyndicationSourceId] INT              NOT NULL,
    [CategoryId]          INT              NOT NULL,
    CONSTRAINT [PK_dbo.SyndicationToCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating Index [dbo].[SyndicationToCategory].[UX_SyndicationToCategory_SourceIdCategoryId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationToCategory_SourceIdCategoryId]
    ON [dbo].[SyndicationToCategory]([SyndicationSourceId] ASC, [CategoryId] ASC);


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[Category]...';


GO
ALTER TABLE [dbo].[Category]
    ADD DEFAULT (1) FOR [IsActive];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[FeedRunLog]...';


GO
ALTER TABLE [dbo].[FeedRunLog]
    ADD DEFAULT (GetUtcDate()) FOR [DateCreated];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationFeed]...';


GO
ALTER TABLE [dbo].[SyndicationFeed]
    ADD DEFAULT (1) FOR [IsActive];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationFeed]...';


GO
ALTER TABLE [dbo].[SyndicationFeed]
    ADD DEFAULT (GetUtcDate()) FOR [LastUpdated];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationFeed]...';


GO
ALTER TABLE [dbo].[SyndicationFeed]
    ADD DEFAULT (GetUtcDate()) FOR [DateCreated];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationFeedToCategory]...';


GO
ALTER TABLE [dbo].[SyndicationFeedToCategory]
    ADD DEFAULT (NewSequentialId()) FOR [Id];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationSource]
    ADD DEFAULT (1) FOR [IsActive];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationSource]
    ADD DEFAULT (1800) FOR [IntervalSeconds];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationSource]
    ADD DEFAULT (GetUtcDate()) FOR [DateCreated];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationSource]
    ADD DEFAULT (GetUtcDate()) FOR [LastUpdated];


GO
PRINT N'Creating Default Constraint unnamed constraint on [dbo].[SyndicationToCategory]...';


GO
ALTER TABLE [dbo].[SyndicationToCategory]
    ADD DEFAULT (NewSequentialId()) FOR [Id];


GO
PRINT N'Creating Foreign Key [dbo].[FK_dbo.FeedRunLog_Feed]...';


GO
ALTER TABLE [dbo].[FeedRunLog] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.FeedRunLog_Feed] FOREIGN KEY ([SyndicationSourceId]) REFERENCES [dbo].[SyndicationSource] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_SyndicationFeed_SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationFeed] WITH NOCHECK
    ADD CONSTRAINT [FK_SyndicationFeed_SyndicationSource] FOREIGN KEY ([SyndicationSourceId]) REFERENCES [dbo].[SyndicationSource] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_dbo.SyndicationFeedToCategory_SyndicationFeed]...';


GO
ALTER TABLE [dbo].[SyndicationFeedToCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.SyndicationFeedToCategory_SyndicationFeed] FOREIGN KEY ([SyndicationFeedId]) REFERENCES [dbo].[SyndicationFeed] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_dbo.SyndicationFeedToCategory_Category]...';


GO
ALTER TABLE [dbo].[SyndicationFeedToCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.SyndicationFeedToCategory_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_dbo.SyndicationToCategory_SyndicationSource]...';


GO
ALTER TABLE [dbo].[SyndicationToCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.SyndicationToCategory_SyndicationSource] FOREIGN KEY ([SyndicationSourceId]) REFERENCES [dbo].[SyndicationSource] ([Id]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_dbo.SyndicationToCategory_Category]...';


GO
ALTER TABLE [dbo].[SyndicationToCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.SyndicationToCategory_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO

USE [InterviewChallenge];
GO

ALTER TABLE [dbo].[FeedRunLog] WITH CHECK CHECK CONSTRAINT [FK_dbo.FeedRunLog_Feed];

ALTER TABLE [dbo].[SyndicationFeed] WITH CHECK CHECK CONSTRAINT [FK_SyndicationFeed_SyndicationSource];

ALTER TABLE [dbo].[SyndicationFeedToCategory] WITH CHECK CHECK CONSTRAINT [FK_dbo.SyndicationFeedToCategory_SyndicationFeed];

ALTER TABLE [dbo].[SyndicationFeedToCategory] WITH CHECK CHECK CONSTRAINT [FK_dbo.SyndicationFeedToCategory_Category];

ALTER TABLE [dbo].[SyndicationToCategory] WITH CHECK CHECK CONSTRAINT [FK_dbo.SyndicationToCategory_SyndicationSource];

ALTER TABLE [dbo].[SyndicationToCategory] WITH CHECK CHECK CONSTRAINT [FK_dbo.SyndicationToCategory_Category];


GO
PRINT N'Update complete.';

GO
