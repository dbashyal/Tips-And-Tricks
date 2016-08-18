#MSSQL Tips And Tricks

## If delete doesn't work and you get `Lock request time out period exceeded` error
```php
// Run this command and note SPID
DBCC opentran()

// Now run
sp_who2 <SPID>
sp_lock <SPID>

// now kill the process
Kill <SPID>

// now try to delete again
DELETE FROM Magento.dbo.Mage_orderitems WHERE order_item_id = 994;

// VOILA - all good now :-) thx to - http://stackoverflow.com/a/22092004/534525
```
