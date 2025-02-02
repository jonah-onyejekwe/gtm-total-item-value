# Total Item Value (Price × Quantity) - GTM Variable Template

## Overview
The **Total Item Value (Price × Quantity)** GTM variable template calculates the total value of items in an array by multiplying each item's **price** and **quantity** attributes. This template is useful for **eCommerce tracking**, allowing for dynamic calculation of total revenue or order value in **Google Tag Manager (GTM)**.

## Features
- **Automated Calculation**: Multiplies price and quantity for each item in an array.
- **Flexible Attribute Mapping**: Users define the attribute names for price and quantity.
- **Handles Different Data Structures**: Works with varying object structures.
- **Fails Gracefully**: Returns `undefined` if required attributes are missing or the array is empty.

---

## How to Configure in GTM
### **Step 1: Add the Variable Template to GTM**
1. Go to **Google Tag Manager**.
2. Navigate to **Templates > New**.
3. Click **Import Template** and select the `Total Item Value (Price × Quantity)` template.
4. Save the template.

### **Step 2: Create a User-Defined Variable**
1. Go to **Variables > New > User-Defined Variables**.
2. Select `Total Item Value (Price × Quantity)`.
3. Configure the following fields:

#### **Variable Configuration Fields**
| Field Name | Description |
|------------|-------------|
| **Items Array Variable** | The variable containing the array of objects (e.g., `{{dlv - ecommerce.items}}`). |
| **Price Attribute Key** | The attribute name representing the price in each object (e.g., `price`). |
| **Quantity Attribute Key** | The attribute name representing the quantity in each object (e.g., `quantity`). |

4. Save the variable.

### **Step 3: Use the Variable in GTM**
You can reference this variable in **Google Analytics 4 (GA4) events**, **Custom JavaScript Variables**, or **Data Layer Variables** to dynamically pass calculated total values.

---

## Expected Output Based on Configuration
| Items Array | Price Key | Quantity Key | Computed Output |
|------------|-----------|--------------|-----------------|
| `[ { item: 'A', price: '10', quantity: '2' }, { item: 'B', price: '5', quantity: '3' } ]` | `price` | `quantity` | **35** (`10×2 + 5×3`) |
| `[ { id: 'X', cost: '20', count: '4' } ]` | `cost` | `count` | **80** (`20×4`) |
| `[ { product: 'Y', amount: '50' } ]` | `amount` | `qty` | **undefined** (Missing `qty`) |
| `[]` | `price` | `quantity` | **undefined** (Empty array) |

- If **all necessary attributes exist**, it returns the **computed total value**.
- If **keys are missing or incorrect**, it returns **undefined**.
- If **the array is empty**, it returns **undefined**.

---


## License
This template is released under the **APACHE License**.

## Author
Developed by **Jonah Onyejekwe**.
