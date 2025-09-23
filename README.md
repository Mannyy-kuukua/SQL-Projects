# SQL-Projects
This repository contains all projects done with SQL
# 📝 Sales Overview of a Restaurant
[Project Outline](#Project-Outline)
[Key-Insights](#Key-Insights)
[Recommendation](#Recommendation)
[Tools & Technology](#Tools--Technology)
[How to Use This Repo](#How-To-Use-This-Repo)
This repository contains a SQL-based analysis of a dummy restaurant dataset downloaded from Kaggle.  
The goal was to showcase revenue performance across five countries and highlight key sales trends, customer behavior, and revenue drivers.

---

##  Project Outline

1. **Database Creation** – Created a database to store and query the data.  
2. **Data Importation** – Loaded the dataset using the SQL import wizard.  
3. **Data Validation** – Duplicated the main table for validation and quality checks.  
4. **Data Cleaning & Transformation**  
   - Standardized date formats  
   - Removed extra spaces and standardized text fields  
5. **Feature Creation** – Added a `Revenue` column (Price × Quantity).  
6. **Analysis**  
   - Total company revenue  
   - Country revenue contribution  
   - Revenue per product  
   - Payment method breakdown  
   - Order channel segmentation (Online / Drive-Thru / In-Store)  
   - Monthly and daily sales trends  
   - Top sales days per product  
7. **SQL Syntax Used** – Simple clauses like `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`.  

---

##  Key Insights

- **Total Orders:** 254  
- **Total Revenue:** **$769,515.89**

### Revenue by Country
| Country | Revenue |
|---------|---------|
| Lisbon  | $241,714.11 |
| London  | $211,201.05 |
| Madrid  | $136,200.29 |
| Berlin  | $100,600.13 |
| Paris   | $79,800.31 |

### Revenue by Product
| Product            | Revenue |
|-------------------|---------|
| Burgers            | $376,999.85 |
| Fries              | $125,674.19 |
| Chicken Sandwiches | $114,641.67 |
| Beverages          | $103,200.18 |
| Sides & Others     | $49,000.00 |

### Payment Methods
- **Credit Cards:** 120 customers – $361,715.08  
- **Cash:** 76 customers – $239,200.23  
- **Gift Cards:** 58 customers – $168,600.53  

### Order Channels
- **Online:** 107 orders  
- **In-Store:** 86 orders  
- **Drive-Thru:** 61 orders  

### Additional Highlights
- London & Lisbon each had 75 orders (highest), Paris had 28 (lowest).  
- Wednesday had the most orders (40); Sunday the least (29).  
- Top Manager: **Joao Silva**.

---

##  Recommendations

- **Boost Underperforming Branches:** Focus marketing or promotional activities on Paris and Berlin to increase sales.  
- **Enhance Strong Channels:** Invest in online ordering and in-store promotions in Lisbon and London to maximize revenue.  
- **Diversify Payments:** Introduce mobile wallets / QR codes to attract non-credit customers.  
- **Increase Sales on Low-Performing Days:** Launch Sunday deals or family specials.  
- **Product Bundling:** Pair high-selling items (burgers, fries) with lower-performing sides/beverages to increase average order value.  
- **Manager Best Practices:** Use high-performing managers like Joao Silva to share success strategies with other branches.  

---

##  Tools & Technologies

- **SQL** (SELECT, FROM, WHERE, GROUP BY, ORDER BY)  
- Basic data cleaning and transformation inside the database  

---

##  How to Use This Repo

1. Clone the repository.  
2. Import the SQL files into your preferred database.  
3. Run the provided scripts to recreate the analysis.  

---



