use loco_rs::prelude::cookie::Cookie;
use loco_rs::prelude::*;

use crate::views::auth::LoginResponse;

use crate::models::_entities::contacts;

pub fn index(v: &impl ViewRenderer, items: &contacts::Model) -> Result<Response> {
    // can set cookie nut cont read from html serverside
    format::render().view(
        v,
        "mtc/index.html",
        serde_json::json!({"contact": items, "status_btn":"login"}),
    )
}

pub fn logout(v: &impl ViewRenderer, items: &contacts::Model) -> Result<Response> {
    let cookie = Cookie::build(("mtc-cu", ""))
        // .domain("localhost:5173")
        .path("/")
        .same_site(cookie::SameSite::Strict)
        .secure(true)
        // .http_only(true) // Prevents getting cookie from Js, must use json http
        .build();
    format::render().cookies(&[cookie])?.view(
        v,
        "mtc/index.html",
        serde_json::json!({"contact": items, "status_btn":"login"}),
    )
}

pub fn you_are_in(v: &impl ViewRenderer, login_response: LoginResponse) -> Result<Response> {
    let cookie = Cookie::build(("mtc-cu", login_response.name.clone()))
        // .domain("localhost:5173")
        .path("/")
        .same_site(cookie::SameSite::Strict)
        .secure(true)
        // .http_only(true) // Prevents getting cookie from Js, must use json http
        .build();
    // tracing::info!("\n..:: DASHBOARD cookie ::..\n {:#?}", cookie.clone());
    format::render().cookies(&[cookie])?.view(
        v,
        "mtc/you_are_in.html",
        serde_json::json!({"login_answer":login_response}),
    )
}

pub fn not_in(v: &impl ViewRenderer) -> Result<Response> {
    format::render().view(v, "mtc/not_ok.html", serde_json::json!({}))
}
