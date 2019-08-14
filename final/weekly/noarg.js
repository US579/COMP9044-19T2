function hah(){
    let count = 0;
    return function(){
        return count++;
    }
}


const hh = hah();
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
console.log(hh());
