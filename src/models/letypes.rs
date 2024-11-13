use sea_orm::entity::prelude::*;
use super::_entities::letypes::{ActiveModel, Entity};
pub type Letypes = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
