-- ANÁLISES PRINCIPAIS - PEOPLE ANALYTICS

-- 1. TAXA GERAL DE TURNOVER
SELECT * FROM hr.vw_turnover_overview;

-- 2. DEPARTAMENTOS MAIS CRÍTICOS
SELECT * FROM hr.vw_turnover_by_department;

-- 3. CARGOS COM MAIOR RISCO
SELECT * FROM hr.vw_turnover_by_job_role 
ORDER BY turnover_rate DESC 
LIMIT 10;

-- 4. IMPACTO DO OVERTIME
SELECT 
    over_time,
    COUNT(*) as total_employees,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY over_time
ORDER BY turnover_rate DESC;

-- 5. IMPACTO DA SATISFAÇÃO NO TRABALHO
SELECT 
    job_satisfaction_label,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY job_satisfaction_label
ORDER BY turnover_rate DESC;

-- 6. INFLUÊNCIA DE PROMOÇÃO NA RETENÇÃO
SELECT 
    promotion_gap_band,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY promotion_gap_band
ORDER BY turnover_rate DESC;

-- 7. DISTRIBUIÇÃO DE RISCO
SELECT * FROM hr.vw_turnover_risk_distribution;

-- 8. FUNCIONÁRIOS DE ALTO RISCO (AINDA NA EMPRESA)
-- Lista para ação do RH
SELECT 
    employee_number,
    department,
    job_role,
    age,
    years_at_company,
    ROUND(CAST(turnover_risk_score AS NUMERIC), 1) as risk_score,
    turnover_risk_level,
    job_satisfaction_label,
    worklife_balance_label,
    over_time,
    promotion_gap_band
FROM hr.staging_turnover
WHERE turnover_risk_level = 'High Risk' 
  AND is_turnover = 0
ORDER BY turnover_risk_score DESC
LIMIT 50;

-- 9. ANÁLISE: DISTÂNCIA vs TURNOVER
SELECT 
    distance_band,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY distance_band
ORDER BY turnover_rate DESC;

-- 10. ANÁLISE: WORK-LIFE BALANCE vs TURNOVER
SELECT 
    worklife_balance_label,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY worklife_balance_label
ORDER BY turnover_rate DESC;