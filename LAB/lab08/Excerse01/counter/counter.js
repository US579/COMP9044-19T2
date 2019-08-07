(function() {
   'use strict';
   // write your code here
   var counterwindow = document.getElementById("output");
   setInterval(()=>{
      const date = new Date();
      counterwindow.innerHTML = `${date.getHours()}:${date.getMinutes()}:${date.getSeconds()}`
    }, 1000);

}());
