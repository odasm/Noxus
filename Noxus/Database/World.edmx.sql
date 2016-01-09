
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/30/2015 23:15:36
-- Generated from EDMX file: C:\Users\Dakarai\Desktop\Noxus\Noxus.Database\World.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [World];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Equip_Character]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DatabaseEquips] DROP CONSTRAINT [FK_Equip_Character];
GO
IF OBJECT_ID(N'[dbo].[FK_Item_Character1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DatabaseItems] DROP CONSTRAINT [FK_Item_Character1];
GO
IF OBJECT_ID(N'[dbo].[FK_Skills_Character]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DatabaseSkills] DROP CONSTRAINT [FK_Skills_Character];
GO
IF OBJECT_ID(N'[dbo].[FK_Character_Guild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Characters] DROP CONSTRAINT [FK_Character_Guild];
GO
IF OBJECT_ID(N'[dbo].[FK_PartyMatchingSystem_Character]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PartyMatchingSystems] DROP CONSTRAINT [FK_PartyMatchingSystem_Character];
GO
IF OBJECT_ID(N'[dbo].[FK_Party_Character]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parties] DROP CONSTRAINT [FK_Party_Character];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Characters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Characters];
GO
IF OBJECT_ID(N'[dbo].[DatabaseEquips]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DatabaseEquips];
GO
IF OBJECT_ID(N'[dbo].[DatabaseItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DatabaseItems];
GO
IF OBJECT_ID(N'[dbo].[DatabaseSkills]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DatabaseSkills];
GO
IF OBJECT_ID(N'[dbo].[Guilds]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Guilds];
GO
IF OBJECT_ID(N'[dbo].[PartyMatchingSystems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PartyMatchingSystems];
GO
IF OBJECT_ID(N'[dbo].[Parties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parties];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Characters'
CREATE TABLE [dbo].[Characters] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [AccountID] int  NOT NULL,
    [Name] varchar(20)  NOT NULL,
    [Slot] tinyint  NOT NULL,
    [Map] tinyint  NOT NULL,
    [CharLevel] tinyint  NOT NULL,
    [Job] tinyint  NOT NULL,
    [Male] bit  NOT NULL,
    [HP] int  NOT NULL,
    [SP] int  NOT NULL,
    [HPStones] smallint  NOT NULL,
    [SPStones] smallint  NOT NULL,
    [Exp] bigint  NOT NULL,
    [Fame] int  NOT NULL,
    [Money] bigint  NOT NULL,
    [Hair] tinyint  NOT NULL,
    [HairColor] tinyint  NOT NULL,
    [Face] tinyint  NOT NULL,
    [XPos] int  NOT NULL,
    [YPos] int  NOT NULL,
    [StatPoints] tinyint  NOT NULL,
    [StrStats] tinyint  NOT NULL,
    [EndStats] tinyint  NOT NULL,
    [DexStats] tinyint  NOT NULL,
    [IntStats] tinyint  NOT NULL,
    [SprStats] tinyint  NOT NULL,
    [CurrentTitle] int  NULL,
    [QuickBar] binary(1030)  NULL,
    [QuickBarState] binary(30)  NULL,
    [Shortcuts] binary(310)  NULL,
    [GameSettings] binary(1030)  NULL,
    [ClientSettings] binary(395)  NULL,
    [UsablePoints] tinyint  NOT NULL,
    [GuildID] int  NULL
);
GO

-- Creating table 'DatabaseEquips'
CREATE TABLE [dbo].[DatabaseEquips] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Owner] int  NOT NULL,
    [Slot] smallint  NOT NULL,
    [EquipID] int  NOT NULL,
    [Upgrades] tinyint  NOT NULL,
    [IncStr] tinyint  NOT NULL,
    [IncEnd] tinyint  NOT NULL,
    [IncDex] tinyint  NOT NULL,
    [IncInt] tinyint  NOT NULL,
    [IncSpr] tinyint  NOT NULL,
    [Expires] datetime  NULL
);
GO

-- Creating table 'DatabaseItems'
CREATE TABLE [dbo].[DatabaseItems] (
    [ID] int  NOT NULL,
    [Owner] int  NOT NULL,
    [ObjectID] int  NOT NULL,
    [Slot] smallint  NOT NULL,
    [Amount] smallint  NOT NULL
);
GO

-- Creating table 'DatabaseSkills'
CREATE TABLE [dbo].[DatabaseSkills] (
    [ID] int  NOT NULL,
    [Owner] int  NOT NULL,
    [SkillID] smallint  NOT NULL,
    [Upgrades] smallint  NOT NULL,
    [IsPassive] bit  NOT NULL
);
GO

-- Creating table 'Guilds'
CREATE TABLE [dbo].[Guilds] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(16)  NULL
);
GO

-- Creating table 'PartyMatchingSystems'
CREATE TABLE [dbo].[PartyMatchingSystems] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Owner] int  NOT NULL,
    [Name] varchar(16)  NOT NULL,
    [Message] varchar(130)  NOT NULL,
    [Datetime] datetime  NOT NULL
);
GO

-- Creating table 'Parties'
CREATE TABLE [dbo].[Parties] (
    [CharNo] int  NOT NULL,
    [MasterNo] int  NOT NULL,
    [PartyNo] int  NOT NULL,
    [PartyGroup] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [PK_Characters]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DatabaseEquips'
ALTER TABLE [dbo].[DatabaseEquips]
ADD CONSTRAINT [PK_DatabaseEquips]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DatabaseItems'
ALTER TABLE [dbo].[DatabaseItems]
ADD CONSTRAINT [PK_DatabaseItems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'DatabaseSkills'
ALTER TABLE [dbo].[DatabaseSkills]
ADD CONSTRAINT [PK_DatabaseSkills]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Guilds'
ALTER TABLE [dbo].[Guilds]
ADD CONSTRAINT [PK_Guilds]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'PartyMatchingSystems'
ALTER TABLE [dbo].[PartyMatchingSystems]
ADD CONSTRAINT [PK_PartyMatchingSystems]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [CharNo] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [PK_Parties]
    PRIMARY KEY CLUSTERED ([CharNo] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Owner] in table 'DatabaseEquips'
ALTER TABLE [dbo].[DatabaseEquips]
ADD CONSTRAINT [FK_Equip_Character]
    FOREIGN KEY ([Owner])
    REFERENCES [dbo].[Characters]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Equip_Character'
CREATE INDEX [IX_FK_Equip_Character]
ON [dbo].[DatabaseEquips]
    ([Owner]);
GO

-- Creating foreign key on [Owner] in table 'DatabaseItems'
ALTER TABLE [dbo].[DatabaseItems]
ADD CONSTRAINT [FK_Item_Character1]
    FOREIGN KEY ([Owner])
    REFERENCES [dbo].[Characters]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Item_Character1'
CREATE INDEX [IX_FK_Item_Character1]
ON [dbo].[DatabaseItems]
    ([Owner]);
GO

-- Creating foreign key on [Owner] in table 'DatabaseSkills'
ALTER TABLE [dbo].[DatabaseSkills]
ADD CONSTRAINT [FK_Skills_Character]
    FOREIGN KEY ([Owner])
    REFERENCES [dbo].[Characters]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Skills_Character'
CREATE INDEX [IX_FK_Skills_Character]
ON [dbo].[DatabaseSkills]
    ([Owner]);
GO

-- Creating foreign key on [GuildID] in table 'Characters'
ALTER TABLE [dbo].[Characters]
ADD CONSTRAINT [FK_Character_Guild]
    FOREIGN KEY ([GuildID])
    REFERENCES [dbo].[Guilds]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Character_Guild'
CREATE INDEX [IX_FK_Character_Guild]
ON [dbo].[Characters]
    ([GuildID]);
GO

-- Creating foreign key on [Owner] in table 'PartyMatchingSystems'
ALTER TABLE [dbo].[PartyMatchingSystems]
ADD CONSTRAINT [FK_PartyMatchingSystem_Character]
    FOREIGN KEY ([Owner])
    REFERENCES [dbo].[Characters]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PartyMatchingSystem_Character'
CREATE INDEX [IX_FK_PartyMatchingSystem_Character]
ON [dbo].[PartyMatchingSystems]
    ([Owner]);
GO

-- Creating foreign key on [CharNo] in table 'Parties'
ALTER TABLE [dbo].[Parties]
ADD CONSTRAINT [FK_Party_Character]
    FOREIGN KEY ([CharNo])
    REFERENCES [dbo].[Characters]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------