#![allow(elided_lifetimes_in_paths)]
#![allow(clippy::wildcard_imports)]
pub use sea_orm_migration::prelude::*;

mod m20220101_000001_users;

mod m20241113_150548_letypes;
mod m20241113_151209_marques;
mod m20241113_151735_familles;
mod m20241113_152226_depots;
mod m20241113_155040_centres;
mod m20241113_155836_marque_oems;
mod m20241113_160553_contacts;
mod m20241113_161241_famille_mtcs;
pub struct Migrator;

#[async_trait::async_trait]
impl MigratorTrait for Migrator {
    fn migrations() -> Vec<Box<dyn MigrationTrait>> {
        vec![
            // inject-below (do not remove this comment)
            Box::new(m20241113_161241_famille_mtcs::Migration),
            Box::new(m20241113_160553_contacts::Migration),
            Box::new(m20241113_155836_marque_oems::Migration),
            Box::new(m20241113_155040_centres::Migration),
            Box::new(m20241113_152226_depots::Migration),
            Box::new(m20241113_151735_familles::Migration),
            Box::new(m20241113_151209_marques::Migration),
            Box::new(m20241113_150548_letypes::Migration),
            Box::new(m20220101_000001_users::Migration),
            // inject-above (do not remove this comment)
        ]
    }
}