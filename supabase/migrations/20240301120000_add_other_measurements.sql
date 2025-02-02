/*
  # Add other_measurements column to customers table
  
  1. Changes
    - Add optional other_measurements column for additional measurement data
    
  2. Notes
    - Using safe column addition with IF NOT EXISTS check
    - Column is nullable to maintain compatibility with existing data
*/

DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'customers' AND column_name = 'other_measurements'
  ) THEN
    ALTER TABLE customers ADD COLUMN other_measurements text;
  END IF;
END $$; 