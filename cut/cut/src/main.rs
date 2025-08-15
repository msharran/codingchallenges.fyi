use anyhow::Result;
use cut::runtime::Runtime;

fn main() -> Result<()> {
    let runtime = Runtime::new()?;
    runtime.exec()
}
