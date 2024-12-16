-- suppliers ranking by reliablity score

SELECT
    sp.supplier_name,
    sp.reliability_score,
    rank() OVER (ORDER BY sp.reliability_score DESC ) AS supplier_rank
from Suppliers sp
ORDER BY supplier_rank;