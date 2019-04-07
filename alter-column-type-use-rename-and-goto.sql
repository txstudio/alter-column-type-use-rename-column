USE [alterColumnTypeSampleDb]
GO

/*
	透過建立資料型態正確的新欄位
	將要修正型態的欄位與正確型態的欄位重新命名
	使用 GOTO 指令碼將舊欄位的資料更新到新欄位
		並將舊欄位資料清空
	完成後再將錯誤型態的欄位刪除
*/
ALTER TABLE [dbo].[Stock]
	ADD [Name_New] NVARCHAR(50)
GO

EXECUTE sp_rename N'dbo.Stock.Name',N'Name_Old','Column'
EXECUTE sp_rename N'dbo.Stock.Name_New',N'Name','Column'
GO

UPDATE_MOVE:

--逐步更新資料欄位型態
;WITH UPDATE_BASE AS (
	SELECT TOP(5000) [Name]
		,[Name_Old]
	FROM [dbo].[Stock]
	WHERE [Name_Old] IS NOT NULL
	ORDER BY [No] DESC
)
UPDATE UPDATE_BASE
	SET [Name] = [Name_Old]
		,[Name_Old] = NULL
WHERE [Name_Old] IS NOT NULL

IF @@ROWCOUNT > 0
	GOTO UPDATE_MOVE
GO

ALTER TABLE [dbo].[Stock]
	DROP COLUMN [Name_Old] 
GO

