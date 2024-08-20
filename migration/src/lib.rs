#![allow(elided_lifetimes_in_paths)]
#![allow(clippy::wildcard_imports)]
pub use sea_orm_migration::prelude::*;

mod m20220101_000001_users;
mod m20231103_114510_notes;

mod m20240820_084154_letypes;
mod m20240820_084239_marques;
mod m20240820_084316_familles;
mod m20240820_084352_depots;
mod m20240820_084428_centres;
mod m20240820_084505_marque_oems;
mod m20240820_084544_contacts;
mod m20240820_084624_famille_mtcs;
pub struct Migrator;

#[async_trait::async_trait]
impl MigratorTrait for Migrator {
    fn migrations() -> Vec<Box<dyn MigrationTrait>> {
        vec![
            Box::new(m20220101_000001_users::Migration),
            Box::new(m20231103_114510_notes::Migration),
            Box::new(m20240820_084154_letypes::Migration),
            Box::new(m20240820_084239_marques::Migration),
            Box::new(m20240820_084316_familles::Migration),
            Box::new(m20240820_084352_depots::Migration),
            Box::new(m20240820_084428_centres::Migration),
            Box::new(m20240820_084505_marque_oems::Migration),
            Box::new(m20240820_084544_contacts::Migration),
            Box::new(m20240820_084624_famille_mtcs::Migration),
        ]
    }
}