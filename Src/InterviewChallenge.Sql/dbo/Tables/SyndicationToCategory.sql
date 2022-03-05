CREATE TABLE [dbo].[SyndicationToCategory]
(
    [Id]                    UNIQUEIDENTIFIER    NOT NULL DEFAULT (NewSequentialId()),
    [SyndicationSourceId]   INT                 NOT NULL,
    [CategoryId]            INT                 NOT NULL, 

    CONSTRAINT [PK_dbo.SyndicationToCategory]   
        PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.SyndicationToCategory_SyndicationSource] 
        FOREIGN KEY ([SyndicationSourceId]) 
        REFERENCES [dbo].[SyndicationSource] ([Id]),
    CONSTRAINT [FK_dbo.SyndicationToCategory_Category] 
        FOREIGN KEY ([CategoryId]) 
        REFERENCES [dbo].[Category] ([Id])
)

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SyndicationToCategory_SourceIdCategoryId] 
    ON [dbo].[SyndicationToCategory] ([SyndicationSourceId] ASC, [CategoryId] ASC)
