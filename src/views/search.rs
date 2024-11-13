#![allow(clippy::unused_async)]
use axum::debug_handler;
use axum::extract::Query;
use loco_rs::prelude::*;

use sea_orm::{
    sea_query::{Condition, Order},
    QueryOrder,
};

use tracing::info;
//use serde::{Deserialize, Serialize};
use serde::Deserialize;

use crate::models::_entities::contacts;
use crate::{
    models::_entities::famille_mtcs::{Column, Entity}, //ActiveModel, Model
    views,
};

async fn load_item(ctx: &AppContext, id: i32) -> Result<contacts::Model> {
    let item = contacts::Entity::find_by_id(id).one(&ctx.db).await?;
    item.ok_or_else(|| Error::NotFound)
}

/*
use std::collections::HashMap;

// `Query` gives you the query parameters and deserializes them.
async fn query( Query(params): Query<HashMap<String, String>>) {}
*/

#[derive(Deserialize, Clone)]
pub struct SearchParams {
    terms: String,
    category: String
}

#[debug_handler]
pub async fn search_terms_get(
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
    Query(search): Query<SearchParams>,
) -> Result<Response> {
    // split terms in to vector sep is space
    let key_words: Vec<String> = search
        .terms
        .split_whitespace()
        .map(str::to_string)
        .collect(); //split_whitespace().collect();
    let category = match search.category
                            //.split_whitespace()
                            .as_str() { //.map(str::to_string) {
        "code" => Column::Code,
        "designation" => Column::Designation,
        "letype" => Column::Letype,
        "marque" => Column::Marque,
        "famille" => Column::Famille,
        "depot" => Column::Depot,
        "centre" => Column::Centre, 
        "reference" => Column::Reference, 
        "oem" => Column::Oem, 
        "marque_oem" => Column::MarqueOem,
        _ => Column::Designation,
    };

    let mut conditions = Condition::any(); //all() is "and" any is "or"
                                           //let key_words: Vec<String> = vec!["Valeo".to_string(), "Provia".to_string(), "toto".to_string(), ];
                                           // CaseInsensitiveText
    for keyword in key_words {
        //let keyword = format!("%{}%", keyword);
        //conditions = conditions.add(Column::Designation.like(&keyword));
        // NOTE: contains("keyword") == like("%keyword%")
        conditions = conditions.add(category.contains(&keyword));
        //conditions = conditions.add(Column::Designation.contains(&keyword));
        info!("ADMIN_SEARCH: \n\nkeyword: {}\t category: {:?}\n\n", keyword, category);
    }
    //
    let items = Entity::find()
        .filter(conditions) //, "Provia". "Textar")) //key_words
        .order_by(Column::Id, Order::Desc)
        .all(&ctx.db)
        .await?;

    /*
    // ilike
    use sea_query::{*, tests_cfg::*, extension::postgres::PgExpr};

    let query = Query::select()
        .columns([Char::Character, Char::SizeW, Char::SizeH])
        .from(Char::Table)
        .and_where(Expr::col((Char::Table, Char::Character)).ilike("Ours'%"))
        .to_owned();

    // lower
    Expr::expr(Func::lower(Expr::col(Column::Name))).eq(name.trim().to_lowercase())
    assert_eq!(
        Query::select()
            .column(Font::Id)
            .from(Font::Table)
            .and_where(
                Expr::expr(Func::lower(Expr::col(Font::Name))).eq("abc".trim().to_lowercase())
            )
            .to_string(MysqlQueryBuilder),
        "SELECT `id` FROM `font` WHERE LOWER(`name`) = 'abc'"
    );
    // https://github.com/SeaQL/sea-orm/discussions/1456
    */
    let contact = load_item(&ctx, 1).await?;
    views::famille_mtc::search_results(&v, &items, &contact)
}


#[debug_handler]
pub async fn search_terms_admin(
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
    Query(search): Query<SearchParams>,
) -> Result<Response> {
    // split terms in to vector sep is space
    let key_words: Vec<String> = search
        .terms
        .split_whitespace()
        .map(str::to_string)
        .collect(); //split_whitespace().collect();

    let category = match search.category
                            //.split_whitespace()
                            .as_str() { //.map(str::to_string) {
        "code" => Column::Code,
        "designation" => Column::Designation,
        "letype" => Column::Letype,
        "marque" => Column::Marque,
        "famille" => Column::Famille,
        "depot" => Column::Depot,
        "centre" => Column::Centre, 
        "reference" => Column::Reference, 
        "oem" => Column::Oem, 
        "marque_oem" => Column::MarqueOem,
        _ => Column::Designation,
    };

    let mut conditions = Condition::any(); //all() is "and" any is "or"
                                           //let key_words: Vec<String> = vec!["Valeo".to_string(), "Provia".to_string(), "toto".to_string(), ];
                                           // CaseInsensitiveText
    for keyword in key_words {
        //let keyword = format!("%{}%", keyword);
        //conditions = conditions.add(Column::Designation.like(&keyword));
        // NOTE: contains("keyword") == like("%keyword%")
        conditions = conditions.add(category.contains(&keyword));
        //conditions = conditions.add(Column::Designation.contains(&keyword));
        info!("ADMIN_SEARCH: \n\nkeyword: {}\t category: {:?}\n\n", keyword, category);
    }
    //
    let items = Entity::find()
        .filter(conditions) //, "Provia". "Textar")) //key_words
        .order_by(Column::Id, Order::Desc)
        .all(&ctx.db)
        .await?;
    // http://localhost:8000/search/admin?terms=frein
    views::famille_mtc::admin_search_results(&v, &items)
}

/*
#[debug_handler]
pub async fn search_terms_post(
                ViewEngine(v): ViewEngine<TeraView>,
                //State(ctx): State<AppContext>,
                //RawQuery(req): RawQuery
                //Query(req): Query<SearchParams>
                RawForm(form): RawForm) -> Result<Response> {

    //let req = format::text(&req.unwrap()); //.unwrap();
    //dbg!("{:#?}", req.clone());
    //format::json(Entity::find().all(&ctx.db).await?)
    //RawForm::from_request(req, &()).await.unwrap().0
    views::famille_mtc::search_result(&v, form.terms) //expect("should not be EMPTY")) //format::empty()
}
*/

pub fn routes() -> Routes {
    Routes::new()
        .prefix("search")
        .add("/", get(search_terms_get)) //USER http://localhost:8000/search?terms=frein
        //.add("/admin", get(search_terms_admin)) //ADMIN http://localhost:8000/search/admin?terms=frein
}
