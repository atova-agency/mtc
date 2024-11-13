use axum::debug_handler;
use loco_rs::prelude::*;

//use serde::{Deserialize, Serialize};

use loco_rs::controller::middleware;
use crate::{ 
    models::_entities::users, 
    views::user::CurrentResponse,
    views::admin,
};
use crate::controllers::search;

async fn current_by_api_key(
    auth: middleware::auth::ApiToken<users::Model>,
    State(_ctx): State<AppContext>,
) -> Result<Response> {
    format::json(CurrentResponse::new(&auth.user))
}

#[debug_handler]
pub async fn dashboard(
    ViewEngine(v): ViewEngine<TeraView>,
    State(_ctx): State<AppContext>,
) -> Result<Response> {
    //tracing::info!("\t..:: DASHBOARD controller ::..\t");
    //views::admin::
    admin::dashboard(&v)
}

pub fn routes() -> Routes {
    Routes::new()
        .prefix("admin")
        .add("/dashboard", get(dashboard))
        .add("/search", get(search::search_terms_admin))
        .add("/key", get(current_by_api_key)) //del me just test
}

