dotnet publish -c Release -r linux-x64 --self-contained true -o ./publish

dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true