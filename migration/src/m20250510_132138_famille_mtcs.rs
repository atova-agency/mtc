use loco_rs::schema::*;
use sea_orm_migration::prelude::*;

#[derive(DeriveMigrationName)]
pub struct Migration;

#[async_trait::async_trait]
impl MigrationTrait for Migration {
    async fn up(&self, m: &SchemaManager) -> Result<(), DbErr> {
        create_table(m, "famille_mtcs",
            &[
            
            ("id", ColType::PkAuto),
            
            ("code", ColType::IntegerUniq),
            ("designation", ColType::TextNull),
            ("pix", ColType::StringNull),
            ("prix_ttc", ColType::IntegerNull),
            ("reference", ColType::StringNull),
            ("oem", ColType::StringNull),
            ("keywords", ColType::StringNull),
            ],
            &[
            ("letype", ""),
            ("marque", ""),
            ("famille", ""),
            ("depot", ""),
            ("centre", ""),
            ("marque_oem", ""),
            ]
        ).await
    }

    async fn down(&self, m: &SchemaManager) -> Result<(), DbErr> {
        drop_table(m, "famille_mtcs").await
    }
}
