#!/bin/bash
set -euo pipefail

# Generate migration name with timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
migration_name="migration_$timestamp"

# Add Migration
dotnet ef migrations add $migration_name

# Generate SQL script
last_migration=$(dotnet ef migrations list | tail -2 | head -1)
dotnet ef migrations script $last_migration $migration_name -o "Migrations/sql/$migration_name.sql"

echo "Migration '$migration_name' created and SQL script generated."
echo "Run 'dotnet ef database update' to apply the migration to the database."
echo "Run 'dotnet ef migrations remove' to remove the migration if needed."
