# 📁 Partitioning Performance Report

## Objective
Improve query performance on the large `Booking` table by partitioning it based on the `start_date` column.

---

## 🧱 Implementation

We dropped and recreated the `Booking` table using **RANGE partitioning** on the `YEAR(start_date)`.

```sql
PARTITION BY RANGE (YEAR(start_date))

