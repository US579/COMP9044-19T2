console.log('hello world');


var arr = ['one', 'two', 'three'];
arr.reverse(); 
arr; // ['three', 'two', 'one']
console.log(arr);

var arr = [1,22,23];
arr.reverse();
console.log(arr);

var arr = [1, 2, 3];
arr.length; // 3
arr.length = 6;
arr; // arr变为[1, 2, 3, undefined, undefined, undefined]
arr.length = 2;
arr; // arr变为[1, 2]

var xiaoming = {
    name: '小明',
    birth: 1990,
    school: 'No.1 Middle School',
    height: 1.70,
    weight: 65,
    score: null
};

console.log(xiaoming.name,xiaoming.school)

// var age = 20;
// if (age >= 18) { // 如果age >= 18为true，则执行if语句块
//     alert('adult');
// } else { // 否则执行else语句块
//     alert('teenager');
// }

// function check(age){
// 	if (age > 18){
// 		alert("forbidden");
// 	} else{
// 		alert("okay");
// 	}
// }

// let age = prompt("how old are you ",18);
// check(age);


// for (var i = 0; i < 100; i++) {
// 	console.log(i);
// }

var o = {
    name: 'Jack',
    age: 20,
    city: 'Beijing'
};
for (var key in o) {
    console.log(key); // 'name', 'age', 'city'
}

var m = new Map([['Michael', 95], ['Bob', 75], ['Tracy', 85]]);
console.log(m.get('Michael')); // 95


'use strict';

function foo() {
    var x = 'Hello, ' + y;
    console.log(x);
    var y = 'Bob';
}

foo();

//closure
// function sum(arr) {
//     return arr.reduce(function (x, y) {
//         return x + y;
//     });
// }

function lazy_sum(arr) {
    var sum = function () {
        return arr.reduce(function (x, y) {
            return x + y;
        });
    }
    return sum;
}
var f = lazy_sum([1,2,3]);
console.log( f() );



'use strict';

function create_counter(initial) {
    var x = initial || 0;
    return {
        imm: function () {
            x += 1;
            return x;
        }
    }
}

var c1 = create_counter();


console.log(c1.imm())
console.log(c1.imm())
console.log(c1.imm())



function* fib(){
	var a,b;
	[a,b] = [0,1];
	yield a;
	while (2>1){
		[a,b] = [b,a+b];
		yield b;
	}
}

var f = fib();
for (var i = 0 ; i < 10 ;i++){
	console.log(f.next())
}


'use strict';

var xiaoming = {
    name: '小明',
    age: 14,
    gender: true,
    height: 1.65,
    grade: null,
    'middle-school': '\"W3C\" Middle School',
    skills: ['JavaScript', 'Java', 'Python', 'Lisp']
};

var s = JSON.stringify(xiaoming);
console.log(s);


