function sum(list) {
    if ( list.length ){
        let s =  list.reduce((a,b)=> +a + +b );
         return s;
    }else{
        return  0;
    }
  // PUT YOUR CODE HERE

}

module.exports = sum;
