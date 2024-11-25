use std::fs::File;
use std::io::Write;

macro_rules! quote {
	() => {
		/*
			Le pire n'est jamais certain.
		*/
	}
}

macro_rules! open_and_write {
	() => {
		let mut buffer = File::create("Grace_kid.rs")?;
		write!(&mut buffer, "use std::fs::File;\nuse std::io::Write;\n\nmacro_rules! quote {{\n\t() => {{\n\t\t/*\n\t\t\tLe pire n'est jamais certain.\n\t\t*/\n\t}}\n}}\n\nmacro_rules! open_and_write {{\n\t() => {{\n\t\tlet mut buffer = File::create(\"Grace_kid.rs\")?;\n\t\twrite!(&mut buffer, {0:?}, {0:?})?;\n\t}}\n}}\n\nmacro_rules! define_main {{\n\t($body:block) => {{\n\t\tfn main() -> std::io::Result<()> {{\n\t\t\t$body\n\t\t\tOk(())\n\t\t}}\n\t}};\n}}\n\ndefine_main!({{\n\tquote!();\n\topen_and_write!();\n}});", "use std::fs::File;\nuse std::io::Write;\n\nmacro_rules! quote {{\n\t() => {{\n\t\t/*\n\t\t\tLe pire n'est jamais certain.\n\t\t*/\n\t}}\n}}\n\nmacro_rules! open_and_write {{\n\t() => {{\n\t\tlet mut buffer = File::create(\"Grace_kid.rs\")?;\n\t\twrite!(&mut buffer, {0:?}, {0:?})?;\n\t}}\n}}\n\nmacro_rules! define_main {{\n\t($body:block) => {{\n\t\tfn main() -> std::io::Result<()> {{\n\t\t\t$body\n\t\t\tOk(())\n\t\t}}\n\t}};\n}}\n\ndefine_main!({{\n\tquote!();\n\topen_and_write!();\n}});")?;
	}
}

macro_rules! define_main {
	($body:block) => {
		fn main() -> std::io::Result<()> {
			$body
			Ok(())
		}
	};
}

define_main!({
	quote!();
	open_and_write!();
});