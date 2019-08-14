

let getgoogle = fetch("https://www.google.com");

const a = getgoogle.then(res=res.text());
console.log(a);
