function species_count(target_species, whale_list) {
    var a = 0;
    let count = whale_list.reduce((a,b)=> a.concat(b),[])
    for (let i = 0 ; i < count.length ;i++){
        if ( target_species == count[i].species ){
                a += +count[i].how_many;
        
        };
    
    }
    return a
        // PUT YOUR CODE HERE

}

module.exports = species_count;
