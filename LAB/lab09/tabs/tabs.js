export default function runApp() {
    /** your code goes here */
'use strict';
window.onload = run;

function run(){
    var ball;
    fetch("planets.json")
    .then(res=>res.json())
    // .then(res => console.log(JSON.stringify(res)))
    .then(res=> ball = res);
    // .then(data => console.log(JSON.stringify(data)))
    // .then((data) => { alert(JSON.stringify(data))});
    for(let i = 1 ;i < 9 ; ++i){
        document.getElementById(`tab-${i}`).addEventListener("click",createPage());
    }
}

function createPage(os){
    var dic = {
        "tab-1": "Saturn",
        "tab-2": "Earth",
        "tab-3": "Jupiter",
        "tab-4": "Mercury",
        "tab-5": "Uranus",
        "tab-6": "Venus",
        "tab-7": "Mars",
        "tab-8": "Neptune"
    }
    for (let i = 1; i < 9; ++i) {
        console.log(document.getElementById(`tab-${i}`).classList);
        document.getElementById(`tab-${i}`).classList.remove("active");
    }
    document.getElementById(os.target.id).classList.add("active");
    
}

function createsubPage(name,text) {
    let li= document.createElement("li");
    let b = document.createElement("b");
    b.innerText=name;
    li.appendChild(b);
    li.innerText=text;
    return li;
}
}