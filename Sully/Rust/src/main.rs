use std::path::Path;
use std::fs::File;
use std::io::Write;
use std::process::Command;

const NUMBER: i64 = 5;

macro_rules! quote {
	() => {
		/*
			This is enshittification: surpluses are first directed to users; then, once they're locked in, surpluses go to suppliers; then once they're locked in, the surplus is handed to shareholders and the platform becomes a useless pile of shit. From mobile app stores to Steam, from Facebook to Twitter, this is the enshittification lifecycle.
			https://www.reddit.com/r/rust/comments/146y5y1/announcement_rrust_will_be_joining_the_blackout
		*/
	}
}

macro_rules! fmt_str {
	() => {
		"use std::path::Path;\nuse std::fs::File;\nuse std::io::Write;\nuse std::process::Command;\n\nconst NUMBER: i64 = {1:?};\n\nmacro_rules! quote {{\n\t() => {{\n\t\t/*\n\t\t\tThis is enshittification: surpluses are first directed to users; then, once they're locked in, surpluses go to suppliers; then once they're locked in, the surplus is handed to shareholders and the platform becomes a useless pile of shit. From mobile app stores to Steam, from Facebook to Twitter, this is the enshittification lifecycle.\n\t\t\thttps://www.reddit.com/r/rust/comments/146y5y1/announcement_rrust_will_be_joining_the_blackout\n\t\t*/\n\t}}\n}}\n\nmacro_rules! fmt_str {{\n\t() => {{\n\t\t{0:?}\n\t}}\n}}\n\nmacro_rules! open_and_write {{\n\t($nbnext:expr) => {{\n\t\tlet filename = format!(\"Sully_{{}}.rs\", $nbnext);\n\t\tlet mut buffer = File::create(filename)?;\n\t\twrite!(&mut buffer, fmt_str!(), fmt_str!(), $nbnext)?;\n\t}}\n}}\n\nmacro_rules! define_main {{\n\t($body:block) => {{\n\t\tfn main() -> std::io::Result<()> {{\n\t\t\t$body\n\t\t\tOk(())\n\t\t}}\n\t}};\n}}\n\ndefine_main!({{\n\tquote!();\n\tlet mut nbnext: i64 = NUMBER;\n\tif Path::new(\"Sully_5.rs\").exists() {{\n\t\tnbnext = NUMBER - 1;\n\t}}\n\tif NUMBER > 0 {{\n\t\topen_and_write!(nbnext);\n\t\tlet sourcefile = format!(\"./Sully_{{0:?}}.rs\", nbnext);\n\t\tlet exec = format!(\"./Sully_{{0:?}}\", nbnext);\n\t\tCommand::new(\"rustc\").arg(sourcefile).spawn().expect(\"Danger: compilation\").wait().expect(\"Compilation error\");\n\t\tCommand::new(\"chmod\").arg(\"+x\").arg(exec.clone()).spawn().expect(\"Danger: conferring permissions\").wait().expect(\"Permission issue\");\n\t\tCommand::new(exec).spawn().expect(\"Danger: execution\");\n\t}}\n}});"
	}
}

macro_rules! open_and_write {
	($nbnext:expr) => {
		let filename = format!("Sully_{}.rs", $nbnext);
		let mut buffer = File::create(filename)?;
		write!(&mut buffer, fmt_str!(), fmt_str!(), $nbnext)?;
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
	let mut nbnext: i64 = NUMBER;
	if Path::new("Sully_5.rs").exists() {
		nbnext = NUMBER - 1;
	}
	if NUMBER > 0 {
		open_and_write!(nbnext);
		let sourcefile = format!("./Sully_{0:?}.rs", nbnext);
		let exec = format!("./Sully_{0:?}", nbnext);
		Command::new("rustc").arg(sourcefile).spawn().expect("Danger: compilation").wait().expect("Compilation error");
		Command::new("chmod").arg("+x").arg(exec.clone()).spawn().expect("Danger: conferring permissions").wait().expect("Permission issue");
		Command::new(exec).spawn().expect("Danger: execution");
	}
});