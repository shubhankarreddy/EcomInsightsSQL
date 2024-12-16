-- grading suppliers on the basis of reliablity_score
-- (grade A [Top-Tier]: 10-8, grade B[Mid-Tier] : 8-6, grade C[Low-Tier] : 6-4, grade D[At-Risk] : 4-0

SELECT
    sp.supplier_name,
    sp.reliability_score as rs,
    CASE
        WHEN sp.reliability_score >= 8 then 'Top-Tier'
        WHEN sp.reliability_score >= 6 THEN 'Mid-Tier'
        WHEN sp.reliability_score >= 4 THEN 'Low-Tier'
        WHEN sp.reliability_score >= 0 THEN 'At-Risk'
ELSE 'Unknown'
END AS supplier_level
from Suppliers sp
    ORDER BY sp.reliability_score DESC ;