/*
EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'alterColumnTypeSampleDb'
GO

USE [master]
GO

ALTER DATABASE [alterColumnTypeSampleDb]
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

USE [master]
GO

DROP DATABASE [alterColumnTypeSampleDb]
GO

USE [master]
GO
*/
CREATE DATABASE [alterColumnTypeSampleDb]
GO

/*
	此設定與 Azure SQL Database 相同
	https://blogs.msdn.microsoft.com/sqlcat/2013/12/26/be-aware-of-the-difference-in-isolation-levels-if-porting-an-application-from-windows-azure-sql-db-to-sql-server-in-windows-azure-virtual-machine/
*/

--啟用 SNAPSHOT_ISOLATION
ALTER DATABASE [alterColumnTypeSampleDb]
	SET ALLOW_SNAPSHOT_ISOLATION ON
GO

--啟用 READ_COMMITTED_SNAPSHOT
ALTER DATABASE [alterColumnTypeSampleDb]
	SET READ_COMMITTED_SNAPSHOT ON
	WITH ROLLBACK IMMEDIATE
GO

USE [alterColumnTypeSampleDb]
GO

CREATE TABLE [dbo].[Stock]
(
	[No]			INT NOT NULL,
	[Code]			VARCHAR(6),
	[Name]			NVARCHAR(MAX),
	[ISINCode]		VARCHAR(15),
	[PublishDate]	DATE,
	[Market]		NVARCHAR(10),
	[Industry]		NVARCHAR(50),
	[CFICode]		NVARCHAR(10),
	[Note]			NVARCHAR(50),
	
	CONSTRAINT [PK_Stock]
		PRIMARY KEY CLUSTERED ([No])
)
GO
