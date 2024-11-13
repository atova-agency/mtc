use sea_orm::entity::prelude::*;
use super::_entities::marques::{ActiveModel, Entity};
pub type Marques = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
