CREATE TABLE [dbo].[SyndicationFeedToCategory]
(
    [Id]                    UNIQUEIDENTIFIER    NOT NULL DEFAULT (NewSequentialId()),
    [SyndicationFeedId]     BIGINT              NOT NULL,
    [CategoryId]            INT                 NOT NULL, 
    CONSTRAINT [PK_dbo.SyndicationFeedToCategory]
        PRIMARY KEY CLUSTERED ([Id] ASC), 
    CONSTRAINT [FK_dbo.SyndicationFeedToCategory_SyndicationFeed] 
        FOREIGN KEY ([SyndicationFeedId])
        REFERENCES [SyndicationFeed]([Id]), 
    CONSTRAINT [FK_dbo.SyndicationFeedToCategory_Category] 
        FOREIGN KEY ([CategoryId]) 
        REFERENCES [dbo].[Category] ([Id])
)

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationFeedToCategory_FeedIdCategoryId] 
    ON [dbo].[SyndicationFeedToCategory] ([SyndicationFeedId] ASC, [CategoryId] ASC)
