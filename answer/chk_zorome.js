process.stdin.resume();
process.stdin.setEncoding('utf8');
// Your code here!
var result = "";
var reader = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});
reader.on('line', (line) => {
    var Array = line.split(",");
    var box = "";
    for(var i = 0; i < Array.length; i++){
        if(Array[i].match(/^[1]{3}$|^[2]{3}$|^[3]{3}$|^[4]{3}$|^[5]{3}$|^[6]{3}$|^[7]{3}$|^[8]{3}$|^[9]{3}$/)){
            box += 'zorome: ' + Array[i] + "\n";
        }else if(!Array[i].match(/^[1-9]{3}$/)){
            box += 'unmach pattern: ' + Array[i] + "\n";
        }else{
            box += Array[i] + "\n";
        }
        result = box;
    }
});
reader.on('close', () => {
    console.log(result);
});
