var items = [10, 120, 1000];

// our reducer function
var reducer = function add(sumSoFar, item) {
  sumSoFar.sum = sumSoFar.sum + item;
  return sumSoFar;
};

// do the job
var total = items.reduce(reducer, {sum: 99});

console.log(total); // {sum:1130}
