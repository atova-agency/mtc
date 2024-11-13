#![allow(clippy::missing_errors_doc)]
#![allow(clippy::unnecessary_struct_initialization)]
#![allow(clippy::unused_async)]
use axum::debug_handler;
use loco_rs::prelude::*;

use crate::{
    models::{
        _entities::{users, contacts::{Entity, Model}},
        users::LoginParams
    },
    views, ////views::auth::LoginResponse,
    //controllers::famille_mtc::{user_list, user_show},
};

async fn load_item(ctx: &AppContext, id: i32) -> Result<Model> {
    let item = Entity::find_by_id(id).one(&ctx.db).await?;
    item.ok_or_else(|| Error::NotFound)
}

#[debug_handler]
pub async fn index(
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
) -> Result<Response> {
    let item = load_item(&ctx, 1).await?;

    views::frontend::index(&v, &item)
}

/*
#[debug_handler]
pub async fn logout(    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,) -> Result<Response> { 
/*    // del cookie here 
    let cookie = Cookie::from("mtc-cu");
    tracing::info!("\n..:: logout cookie ::..>\n {:#?}", cookie.clone());
    /*
        let cookie = Cookie::build(("mtc-cu", ""))
        // .domain("localhost:5173")
        .path("/")
        .same_site(cookie::SameSite::Strict)
        .secure(true)
        //.http_only(true) // Prevents getting cookie from Js, must use json http
        .build();
    
    format::render()
        .cookies(&[cookie])?
        .view( v, "mtc/you_are_in.html", 
                  serde_json::json!({"login_answer":login_response})
        )
    */
    format::redirect("/")
*/
    let item = load_item(&ctx, 1).await?;

    views::frontend::logout(&v, &item)
}
*/

pub async fn logout() -> Result<Response> {
    format::redirect("/")
}

#[debug_handler]
pub async fn login(
//    ViewEngine(v): ViewEngine<TeraView>,
//    State(ctx): State<AppContext>,hx-target='body'
// <script src="https://unpkg.com/htmx.org/dist/ext/json-enc.js"></script>
) -> Result<Response> {
    
    let form = r#"
<!-- <script src="/static/js/htmx/ext/json-enc.js"></script> -->

<div class="container-fluid nav-bar sticky-top px-0 px-lg-4 py-2 py-lg-0" style="top: -100px;">
    <div class="container">
        <form hx-post='/login'  hx-indicator='#indicator'
        hx-headers='{"Content-Type": "application/json"}' hx-ext='json-enc'>
            <label>Email: <input type='email' name='email'></label>
            <label>Password: <input type='password' name='password'></label>
            <input type='submit' value='Submit'>
            <img id='indicator' class='htmx-indicator' src='/static/img/loading.gif' width='2%'/>
        </form>
    </div>
</div>
"#;

    format::html(&form)
}

/// Creates a user login and returns a token
#[debug_handler]
async fn check_user(State(ctx): State<AppContext>, ViewEngine(v): ViewEngine<TeraView>, Json(params): Json<LoginParams>) -> Result<Response> {
    let user = users::Model::find_by_email(&ctx.db, &params.email).await; //not using ?. Need to check is user is ok
  
    if !user.is_ok() {
        //return unauthorized("unauthorized!");
        // dont inform user or robots/hackers. 
        return views::frontend::not_in(&v,); //format::redirect("/");
    }
    let user =user?;  //user is ok so can get the rest 

    let valid = user.verify_password(&params.password);

    if !valid {
        //return unauthorized("unauthorized!");
        // dont inform user or robots/hackers. 
        return views::frontend::not_in(&v,);
    }

    let jwt_secret = ctx.config.get_jwt_config()?;

    let token = user
        .generate_jwt(&jwt_secret.secret, &jwt_secret.expiration)
        .or_else(|_| unauthorized("unauthorized!"))?;

    //=============
    //=== Rem: Fix auth/token usage
    //=============
    let data = views::auth::LoginResponse::new(&user, &token);// format::json(LoginResponse::new(&user, &token));
    //logged_in(State(ctx), ViewEngine(v), data).await
    views::frontend::you_are_in(&v,data)
    //format::redirect("/admin/dashboard")
}

pub fn routes() -> Routes {
    Routes::new()
        //.prefix("")
        .add("/", get(index))
        .add("/login", get(login))
        .add("/login", post(check_user))
        .add("/logout", get(logout))
}



