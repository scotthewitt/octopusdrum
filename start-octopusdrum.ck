//!Rather than having to manually add the files in the right order we can add them automatically.
//load files
me.sourceDir() + "src/" + "octopusdrum-a-drum.ck" => string load;
Machine.add(load);

me.sourceDir() + "src/" + "octopusdrum-b-seq.ck" => load;
Machine.add(load);

//!Instantiation of class in same file causes an error so moved to another file.
//Now add octopusdrum-example.ck