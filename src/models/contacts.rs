use sea_orm::entity::prelude::*;
use super::_entities::contacts::{ActiveModel, Entity};
pub type Contacts = Entity;

impl ActiveModelBehavior for ActiveModel {
    // extend activemodel below (keep comment for generators)
}
