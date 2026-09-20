# Customer Churn & Retention Analytics

## 📌 Project Overview
Customer churn is a critical challenge for subscription‑based businesses.  
This project builds a **data‑driven churn analytics pipeline** that identifies risk factors, segments customers, and recommends actionable retention strategies.  

The workflow integrates **SQL, Python, and Power BI** to deliver both technical analysis and executive‑level dashboards.

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