const users = [
  {
    name: 'Jeff',
    age: 52,
    gender: 'male'
  },
  {
    name: 'Andy',
    age: 25,
    gender: 'male'
  },
  {
    name: 'Sarah',
    age: 30,
    gender: 'female'
  },
  {
    name: 'Phoebe',
    age: 21,
    gender: 'female'
  },
  {
    name: 'Doris',
    age: 81,
    gender: 'female'
  }
];


const isMale = (person) => person.gender === "male";
const startwith = (letter) => (person) => person.name.startsWith(letter);
const sum = (total,cur) => total + cur;


const nameA =  users.filter(isMale)
                .filter(startwith("A"))
                .map(({age})=>age)
console.log(nameA)

const av = nameA.reduce(sum,0)
console.log(av/nameA.length)
