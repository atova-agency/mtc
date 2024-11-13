use sea_orm::entity::prelude::*;
use super::_entities::marque_oems::{ActiveModel, Entity};
pub type MarqueOems = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
