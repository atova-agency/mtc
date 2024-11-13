use serde::{Deserialize, Serialize};

use loco_rs::prelude::*;
use loco_rs::{
    controller::views::pagination::{Pager, PagerMeta},
    prelude::model::query::{PageResponse, PaginationQuery},
};

use crate::models::_entities::famille_mtcs;
use crate::models::_entities::contacts;

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct ListResponse {
    id: i32,
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

impl From<famille_mtcs::Model> for ListResponse {
    fn from(item: famille_mtcs::Model) -> Self {
        Self {
            id: item.id,
            code: item.code.clone(),
            designation: item.designation.clone(),
            pix: item.pix.clone(),
            letype: item.letype.clone(),
            marque: item.marque.clone(),
            prix_ttc: item.prix_ttc.clone(),
            famille: item.famille.clone(),
            depot: item.depot.clone(),
            centre: item.centre.clone(),
            reference: item.reference.clone(),
            oem: item.oem.clone(),
            marque_oem: item.marque_oem.clone(),
            keywords: item.keywords.clone(),
        }
    }
}

#[derive(Debug, Deserialize, Serialize)]
pub struct PaginationResponse {}

impl PaginationResponse {
    #[must_use]
    pub fn response(
        data: PageResponse<famille_mtcs::Model>,
        pagination_query: &PaginationQuery,
    ) -> Pager<Vec<ListResponse>> {
        Pager {
            results: data
                .page
                .into_iter()
                .map(ListResponse::from)
                .collect::<Vec<ListResponse>>(),
            info: PagerMeta {
                page: pagination_query.page,
                page_size: pagination_query.page_size,
                total_pages: data.total_pages,
            },
        }
    }
}

/// Render a list view of famille_mtcs.
///
/// # Errors
///
/// When there is an issue with rendering the view.
//pub fn list(v: &impl ViewRenderer, items: &Vec<famille_mtcs::Model>) -> Result<Response> {
pub fn list(v: &impl ViewRenderer, paginated_famille_mtcs: PageResponse<famille_mtcs::Model>,
    pagination_query: query::PaginationQuery,) -> Result<Response> {
    
    let data = PaginationResponse::response(paginated_famille_mtcs, &pagination_query);

    // http://localhost:8000/famille_mtcs?page=2&page_size=5
    format::render().view(v, "famille_mtc/list.html", 
                            data!({ "data": data,
                                    "items": data.results, 
                                    "info": data.info,})
    )
}

/// Render a single famille_mtc view.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn show(v: &impl ViewRenderer, item: &famille_mtcs::Model) -> Result<Response> {
    format::render().view(v, "famille_mtc/show.html", data!({"item": item}))
}

/// Render a famille_mtc create form.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn create(v: &impl ViewRenderer) -> Result<Response> {
    format::render().view(v, "famille_mtc/create.html", data!({}))
}

/// Render a famille_mtc edit form.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn edit(v: &impl ViewRenderer, item: &famille_mtcs::Model) -> Result<Response> {
    format::render().view(v, "famille_mtc/edit.html", data!({"item": item}))
}

//---------------


/// Render a list view of famille_mtcs.
///
/// # Errors
///
/// When there is an issue with rendering the view.
//pub fn list(v: &impl ViewRenderer, items: &Vec<famille_mtcs::Model>) -> Result<Response> {
pub fn front_list(v: &impl ViewRenderer, paginated_famille_mtcs: PageResponse<famille_mtcs::Model>,
    pagination_query: query::PaginationQuery,) -> Result<Response> {
    
    let data = PaginationResponse::response(paginated_famille_mtcs, &pagination_query);

    // http://localhost:8000/famille_mtcs?page=2&page_size=5
    format::render().view(v, "famille_mtc/front_list.html", 
                            data!({ "data": data,
                                    "items": data.results, 
                                    "info": data.info,
                                     "status_btn": "login"})
    )
}

/// Render a single famille_mtc view.
///
/// # Errors
///
/// When there is an issue with rendering the view.
pub fn front_show(v: &impl ViewRenderer, item: &famille_mtcs::Model) -> Result<Response> {
    format::render().view(v, "famille_mtc/front_show.html", data!({"item": item, "status_btn": "login"}))
}

//TODO: mk a real "status_btn":status_btn
pub fn search_results(
    v: &impl ViewRenderer,
    items: &Vec<famille_mtcs::Model>,
    contact: &contacts::Model,
) -> Result<Response> {
    format::render().view(
        v,
        "search/search.html",
        serde_json::json!({"result":items, "contact": contact, "status_btn": "login"}),
    )
}


// restrict the route
pub fn admin_search_results(
    v: &impl ViewRenderer,
    items: &Vec<famille_mtcs::Model>,
) -> Result<Response> {
    format::render().view(
        v,
        "search/admin_search.html",
        serde_json::json!({"result":items,}),
    )
}
