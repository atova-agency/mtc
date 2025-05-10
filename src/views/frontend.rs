use loco_rs::prelude::*;

pub fn index(v: &impl ViewRenderer) -> Result<Response> {
    format::render().view(v, "index.html", data!({}))
}

