USE [alterColumnTypeSampleDb]
GO

/*
	使用 ATLER TABLE 與 ALTER COLUMN
	調整 NVARCHAR(MAX) 型態的資料欄位
	給予適當的資料型態與長度
*/
ALTER TABLE [dbo].[Stock]
	ALTER COLUMN [Name] NVARCHAR(50)
GO
	
