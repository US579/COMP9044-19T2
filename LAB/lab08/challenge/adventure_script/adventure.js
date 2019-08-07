(function() {
   'use strict';
   // code here
   let speed = 1;

   document.addEventListener('keydown',(event)=>{
       const name = event.key;
       if (name === 'z'){
           if (speed === 1){
               speed = 3;
           }else{
               speed = 1;
           }
       }
       console.log(name);
       const player = document.getElementById('player');
       if (!player.style.left) {
           player.style.left = 0;
       }
       const cur_pos = parseInt(player.style.left);
       if (name === 'ArrowLeft') {
           player.style.left = cur_pos - 5 * speed + "px";
       }
       if (name === 'ArrowRight') {
           player.style.left = cur_pos + 5 * speed + "px";
       }
       if (name === 'x') {
           const image = document.createElement('img');
           image.type = 'image';
           image.src = 'imgs/fireball.png';
           image.id = 'fb';
           image.style.height = 90 + 'px';
           image.style.width = 90 + 'px';
           image.style.position = "absolute";
           image.style.left = cur_pos+ 80 + 'px';
           image.style.bottom = 100 + 'px';
           document.body.appendChild(image);
           setInterval(function () {
               const fb = document.getElementById('fb');
               const cur = parseInt(fb.style.left);
               fb.style.left = cur + 60 + "px";
           }, 200);
       };
   });
    

}());



window.addEventListener("click",(e)=>{
    console.log(e);
})