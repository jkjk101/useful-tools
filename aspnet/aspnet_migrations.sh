dotnet ef migrations add [migrationName]--context CrawlerContext
dotnet ef database update --context CrawlerContext
dotnet ef migrations remove
dotnet ef migrations script [fromMigration] [toMigration] > Migrations/sql/[fromMigration]_[toMigration].sql
# fromMigration will not be included