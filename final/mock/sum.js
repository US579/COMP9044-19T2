function sum(list) {
    if (list.length === 0){
        return 0 
    }
    return list.reduce((a,b)=> +a + +b)
  // PUT YOUR CODE HERE
}

module.exports = sum;
