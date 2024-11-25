/*
	Fail to prepare, prepare to fail.
*/

fn print() {
	println!("/*\n\tFail to prepare, prepare to fail.\n*/\n\nfn print() {{\n\tprintln!({0:?}, {0:?});\n}}\n\nfn main() {{\n\t/*\n\t\t{{0:?}} indicates to the compiler to print the string at index zero {{0}} in a verbose way {{:?}}\n\t*/\n\tprint();\n}}", "/*\n\tFail to prepare, prepare to fail.\n*/\n\nfn print() {{\n\tprintln!({0:?}, {0:?});\n}}\n\nfn main() {{\n\t/*\n\t\t{{0:?}} indicates to the compiler to print the string at index zero {{0}} in a verbose way {{:?}}\n\t*/\n\tprint();\n}}");
}

fn main() {
	/*
		{0:?} indicates to the compiler to print the string at index zero {0} in a verbose way {:?}
	*/
	print();
}
