use sea_orm::entity::prelude::*;
use super::_entities::famille_mtcs::{ActiveModel, Entity};
pub type FamilleMtcs = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
