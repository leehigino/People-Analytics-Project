
CREATE SCHEMA IF NOT EXISTS hr;

CREATE TABLE hr.staging_turnover (
    
    age INT,                           
    attrition VARCHAR(10),             
    business_travel VARCHAR(50),       
    daily_rate INT,                    
    department VARCHAR(50),           
    distance_from_home INT,            
    education INT,                    
    education_field VARCHAR(50),       
    employee_number INT PRIMARY KEY,   
    environment_satisfaction INT,      
    gender VARCHAR(10),                
    hourly_rate INT,                   
    job_involvement INT,               
    job_level INT,                     
    job_role VARCHAR(50),              
    job_satisfaction INT,              
    marital_status VARCHAR(20),        
    monthly_income INT,                
    monthly_rate INT,                  
    num_companies_worked INT,          
    over_time VARCHAR(10),             
    percent_salary_hike INT,           
    performance_rating INT,            
    relationship_satisfaction INT,     
    stock_option_level INT,            
    total_working_years INT,           
    training_times_last_year INT,      
    work_life_balance INT,             
    years_at_company INT,              
    years_in_current_role INT,         
    years_since_last_promotion INT,   
    years_with_curr_manager INT,       
    
    -- New Columns
    
    is_turnover INT,                   
    age_band VARCHAR(20),              
    tenure_band VARCHAR(20),          
    distance_band VARCHAR(20),        
    promotion_gap_band VARCHAR(20),    
    work_life_balance_level VARCHAR(10), 
    job_satisfaction_level VARCHAR(10),  
    environment_satisfaction_level VARCHAR(10), 
    relationship_satisfaction_level VARCHAR(10), 
    turnover_risk_score INT,           
    risk_category VARCHAR(10)          
);

-- Comments to document columns 
COMMENT ON TABLE hr.staging_turnover IS 'Staging table with processed turnover data';
COMMENT ON COLUMN hr.staging_turnover.is_turnover IS 'Binary: 0=Did not leave, 1=Left company';
COMMENT ON COLUMN hr.staging_turnover.turnover_risk_score IS 'Score calculated based on multiple risk factors';
COMMENT ON COLUMN hr.staging_turnover.risk_category IS 'Category based on score: Low(<30), Medium(30-70), High(>70)';

-- Create indexes to improve performance 
CREATE INDEX idx_risk_category ON hr.staging_turnover(risk_category);
CREATE INDEX idx_department ON hr.staging_turnover(department);
CREATE INDEX idx_turnover ON hr.staging_turnover(is_turnover);