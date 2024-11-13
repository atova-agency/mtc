cargo loco generate scaffold letype letype:string --kind htmx
cargo loco generate scaffold marque marque:string --kind htmx
cargo loco generate scaffold famille famille:string --kind htmx
cargo loco generate scaffold depot depot:string --kind htmx
cargo loco generate scaffold centre centre:string --kind htmx
cargo loco generate scaffold marque_oem marque_oem:string --kind htmx
cargo loco generate scaffold contact name:string phone:string email:string --kind htmx

cargo loco generate scaffold famille_mtc \
code:string \
designation:text \
pix:string \
letype:string \
marque:string \
prix_ttc:string \
famille:string \
depot:string \
centre:string \
reference:string \
oem:string \
marque_oem:string \
keywords:string \
--kind htmx
