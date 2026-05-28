# 🛡️ Bank Fraud Detection: Finding "Mule" Accounts

### **What is this?**
This project shows how banks find "Mule Accounts"—accounts used by criminals to move stolen money. I built a system that tracks 1,000+ accounts and flags the ones behaving like criminals instead of real customers.

---

## 🚀 How it Works (4 Steps)

### **1. Data Creation (Python)**
Since real bank data is private, I wrote a Python script to create **synthetic bank logs**. I made sure to hide "Mules" inside the data using real fraud patterns.

### **2. The 5 "Red Flags" (Python)**
I built a scoring system to catch suspects based on 5 behaviors:
1. **Speed:** Money comes in and leaves in less than 15 minutes.
2. **Same Phone:** 10 different people using the exact same phone to log in.
3. **The Sleeper:** Account stays empty for 2 months, then suddenly moves lakhs.
4. **New Accounts:** Brand new accounts moving high amounts of cash immediately.
5. **Round Numbers:** Moving money in exact blocks like ₹50,000.

### **3. The Digital Audit (SQL)**
I used SQL to find "Fraud Rings." I wrote queries to catch cases where one single **Device ID** was controlling multiple bank accounts at once.

### **4. The Dashboard (Power BI)**
I created a visual dashboard for a bank manager. It includes:
* **The Mule Trap:** A graph that separates normal people from fraudsters.
* **Risk Heatmap:** A map showing which cities have the most fraud activity.
* **Action List:** A table of the most suspicious Account IDs to freeze.

---

## 🛠️ Tools Used
* **Python:** For generating and scoring the data.
* **SQL:** For finding connections between accounts.
* **Power BI:** For the final visual report.

---

## 📂 Files in this Repo
* `raw_data_code.ipynb` - The Python code.
* `da2.sql` - The SQL code.
* `DA2.pbix` - The Power BI file.
