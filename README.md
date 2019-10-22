To run the service:

1. Run mysql: `docker run -e POSTGRES_PASSWORD=sloth -e POSTGRES_USER=sloth -e POSTGRES_DB=sloth -d -p 5432:5432 postgres`
2. Run the `Application` class.
3. Generate data: `curl -X POST "http://localhost:8080/unifiedlineups/v1/lineups/generate"`
4. Get data: `curl "http://localhost:8080/unifiedlineups/v1/lineups?tmsId=RXKr3PsPlN" | jq`