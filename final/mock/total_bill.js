function total_bill(bill_list) {
    
  // PUT YOUR CODE HERE
    if (bill_list.length === 0){return 0}
    return bill_list.reduce((a,b)=> a.concat(b)).map(res=>res.price).map(res=>res.slice(1))
            .reduce((a,b)=> +a + +b)
}

module.exports = total_bill;
