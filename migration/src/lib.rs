#![allow(elided_lifetimes_in_paths)]
#![allow(clippy::wildcard_imports)]
pub use sea_orm_migration::prelude::*;
mod m20220101_000001_users;

mod m20250510_115228_letypes;
mod m20250510_120310_marques;
mod m20250510_121530_familles;
mod m20250510_122457_depots;
mod m20250510_123759_centres;
mod m20250510_125134_marque_oems;
mod m20250510_130923_contacts;
mod m20250510_132138_famille_mtcs;
pub struct Migrator;

#[async_trait::async_trait]
impl MigratorTrait for Migrator {
    fn migrations() -> Vec<Box<dyn MigrationTrait>> {
        vec![
            Box::new(m20220101_000001_users::Migration),
            Box::new(m20250510_115228_letypes::Migration),
            Box::new(m20250510_120310_marques::Migration),
            Box::new(m20250510_121530_familles::Migration),
            Box::new(m20250510_122457_depots::Migration),
            Box::new(m20250510_123759_centres::Migration),
            Box::new(m20250510_125134_marque_oems::Migration),
            Box::new(m20250510_130923_contacts::Migration),
            Box::new(m20250510_132138_famille_mtcs::Migration),
            // inject-above (do not remove this comment)
        ]
    }
}