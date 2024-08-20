docker container stop loco_db
docker container remove loco_db
docker run --name loco_db -d -p 5433:5432 \
-e POSTGRES_USER=loco -e POSTGRES_DB=design_development \
-e POSTGRES_PASSWORD="loco" postgres:15.3-alpine

## open in another terminal to drop into psql
## docker exec -ti NAME_OF_CONTAINER psql -U YOUR_POSTGRES_USERNAME DATABASE
#docker exec -it mtcdb psql -U loco mtc_development
# to add case insensitivity CREATE EXTENSION citext; or better
# CREATE EXTENSION IF NOT EXISTS citext;
# This will create the CITEXT extension in the database to which you are connected 
# if the extension hasn’t already been created for the database. 
# You can view all enabled extensions for a Postgres database with 
# the \dx command.
# It is better to use LOWER in your query. Its faster.
# https://github.com/SeaQL/sea-orm/issues/2215 DONT USE CITEXT
# if you use it you need to manually add to model _entity ex:
# 
# #[sea_orm(column_type = "custom(\"citext\")", select_as = "text", save_as = "citext", unique)]
# pub email: String

