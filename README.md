# Customer Churn & Retention Analytics

## Project Overview

This project analyses customer churn in a subscription-based business using SQL, Python, and Power BI. The goal is to understand which customer segments experience higher churn, identify patterns associated with customer attrition, and prioritize potential retention interventions.

The workflow includes data cleaning and validation, SQL-based segmentation, Python exploratory data analysis, and Power BI reporting.

The analysis examines churn across contract type, customer tenure, payment method, internet service, technical support, and customer value indicators.

**Business objective:** Help retention teams identify vulnerable customer segments, monitor churn-related KPIs, and prioritize evidence-based retention actions.

**Tools:** SQL, Python, Pandas, Matplotlib, Seaborn, Power BI.

## 🗂 Project Structure
- **data/** → raw & cleaned datasets  
- **sql/** → SQL scripts for churn queries  
- **python/** → Jupyter notebook for exploratory data analysis  
- **powerbi/** → Power BI report (.pbix)  
- **outputs/analysis_tables/** → summary tables & results  

## 🔍 Methodology
1. **Data Preparation**  
   - Cleaned raw churn dataset (`customer_churn_cleaned.csv`).  
   - Handled missing values and standardized categorical variables.

2. **SQL Analysis**  
   - Queries to segment churn by contract, tenure, payment method, and internet service.  
   - Aggregated tables exported for visualization.

3. **Python EDA**  
   - Exploratory Data Analysis in `Customer_Churn_EDA.ipynb`.  
   - Visualizations with Pandas, Matplotlib, Seaborn.  
   - Segmentation of churn vs retention patterns.

4. **Power BI Dashboards**  
   - **Customer Retention Overview** → KPIs, churn by contract, tenure, payment method, internet service, tech support.  
   - **Churn Risk Analysis** → segmentation into High/Medium/Low risk, churn gap analysis, recommended retention actions.

## Customer Risk Segmentation

Customers were segmented into risk categories using the rules implemented in the analysis.

- **High Risk:** Customers meeting the highest-risk criteria defined in the analysis.
- **Medium Risk:** Customers meeting the intermediate-risk criteria.
- **Low Risk:** Customers meeting the lowest-risk criteria.

The final documentation should specify the actual risk indicators, score weights, thresholds, and treatment of missing values. Risk categories should be validated against observed churn outcomes.

**Limitation:** These categories represent analytical risk segments, not calibrated churn probabilities, unless a validated predictive model has been developed.

## 📊 Key Insights
- **27% overall churn rate** observed.  
- **Month‑to‑month contracts** show highest churn.  
- **Electronic check payments** strongly linked to churn.  
- **Customers without tech support** churn at 54% rate.  
- **Early‑life customers (0–12 months)** are most vulnerable.  
- **High‑value customers** with multiple risk indicators need proactive outreach.

## 🎯 Recommended Retention Strategies
- Incentivize **long‑term contracts** to reduce churn.  
- Focus retention efforts on **first‑year customers**.  
- Promote **technical support adoption** to lower churn risk.  
- Provide **personalized offers** for high‑charge customers with multiple risk factors.  

## 🛠 Tools & Technologies
- **Python** → Pandas, Matplotlib, Seaborn  
- **SQL** → Customer churn queries  
- **Power BI** → Interactive dashboards  
- **GitHub** → Version control & collaboration  