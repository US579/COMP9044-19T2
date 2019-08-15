function species_count(target_species, whale_list) {
  // PUT YOUR CODE HERE
 // return whale_list.map(res => res.species == target_species?res.how_many:0).reduce((a,b)=>a+b,0);
    var sum = 0
    for (let i =0 ; i< whale_list.length;i++ ){
        if (whale_list[i].species == target_species){
            sum = sum + whale_list[i].how_many;
        } 
    }
    return sum;

}

module.exports = species_count;
