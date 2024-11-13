#![allow(clippy::missing_errors_doc)]
#![allow(clippy::unnecessary_struct_initialization)]
#![allow(clippy::unused_async)]
use axum::{debug_handler, extract::Query};
use loco_rs::prelude::*;
use serde::{Deserialize, Serialize};
use sea_orm::{sea_query::Order, QueryOrder};


use crate::{
    models::_entities::famille_mtcs::{ActiveModel, Column, Entity, Model},
    views,
};

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Params {
    pub code: Option<String>,
    pub designation: Option<String>,
    pub pix: Option<String>,
    pub letype: Option<String>,
    pub marque: Option<String>,
    pub prix_ttc: Option<String>,
    pub famille: Option<String>,
    pub depot: Option<String>,
    pub centre: Option<String>,
    pub reference: Option<String>,
    pub oem: Option<String>,
    pub marque_oem: Option<String>,
    pub keywords: Option<String>,
    }

impl Params {
    fn update(&self, item: &mut ActiveModel) {
      item.code = Set(self.code.clone());
      item.designation = Set(self.designation.clone());
      item.pix = Set(self.pix.clone());
      item.letype = Set(self.letype.clone());
      item.marque = Set(self.marque.clone());
      item.prix_ttc = Set(self.prix_ttc.clone());
      item.famille = Set(self.famille.clone());
      item.depot = Set(self.depot.clone());
      item.centre = Set(self.centre.clone());
      item.reference = Set(self.reference.clone());
      item.oem = Set(self.oem.clone());
      item.marque_oem = Set(self.marque_oem.clone());
      item.keywords = Set(self.keywords.clone());
      }
}

#[derive(Debug, Deserialize)]
pub struct ListQueryParams {
    pub code: Option<String>,
    pub designation: Option<String>,
    pub pix: Option<String>,
    pub letype: Option<String>,
    pub marque: Option<String>,
    pub prix_ttc: Option<String>,
    pub famille: Option<String>,
    pub depot: Option<String>,
    pub centre: Option<String>,
    pub reference: Option<String>,
    pub oem: Option<String>,
    pub marque_oem: Option<String>,
    pub keywords: Option<String>,
    #[serde(flatten)]
    pub pagination: query::PaginationQuery,
}

async fn load_item(ctx: &AppContext, id: i32) -> Result<Model> {
    let item = Entity::find_by_id(id).one(&ctx.db).await?;
    item.ok_or_else(|| Error::NotFound)
}


#[debug_handler]
pub async fn list( //auth: auth::JWT,
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
    Query(params): Query<ListQueryParams>,
) -> Result<Response> {

    let pagination_query = query::PaginationQuery {
        page_size: params.pagination.page_size,
        page: params.pagination.page,
    };
    let /*mut*/ condition = query::condition();
    let paginated_famille_mtcs = query::paginate(
        &ctx.db,
        Entity::find().order_by(Column::Id, Order::Desc),
        Some(condition.build()), //Some(query::with(params.into_query()).build()),
        &pagination_query,
    )
    .await?;

    views::famille_mtc::list(&v, 
        paginated_famille_mtcs, 
        pagination_query, ) //&item)
}

#[debug_handler]
pub async fn new(
    ViewEngine(v): ViewEngine<TeraView>,
    State(_ctx): State<AppContext>,
) -> Result<Response> {
    views::famille_mtc::create(&v)
}

#[debug_handler]
pub async fn update(
    Path(id): Path<i32>,
    State(ctx): State<AppContext>,
    Json(params): Json<Params>,
) -> Result<Response> {
    let item = load_item(&ctx, id).await?;
    let mut item = item.into_active_model();
    params.update(&mut item);
    let item = item.update(&ctx.db).await?;
    format::json(item)
}

#[debug_handler]
pub async fn edit(
    Path(id): Path<i32>,
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
) -> Result<Response> {
    let item = load_item(&ctx, id).await?;
    views::famille_mtc::edit(&v, &item)
}

#[debug_handler]
pub async fn show(
    Path(id): Path<i32>,
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
) -> Result<Response> {
    let item = load_item(&ctx, id).await?;
    views::famille_mtc::show(&v, &item)
}

#[debug_handler]
pub async fn add(
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
    Json(params): Json<Params>,
) -> Result<Response> {
    let mut item = ActiveModel {
        ..Default::default()
    };
    params.update(&mut item);
    let item = item.insert(&ctx.db).await?;
    views::famille_mtc::show(&v, &item)
}

#[debug_handler]
pub async fn remove(Path(id): Path<i32>, State(ctx): State<AppContext>) -> Result<Response> {
    load_item(&ctx, id).await?.delete(&ctx.db).await?;
    format::empty()
}

// v-- TMP ===================================
#[debug_handler]
pub async fn front_show(
    Path(id): Path<i32>,
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
) -> Result<Response> {
    let item = load_item(&ctx, id).await?;
    views::famille_mtc::front_show(&v, &item)
}

#[debug_handler]
pub async fn front_list( //auth: auth::JWT,
    ViewEngine(v): ViewEngine<TeraView>,
    State(ctx): State<AppContext>,
    Query(params): Query<ListQueryParams>,
) -> Result<Response> {

    let pagination_query = query::PaginationQuery {
        page_size: params.pagination.page_size,
        page: params.pagination.page,
    };
    let /*mut*/ condition = query::condition();
    let paginated_famille_mtcs = query::paginate(
        &ctx.db,
        Entity::find().order_by(Column::Id, Order::Desc),
        Some(condition.build()), //Some(query::with(params.into_query()).build()),
        &pagination_query,
    )
    .await?;

    views::famille_mtc::front_list(&v, 
        paginated_famille_mtcs, 
        pagination_query, ) //&item)
}

// ^-- TMP ===================================

pub fn routes() -> Routes {
    Routes::new()
        .prefix("famille_mtcs/")
        .add("/", get(list))
        .add("mtc/", get(front_list))
        .add("/", post(add))
        .add("new", get(new))
        .add(":id", get(show))
        .add("mtc/:id", get(front_show))
        .add(":id/edit", get(edit))
        .add(":id", post(update))
        .add(":id", delete(remove))
}
