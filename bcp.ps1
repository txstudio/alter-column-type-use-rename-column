# 使用 bcp 將資料匯出成檔案
bcp alterColumnTypeSampleDb.dbo.Stock OUT "stock.data" -S"<server_name>" -U"<login_name>" -P"<password>" -w

# 使用 bcp 將資料匯入到資料表
bcp alterColumnTypeSampleDb.dbo.Stock IN "stock.data" -S"<server_name>" -U"<login_name>" -P"<password>" -w