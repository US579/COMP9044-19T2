(function() {
		const d = document.getElementById('item-1');
		d.onclick = function(){
			const dc = document.getElementById('item-1-content');
			if (dc.style.display == "block"){
				dc.style.display = "none";
				d.innerHTML= "expand_more";
			}else{
				dc.style.display = "block";
				d.innerHTML = "expand_less";
			};

		};
		const d1 = document.getElementById('item-2');
		d1.onclick = function(){
			const dc1 = document.getElementById('item-2-content');
			if (dc1.style.display == "block"){
				dc1.style.display = "none";
				d1.innerHTML= "expand_more";
			}else{
				dc1.style.display = "block";
				d1.innerHTML= "expand_less";
			};

			
		};


}());
		