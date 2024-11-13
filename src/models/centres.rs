use sea_orm::entity::prelude::*;
use super::_entities::centres::{ActiveModel, Entity};
pub type Centres = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
