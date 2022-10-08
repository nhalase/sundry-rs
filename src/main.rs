use driftwood::ApacheCommonLogger;
use tide::Request;

#[async_std::main]
async fn main() -> tide::Result<()> {
    let mut app = tide::new();
    app.with(ApacheCommonLogger);
    app.at("/healthz").get(healthz);
    app.listen("0.0.0.0:8080").await?;
    Ok(())
}

async fn healthz(_: Request<()>) -> tide::Result {
    Ok("UP".into())
}
