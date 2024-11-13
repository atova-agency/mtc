use loco_rs::schema::table_auto_tz;
use sea_orm_migration::{prelude::*, schema::*};

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .create_table(
                table_auto_tz(FamilleMtcs::Table)
                    .col(pk_auto(FamilleMtcs::Id))
                    .col(string_null(FamilleMtcs::Code))
                    .col(text_null(FamilleMtcs::Designation))
                    .col(string_null(FamilleMtcs::Pix))
                    .col(string_null(FamilleMtcs::Letype))
                    .col(string_null(FamilleMtcs::Marque))
                    .col(string_null(FamilleMtcs::PrixTtc))
                    .col(string_null(FamilleMtcs::Famille))
                    .col(string_null(FamilleMtcs::Depot))
                    .col(string_null(FamilleMtcs::Centre))
                    .col(string_null(FamilleMtcs::Reference))
                    .col(string_null(FamilleMtcs::Oem))
                    .col(string_null(FamilleMtcs::MarqueOem))
                    .col(string_null(FamilleMtcs::Keywords))
                    .to_owned(),
            )
            .await
    }

    async fn down(&self, manager: &SchemaManager) -> Result<(), DbErr> {
        manager
            .drop_table(Table::drop().table(FamilleMtcs::Table).to_owned())
            .await
    }
}

#[derive(DeriveIden)]
enum FamilleMtcs {
    Table,
    Id,
    Code,
    Designation,
    Pix,
    Letype,
    Marque,
    PrixTtc,
    Famille,
    Depot,
    Centre,
    Reference,
    Oem,
    MarqueOem,
    Keywords,
    
}


