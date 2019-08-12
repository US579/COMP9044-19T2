function total_bill(bill_list) {

  // PUT YOUR CODE HERE
    let lis = bill_list.reduce((a,b)=>a.concat(b),[])
    let price = lis.map(x=>x.price.slice(1))
    let total = price.reduce((a,b) => +a + +b)       
    return total
}

module.exports = total_bill;
