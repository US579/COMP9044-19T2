


const cart1 = ['Apple', 'Orange', 'Apple', 'Strawberry', 'Orange'];

const cart = [
  {
    name: 'Apple',
    cost: 2.30
  },
  {
    name: 'Orange',
    cost: 4.50
  },
  {
    name: 'Apple',
    cost: 2.30
  },
  {
    name: 'Strawberry',
    cost: 6.70
  },
  {
    name: 'Orange',
    cost: 4.50
  }
];


function countCart(cart1){
    cart.sort;
    const count = {};
    console.log(cart);
    for ( const item of cart){
        count[item] = count[item]?count[item]+1:1;
    }
    for (const item of Object.keys(count).sort()){
            console.log(item,count[item]);
    }

}

let dic= {};

function countC(cart){
    for (const item of cart){
        console.log(item);
        dic[item.name] = dic[item.name]?dic[item.name]+item.cost:item.cost;
    }
    for (const item of Object.keys(dic).sort()){
        console.log(item,dic[item]);

    }
}


function countB(cart){
    const sum = (acc,cur) => acc +cur;
    const a = cart.map((i)=>i.cost).reduce(sum,0);
    console.log(a);
}





countB(cart);
//countC(cart)
//countCart(cart1);
