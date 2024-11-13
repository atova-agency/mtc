use loco_rs::prelude::*;

//use crate::views::auth::LoginResponse;


pub fn dashboard(v: &impl ViewRenderer) -> Result<Response> {
    //tracing::info!("..:: DASHBOARD view ::..");
    format::render().view(v, "admin_index.html", serde_json::json!({"cookie":"mtc-cu"}))
}

