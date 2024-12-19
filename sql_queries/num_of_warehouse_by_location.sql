SELECT *
FROM inventory;
SELECT inventory.warehouse_location, count(*) as quantity
from inventory
GROUP BY 1;

