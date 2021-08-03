<html>
<style>
#container {
  position: relative;
}
#container canvas, #overlay {
  position: absolute;

}
canvas {
  border: 1px solid black;
}
.boxed {
  border: 1px solid white ;
  background:pink;
  opacity:95%;
}
</style>
    <body onload = "init()">
    <div id="container">
        <canvas id="can" width="1150" height="500" style="position:absolute;margin-top:2%;margin-left:5%;border:2px solid;">Hello</canvas>
         <div id="overlay" class="boxed" style="margin-left:29%;margin-top:13%;font-size:10em;"><b>HELLO!</b></div>
     </div>

    <script type="text/javascript">
    var canvas, ctx, flag = false,
        prevX = 0,
        currX = 0,
        prevY = 0,
        currY = 0,
        dot_flag = false;
    var i = 0;
    var flags = 0;
    var timer;
    var radius = 40;
    var x = "#000";
    
    function startTimer() {
        timer = setInterval(function() {
        	x = getRandomColor();
           // alert("from here"); 
        }, 60);
    }
    
    function getRandomColor() {
    	  var letters = ['#ffe6f2','#ffcce6','#ffb3d9',
    		  	 '#ff99cc',
    		  		 '#ff80bf',
    		   		 '#ff66b3',
    		   		 '#ff4da6',
    		   		 '#ff3399',
    		   		 '#ff1a8c',
    		   		 '#ff0080',
    		   		 '#e60073',
    		   		 '#cc0066',
    		   		 '#b30059',
    		   		 '#99004d',
    		   		 '#800040' ,	
    		   		 '#660033',
    		   		 '#4d0026',
    		   		 '#33001a'
];
    	  var color = '';
    	  if(i == 0)
    		  flags = 0;
    	  //alert("i= " + i);
    	  
    	  if(i == letters.length)
    		  flags = 1;
    	  
    	  if(flags == 0)
    		  { 
    		   color += letters[i];
    		   i+=1;
    		   //alert("flag "+flags);
    		  }
    	  if(flags == 1){
    		  color += letters[i];
   		   	  i-=1;
   		   	  //alert("flag 1 "+flags);
    	  }
    	  //alert(color);
    	  return color;
    	}
    var y = 30;
    startTimer();   
    function init() {
        canvas = document.getElementById('can');
        ctx = canvas.getContext("2d");
        w = canvas.width;
        h = canvas.height;

        
        canvas.addEventListener("mousemove", function (e) {
            findxy('move', e)
            
        }, false);
        canvas.addEventListener("mousedown", function (e) {
            findxy('down', e)
        }, false);
        canvas.addEventListener("mouseup", function (e) {
            findxy('up', e)
        }, false);
        canvas.addEventListener("mouseout", function (e) {
            findxy('out', e)
        }, false);
    }
    

    function draw() {
        ctx.beginPath();
        ctx.fillCircle(currX, currY, radius, x);
        ctx.moveTo(prevX, prevY);
        ctx.lineTo(currX, currY);
        ctx.strokeStyle = x;
        ctx.lineWidth = y;
        ctx.stroke();
        ctx.closePath();
    }
       
    function findxy(res, e) {
        if (res == 'move') {
            prevX = currX;
            prevY = currY;
            currX = e.clientX - canvas.offsetLeft;
            currY = e.clientY - canvas.offsetTop;
            
            ctx.fillCircle = function(x, y, radius, fillColor) {
                this.fillStyle = fillColor;
                this.beginPath();
                this.moveTo(x, y);
                this.arc(x, y, radius, 0, Math.PI * 2, false);
                this.fill();
            };
            
            flag = true;
            dot_flag = true;
            if (dot_flag) {
                ctx.beginPath();
                ctx.filter = "blur(10px)";
                ctx.fillStyle = x;
                
                ctx.fillCircle(currX, currY, radius, x);
                ctx.shadowBlur = blur;
                ctx.closePath();
                dot_flag = true;
            }
        }
        if (res == "out" || res == "up") {
            flag = true;
        }
        if (res == 'move' ) {
            if (flag) {
                prevX = currX;
                prevY = currY;
                currX = e.clientX - canvas.offsetLeft;
                currY = e.clientY - canvas.offsetTop;
                
                draw();
            }
        }
    }

    </script>
    </body>
    </html>