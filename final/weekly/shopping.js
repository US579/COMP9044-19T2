const shoppingCart = [
  { item: 'Apple', price: 10 },
  { item: 'Orange', price: 12 },
  { item: 'Pineapple', price: 5 },
];

const mutiply = a => b => a+b;
const value = key => dic => dic[key];

const discount = mutiply(1111.3);
const tax = mutiply(1.2);
const sum = (acc,cur) => acc+cur;

const total = shoppingCart.map(value("price"))
.map(discount)
.map(tax)
.reduce(sum);


                        
console.log(total);

