//!Rather than having to manually add the files in the right order we can add them automatically.
//load files
me.sourceDir() + "src/" + "octopusdrum-a-drum.ck" => string load;
Machine.add(load);

me.sourceDir() + "src/" + "octopusdrum-b-seq.ck" => load;
Machine.add(load);

me.sourceDir() + "gui/" + "OctopusInterfaceGui.ck" => load;
Machine.add(load);