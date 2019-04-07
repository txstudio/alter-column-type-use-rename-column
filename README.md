# 使用建立欄位與重新命名方式變更欄位資料型態

本範例會建立獨立的資料庫與資料表提供變更欄位型態的環境

## 環境準備

本範例指令碼使用 Microsoft SQL Server 2017 作為資料庫並架設在 Windows Server 2019 作業系統

### 取得範例指令碼後

- 執行 init.sql 建立範例資料庫 alterColumnTypeSampleDb 與資料表 dbo.Stock
- 將 stock.zip 解壓縮後取得範例資料檔案
- 使用 bcp 將 stock.data 匯入到 dbo.Stock 資料表中
- 將 dbo.Stock 資料表的 Name 欄位資料型態變更為 NVARCHAR(MAX)

### bcp 匯入 stock.data 範例

```
bcp alterColumnTypeSampleDb.dbo.Stock IN "stock.data"
  -S"<ipaddress-or-servername>"
  -U"<login-name>"
  -P"<login-password>"
  -w
```

匯入 dbo.Stock 資料表完成後會有約九十萬筆資料

### 將 dbo.Stock 資料表 Name 欄位修改成 NVARCHAR(MAX) 的範例指令碼

```
ALTER TABLE [dbo].[Stock]
  ALTER COLUMN [Name] NVARCHAR(MAX)
```

## 參考資料

- [GOTO (Transact-SQL) - SQL Server | Microsoft Docs](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/goto-transact-sql)
- [How to Delete Millions of Rows using T-SQL with Reduced Impact | DBA Diaries](http://dbadiaries.com/how-to-delete-millions-of-rows-using-t-sql-with-reduced-impact/)
