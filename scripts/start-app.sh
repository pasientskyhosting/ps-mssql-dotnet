#!/bin/bash

# Wait until mssql started and listens on port 1433.
while [ -z "`netstat -tln | grep 1433`" ]; do
  echo 'Waiting for mssql to start ...'
  sleep 1
done
echo 'mssql started.'

# Start app.
echo 'Starting AutomatedExport...'
dotnet /app/AutomatedExport.dll
