function species_count(target_species, whale_list) {
	var su = 0;
	for (let i=0;i<whale_list.length;++i){
		if (whale_list[i].species == target_species){
			su += +whale_list[i].how_many;
		}
	}
  	return su;
}

module.exports = species_count;
