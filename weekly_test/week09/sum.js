function sum(list) {
	var su = 0;
	for (let i =0;i< list.length ;++i){
        //+ convert string to interger
        su += +list[i]; 
	}
	return su;

  // PUT YOUR CODE HERE

}

module.exports = sum;
