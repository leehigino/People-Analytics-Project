-- View 1: Overview Geral
CREATE OR REPLACE VIEW hr.vw_turnover_overview AS
SELECT 
    COUNT(*) as total_employees,
    SUM(is_turnover) as total_turnover,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate,
    ROUND(CAST(AVG(monthly_income) AS NUMERIC), 2) as avg_income,
    ROUND(CAST(AVG(age) AS NUMERIC), 1) as avg_age,
    ROUND(CAST(AVG(years_at_company) AS NUMERIC), 1) as avg_tenure
FROM hr.staging_turnover;

-- View 2: Turnover por Departamento
CREATE OR REPLACE VIEW hr.vw_turnover_by_department AS
SELECT 
    department,
    COUNT(*) as total_employees,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate,
    ROUND(CAST(AVG(CASE WHEN is_turnover = 1 THEN turnover_risk_score END) AS NUMERIC), 1) as avg_risk_score_leavers
FROM hr.staging_turnover
GROUP BY department
ORDER BY turnover_rate DESC;

-- View 3: Turnover por Cargo
CREATE OR REPLACE VIEW hr.vw_turnover_by_job_role AS
SELECT 
    job_role,
    department,
    COUNT(*) as total_employees,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY job_role, department
ORDER BY turnover_rate DESC;

-- View 4: Análise de Satisfação
CREATE OR REPLACE VIEW hr.vw_turnover_by_satisfaction AS
SELECT 
    job_satisfaction_label,
    environment_satisfaction_label,
    worklife_balance_label,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY job_satisfaction_label, environment_satisfaction_label, worklife_balance_label
ORDER BY turnover_rate DESC;

-- View 5: Carreira e Promoção
CREATE OR REPLACE VIEW hr.vw_turnover_by_career AS
SELECT 
    promotion_gap_band,
    tenure_band,
    COUNT(*) as total,
    SUM(is_turnover) as turnover_count,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate
FROM hr.staging_turnover
GROUP BY promotion_gap_band, tenure_band
ORDER BY turnover_rate DESC;

-- View 6: Distribuição de Risco
CREATE OR REPLACE VIEW hr.vw_turnover_risk_distribution AS
SELECT 
    turnover_risk_level as risk_category,
    COUNT(*) as total_employees,
    SUM(is_turnover) as actual_turnover,
    ROUND(CAST(AVG(is_turnover) * 100 AS NUMERIC), 2) as turnover_rate,
    ROUND(CAST(AVG(turnover_risk_score) AS NUMERIC), 1) as avg_risk_score
FROM hr.staging_turnover
GROUP BY turnover_risk_level
ORDER BY 
    CASE turnover_risk_level 
        WHEN 'High Risk' THEN 1 
        WHEN 'Medium Risk' THEN 2 
        WHEN 'Low Risk' THEN 3 
    END;