export default function runApp() {
    /** your code goes here */
    window.onload = run;

    function createPage(link){
        var output = document.getElementById("output");
        let div = document.createElement("div");
        div.className="img-post";
        let img = document.createElement("img");
        img.setAttribute("src",link);
        let p = document.createElement("p");
        const time = new Date();
        p.innerText = `Fetched at ${time.getHours()}:${time.getMinutes()}`;
        let br = document.createElement("br");
        div.appendChild(img);
        div.appendChild(p);
        output.appendChild(div);
    }
 
    function getimages(){
        const url = "https://picsum.photos/300/300/?random";
        const imagesList = [];
        for (let i = 0 ;i < 5;++i){
            imagesList.push(fetch(url))
        }
        Promise.all(imagesList)
        .then((Response)=>{
            Response.map((x)=>createPage(x.url));
        })


    }
    function removeImages(){
        const child = [];
        for (let node of output.childNodes){
            console.log(node.baseURI.substring(0, 4));
            if (node.baseURI.substring(0, 4)==="http"){
                console.log(node);
                child.push(node);
            }
        }
        for (let i =0 ; i < child.length;++i){
            output.removeChild(child[i]);
        }
    }

    function run() {
        var mouse = document.getElementById("more");
        mouse.addEventListener('click', (event) => {
            removeImages();
            getimages();
        })
    }
}

