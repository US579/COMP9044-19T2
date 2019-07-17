function countStats(data) {
	var result = {matches:0,tries:0};
	for(v of data){
		console.log(v);
		result['matches'] += parseInt(v['matches']);
		result['tries'] += parseInt(v['tries']);
	}
	return result;
}

const json = process.argv[2];
if (json === undefined) {
    throw new Error(`input not supplied`);
}
// include the json file via node's module system,
// this parses the json file into a JS object
// NOTE: this only works via node and will not work in the browser
const stats = require(`./${json}`);

console.log(countStats(stats.results));