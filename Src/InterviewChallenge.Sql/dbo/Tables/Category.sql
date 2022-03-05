CREATE TABLE [dbo].[Category]
(
    [Id]            INT             NOT NULL IDENTITY (1, 1),
    [IsActive]      BIT             NOT NULL DEFAULT (1),
    [Name]          NVARCHAR (100)  NOT NULL,
    CONSTRAINT [PK_dbo._Category]   
        PRIMARY KEY CLUSTERED ([Id] ASC),
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Category_Name]
    ON [dbo].[Category]([Name] ASC);
