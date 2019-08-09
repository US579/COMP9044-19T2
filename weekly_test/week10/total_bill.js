function total_bill(bill_list) {
  // PUT YOUR CODE HERE
    let bill = bill_list.reduce((a,b) => a.concat(b));
    let price = bill.map( x=>x.price.slice(1));
    let sum = price.reduce((a,b) => a + +b,0 );
    return sum;
}

module.exports = total_bill;
