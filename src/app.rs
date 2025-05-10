use async_trait::async_trait;
use loco_rs::{
    app::{AppContext, Hooks, Initializer},
    bgworker::{BackgroundWorker, Queue},
    boot::{create_app, BootResult, StartMode},
    config::Config,
    controller::AppRoutes,
    db::{self, truncate_table},
    environment::Environment,
    task::Tasks,
    Result,
};
use migration::Migrator;
use std::path::Path;

#[allow(unused_imports)]
use crate::{
    controllers, initializers, 
    models::_entities::{ 
            centres, contacts, 
            depots, famille_mtcs, 
            familles, letypes, 
            marque_oems, marques,
            users}, 
    tasks, 
    workers::downloader::DownloadWorker,
};

pub struct App;
#[async_trait]
impl Hooks for App {
    fn app_name() -> &'static str {
        env!("CARGO_CRATE_NAME")
    }

    fn app_version() -> String {
        format!(
            "{} ({})",
            env!("CARGO_PKG_VERSION"),
            option_env!("BUILD_SHA")
                .or(option_env!("GITHUB_SHA"))
                .unwrap_or("dev")
        )
    }

    async fn boot(
        mode: StartMode,
        environment: &Environment,
        config: Config,
    ) -> Result<BootResult> {
        create_app::<Self, Migrator>(mode, environment, config).await
    }

    async fn initializers(_ctx: &AppContext) -> Result<Vec<Box<dyn Initializer>>> {
        Ok(vec![Box::new(
            initializers::view_engine::ViewEngineInitializer,
        )])
    }

    fn routes(_ctx: &AppContext) -> AppRoutes {
        AppRoutes::with_default_routes() // controller routes below
            .add_route(controllers::famille_mtc::routes())
            .add_route(controllers::contact::routes())
            .add_route(controllers::marque_oem::routes())
            .add_route(controllers::centre::routes())
            .add_route(controllers::depot::routes())
            .add_route(controllers::famille::routes())
            .add_route(controllers::marque::routes())
            .add_route(controllers::letype::routes())
//
            .add_route(controllers::frontend::routes())
//            .add_route(controllers::search::routes())
//            .add_route(controllers::admin::routes())
//
            .add_route(controllers::auth::routes())
    }
    async fn connect_workers(ctx: &AppContext, queue: &Queue) -> Result<()> {
        queue.register(DownloadWorker::build(ctx)).await?;
        Ok(())
    }

    #[allow(unused_variables)]
    fn register_tasks(tasks: &mut Tasks) {
        // tasks-inject (do not remove)
    }
    async fn truncate(ctx: &AppContext) -> Result<()> {
        truncate_table(&ctx.db, users::Entity).await?;
        Ok(())
    }
    async fn seed(ctx: &AppContext, base: &Path) -> Result<()> {
        db::seed::<users::ActiveModel>(&ctx.db, &base.join("users.yaml").display().to_string())
            .await?;
//
        db::seed::<letypes::ActiveModel>(&ctx.db, &base.join("letypes.yaml").display().to_string())
            .await?;
        db::seed::<marques::ActiveModel>(&ctx.db, &base.join("marques.yaml").display().to_string())
            .await?;
        db::seed::<familles::ActiveModel>(&ctx.db, &base.join("familles.yaml").display().to_string())
            .await?;
        db::seed::<depots::ActiveModel>(&ctx.db, &base.join("depots.yaml").display().to_string())
            .await?;
        db::seed::<centres::ActiveModel>(&ctx.db, &base.join("centres.yaml").display().to_string())
            .await?;
        db::seed::<marque_oems::ActiveModel>(&ctx.db,
            &base.join("marque_oems.yaml").display().to_string(),
        )
        .await?;
        db::seed::<contacts::ActiveModel>(&ctx.db, &base.join("contacts.yaml").display().to_string())
            .await?;
        db::seed::<famille_mtcs::ActiveModel>(&ctx.db,
            &base.join("famille_mtcs.yaml").display().to_string(),
        )
        .await?;
        //
        Ok(())
    }
}
