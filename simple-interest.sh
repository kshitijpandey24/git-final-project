#!/bin/bash
# Simple Interest Calculator
# Formula: SI = (Principal * Rate * Time) / 100

echo "=== Simple Interest Calculator ==="

read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (% per year): " rate
read -p "Enter the time period (in years): " time

# Validate that all inputs are non-negative numbers
for value in "$principal" "$rate" "$time"; do
  if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: please enter valid positive numbers only."
    exit 1
  fi
done

simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo "-----------------------------------"
echo "Principal      : $principal"
echo "Rate of interest: $rate %"
echo "Time period    : $time years"
echo "Simple Interest: $simple_interest"
echo "Total Amount   : $total_amount"
