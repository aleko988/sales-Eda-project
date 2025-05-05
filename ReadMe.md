# 🧹 Sales Data Cleaning Project (SQL)

This project demonstrates a complete data cleaning workflow on a raw sales dataset using SQL. The dataset includes transaction details such as dates, customer demographics, product information, and financial metrics (cost, price, revenue, and profit).

## 📄 Dataset Columns

- `Date`, `Day`, `Month`, `Year`
- `Customer_Age`, `Age_Group`, `Customer_Gender`
- `Country`, `State`
- `Product_Category`, `Sub_Category`, `Product`
- `Order_Quantity`, `Unit_Cost`, `Unit_Price`
- `Profit`, `Cost`, `Revenue`

---

## 🧽 Cleaning Steps Performed

### 1. **Removed Duplicates**
- Used `ROW_NUMBER()` and a CTE to identify and delete duplicate rows.

### 2. **Standardized Text Data**
- Converted categorical text columns like `country`, `state`, `product_category`, etc., to lowercase for consistency.

### 3. **Handled Inconsistent Data Types**
- Converted the `Date` column from text format to proper `DATE` type.

### 4. **Recalculated Financial Metrics**
- Recalculated `Profit`, `Cost`, and `Revenue` to ensure they were accurate and non-negative.

### 5. **Checked and Handled Null or Blank Values**
- Converted blank values to `NULL`
- Checked for any remaining nulls — none were found in the cleaned dataset.

### 6. **Trimmed Extra Spaces**
- Verified and ensured there were no trailing or leading whitespaces in key columns.

### 7. **Created Indexes**
- Added indexes to improve query performance on columns like `Date`, `Country`, `Product`, `Order_Quantity`, and `Year`.

---

## 🛠️ Tools Used

- MySQL
- SQL queries
- VS Code (or any SQL IDE)

---

## 📁 Project Structure

