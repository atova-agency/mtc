# mk_standalone_tables.sh
# Stand-alone tables
cargo loco g scaffold letype letype:string --kind htmx 
cargo loco g scaffold marque marque:string --kind htmx
cargo loco g scaffold famille famille:string --kind htmx
cargo loco g scaffold depot depot:string --kind htmx
cargo loco g scaffold centre centre:string --kind htmx
cargo loco g scaffold marque_oem marque_oem:string --kind htmx
cargo loco g scaffold contact name:string phone:string email:string --kind htmx

echo " "
echo "====================="
echo " mk ref table"
echo "====================="
echo " "

cargo loco g scaffold famille_mtc \
code:int^ \
designation:text \
pix:string \
letype:references \
marque:references \
prix_ttc:int \
famille:references \
depot:references \
centre:references \
reference:string \
oem:string \
marque_oem:references \
keywords:string --kind htmx
