
import pandas as pd
import matplotlib.pyplot as plt

# Load the sample sales dataset
df = pd.read_csv("data/sales_data.csv")

# Convert order_date into a date format
df["order_date"] = pd.to_datetime(df["order_date"])

# Calculate revenue for each order
df["revenue"] = df["quantity"] * df["unit_price"]

# Basic data checks
print("Dataset Preview:")
print(df.head())

print("\nDataset Information:")
print(df.info())

print("\nMissing Values:")
print(df.isnull().sum())

# Overall sales metrics
total_revenue = df["revenue"].sum()
total_orders = df["order_id"].nunique()
total_units = df["quantity"].sum()
average_order_value = total_revenue / total_orders

print("\n--- Sales Summary ---")
print(f"Total Revenue: Rs. {total_revenue:,.2f}")
print(f"Total Orders: {total_orders}")
print(f"Total Units Sold: {total_units}")
print(f"Average Order Value: Rs. {average_order_value:,.2f}")

# Monthly revenue analysis
df["month"] = df["order_date"].dt.to_period("M").astype(str)
monthly_sales = df.groupby("month")["revenue"].sum()

print("\n--- Monthly Revenue ---")
print(monthly_sales)

# Revenue by product
product_sales = (
    df.groupby("product")["revenue"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Revenue by Product ---")
print(product_sales)

# Revenue by region
region_sales = (
    df.groupby("region")["revenue"]
    .sum()
    .sort_values(ascending=False)
)

print("\n--- Revenue by Region ---")
print(region_sales)

# Create charts
monthly_sales.plot(kind="bar", title="Monthly Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue (Rs.)")
plt.tight_layout()
plt.savefig("monthly_revenue.png")
plt.show()

product_sales.plot(kind="bar", title="Revenue by Product")
plt.xlabel("Product")
plt.ylabel("Revenue (Rs.)")
plt.tight_layout()
plt.savefig("product_revenue.png")
plt.show()
