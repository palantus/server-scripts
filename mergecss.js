var ClosureCompiler = require("closurecompiler");
var fs = require('fs')

var files = fs.readdirSync("../www/css/");

var filesToCompile = [
						"comments",
						"desktopcreator",
						"fieldedit",
						"notifier",
						"popupcreator",
						"rightclickmenu",
						"searchbar",
						"tablecreator",
						"taskbar",
						"imageviewer"
					];

var output = "";

for(var i in filesToCompile){
	var filename = "../www/css/" + filesToCompile[i] + ".css";
	if(fs.existsSync(filename))
		output += "\n\n/* CSS FILE: " + filesToCompile[i] + ".css */\n\n" + fs.readFileSync(filename);
	else
		console.log("WARNING: File " + filename + " doesn't exist");
}

fs.writeFileSync("../www/css/framework_merged.css", output);