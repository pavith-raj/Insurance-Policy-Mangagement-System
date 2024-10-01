# Insurance Management Database

## Overview

The **Insurance Management Database** is designed to manage and store information related to insurance policies, customers, claims, and premium payments. This database provides a structured way to handle various insurance-related data, enabling efficient management of customer policies and claims processing.

## Features

- **Customer Management**: Store and manage customer information, including personal details and contact information.
- **Policy Management**: Track different types of insurance policies, including health, life, and vehicle insurance.
- **Claims Management**: Record and monitor claims made by customers, including their status and amounts.
- **Premium Payments**: Manage premium payment records associated with each policy.
- **Views**: Utilize views for easier access to commonly needed information, such as customer policy details and expired policies.

## Database Schema

The database includes the following tables:

1. **customers**: Stores customer details.
   - `customer_id`: Unique identifier for each customer.
   - `first_name`: Customer's first name.
   - `last_name`: Customer's last name.
   - `phone_no`: Customer's phone number.
   - `dob`: Date of birth.
   - `address`: Residential address.

2. **policy**: Records details of insurance policies.
   - `policy_id`: Unique identifier for each policy.
   - `customer_id`: Foreign key linking to the `customers` table.
   - `policy_type_id`: Foreign key linking to the `policy_type` table.
   - `start_date`: Policy start date.
   - `end_date`: Policy end date.
   - `coverage_amt`: Coverage amount.
   - `status`: Status of the policy (Active, Inactive, Expired).

3. **policy_type**: Defines different types of insurance policies.
   - `policy_type_id`: Unique identifier for each policy type.
   - `name`: Name of the policy type (e.g., Health Insurance, Life Insurance).
   - `description`: Description of the policy type.

4. **claims**: Records insurance claims.
   - `claim_id`: Unique identifier for each claim.
   - `policy_id`: Foreign key linking to the `policy` table.
   - `claim_date`: Date of the claim.
   - `description`: Description of the claim.
   - `amount`: Amount of the claim.
   - `status`: Status of the claim (Pending, Approved, Denied).
   - `customer_id`: Foreign key linking to the `customers` table.

5. **premium_payment**: Manages premium payment details.
   - `payment_id`: Unique identifier for each payment.
   - `policy_id`: Foreign key linking to the `policy` table.
   - `payment_date`: Date of the payment.
   - `amount`: Amount paid.
   - `reference_number`: Reference number for the payment.

6. **health_insurance**: Stores specific details for health insurance policies.
   - `policy_id`: Foreign key linking to the `policy` table.
   - `policy_holder_name`: Name of the policyholder.
   - `age`: Age of the policyholder.
   - `gender`: Gender of the policyholder.
   - `customer_id`: Foreign key linking to the `customers` table.
   - `policy_type_id`: Foreign key linking to the `policy_type` table.

7. **life_insurance**: Stores specific details for life insurance policies.
   - `policy_id`: Foreign key linking to the `policy` table.
   - `insured_name`: Name of the insured individual.
   - `beneficiary_name`: Name of the beneficiary.
   - `sum_assured`: Sum assured amount.
   - `customer_id`: Foreign key linking to the `customers` table.
   - `policy_type_id`: Foreign key linking to the `policy_type` table.

8. **vehicle_insurance**: Stores specific details for vehicle insurance policies.
   - `policy_id`: Foreign key linking to the `policy` table.
   - `vehicle_make`: Make of the vehicle.
   - `model`: Model of the vehicle.
   - `vehicle_no`: Vehicle registration number.
   - `customer_id`: Foreign key linking to the `customers` table.
   - `policy_type_id`: Foreign key linking to the `policy_type` table.

## Getting Started

### Prerequisites

- MySQL Server (version 8.0 or later)
- MySQL Workbench or any preferred SQL client

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/insurancemanagementdb.git
   cd insurancemanagementdb
   ```

2. **Create the database**:
   - Open your SQL client and run the `schema.sql` file to create the database and tables.

3. **Populate the database**:
   - The `schema.sql` file includes sample data for initial testing.

### Usage

You can execute SQL queries on the database to retrieve or manipulate data. Use the views for quick access to combined information about customers and their policies.
