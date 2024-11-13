use sea_orm::entity::prelude::*;
use super::_entities::familles::{ActiveModel, Entity};
pub type Familles = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
