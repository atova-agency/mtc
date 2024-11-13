use sea_orm::entity::prelude::*;
use super::_entities::depots::{ActiveModel, Entity};
pub type Depots = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
