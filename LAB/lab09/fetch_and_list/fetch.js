export default function runApp() {
    /** your code goes here */
window.onload=run;
function pageCreate(user) {
	let div = document.createElement('div'); 
	div.className = 'user'; 
	let h2 = document.createElement('h2'); 
	h2.innerText = user.name; 
	let p = document.createElement('p'); 
	p.innerText = user.company.catchPhrase;
	div.appendChild(h2); 
	div.appendChild(p); 
	return div;
} 
function append(element) {
	output.appendChild(element); 
} 
function run() {
	var output = document.getElementById('output');
	fetch('https://jsonplaceholder.typicode.com/users') 
	.then(res => res.json()) 
	.then(data => data.map(pageCreate))
	.then(elements => elements.map(append));
}
};



