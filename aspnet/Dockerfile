FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app

# Install dotnet-ef tool globally
RUN dotnet tool install --global dotnet-ef --version 8.0.17
ENV PATH="$PATH:/root/.dotnet/tools"

# Copy project files
COPY ["*.csproj", "./"]
RUN dotnet restore
COPY . .

# install ssh client
RUN apt-get update && apt-get install -y openssh-client
