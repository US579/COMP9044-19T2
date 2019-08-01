function sum(list) {
	dic={"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9,"0":0}
	var su = 0;
	for (let i =0;i< list.length ;++i){
		su = su + dic[list[i]]; 
	}
	return su;

  // PUT YOUR CODE HERE

}

module.exports = sum;
