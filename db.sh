docker run -d --name mtc -p 5432:5432 \
  -e POSTGRES_USER=mtc \
  -e POSTGRES_DB=mtc_development \
  -e POSTGRES_PASSWORD="mtc" \
  postgres:15.3-alpine
