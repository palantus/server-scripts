var ClosureCompiler = require("closurecompiler");
var fs = require('fs')

var files = fs.readdirSync("../www/js/");

var filesToCompile = [];
for(var i = 0; i < files.length; i++)
    if(files[i] != "all.js" && files[i] != "jquery.min.js")
        filesToCompile.push("../www/js/" + files[i]);

ClosureCompiler.compile(
    filesToCompile,
    {
        // Options in the API exclude the "--" prefix
        compilation_level: "SIMPLE_OPTIMIZATIONS"

        // Capitalization does not matter 
        //Formatting: "PRETTY_PRINT"

        // If you specify a directory here, all files inside are used
        //externs: ["externs/file3.js", "externs/contrib/"],

        // ^ As you've seen, multiple options with the same name are
        //   specified using an array.
        
    },
    function(error, result) {
        if (result) {
            fs.writeFileSync("../www/js/all.js", result);
            // Write result to file
            // Display error (warnings from stderr)
            console.log(error);
        } else {
            // Display error...
            console.log(error);
         }
    }
);