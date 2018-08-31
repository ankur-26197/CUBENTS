<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Maths</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery-1.7.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drag-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drag.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drop-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/jquery.event.drop.live-2.2.js"></script>
<script src="http://threedubmedia.com/inc/js/excanvas.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="animate.css">
<script src="ReferenceLib/MathJax-master/MathJax.js?config=TeX-MML-AM_HTMLorMML"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.js"></script>
<script src="https://cdn.ckeditor.com/4.7.0/full/ckeditor.js"></script>
<script src="js/typed.js"></script>

<%@ page import="java.util.ArrayList,datamodel.Topic" %>
<style>

body{
	background-image:url("ReferenceLib/background.jpg");
}
.sidenav {
    height: 234%;
    width: 0;
    position: absolute;
    margin-top:52px;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #000000;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 10px 8px 8px 8px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    display: block;
    transition: 0.3s;
   font-family: ‘Lucida Sans Unicode’, ‘Lucida Grande’, sans-serif;
   font-weight:bold;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 10px;
    font-size: 20px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
	position:relative;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}


#menubar{
border-radius:3px 3px 0 0;
min-height:25px;
padding:5px 0;
margin-top:-20px;

}
button[type="button"]{
width:30px;
height:30px;
padding:0px 3px 0px 3px;
}


.hide {
    display: none;
}

.show {
    z-index:1000;
    position: absolute;
    background-color:#C0C0C0;
    border: 1px solid blue;
    padding: 2px;
    display: block;
    margin: 0;
    list-style-type: none;
    list-style: none;
}

#canvas-wrap { 
	position:relative;
	border:5px solid #000000;
	width: 1140px;
	height: 1510px;
	padding:0px;
} /* Make this a positioned parent */
#canv{
	position:absolute;
	/*border-style:groove;*/
	z-index: -2;
	background-color:white;
}
.upper-canvas .lower-canvas{
  /*z-index:-2;*/
}
.demo{
  z-index:3;
  position:absolute; 
  top:20px; 
  left:30px;
}
.ui-selecting { background: #FECA40; }
.ui-selected { background: #F39814; color: white; }

.demo .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -60px;
    opacity: 0;
    transition: opacity 1s;
}

.demo .tooltiptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

.demo:hover .tooltiptext {
    visibility: visible;
    opacity: 1;
}

.type{
  margin: 10px 0 0 10px;
  white-space: nowrap;
  overflow: hidden;
  width:inherit;
  border:none;
  animation: type 4s steps(60, end); 
}
@keyframes type{ 
  from { width: 0;} 
}

.mi{
  font-size: 140%;
}
.mo{
  font-size: 140%;
}
.mn{
  font-size: 140%;
}
</style>
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
   
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
</script>
<script>
/*function myFunction(obj) {

    if(obj.value==1)
    {
        document.getElementById("div2").style.zIndex = "1";
        document.getElementById("canv").style.zIndex = "-1";
    }
    else if(obj.value==2)
    {
        document.getElementById("canv").style.zIndex = "1";
        document.getElementById("div2").style.zIndex = "-1";
    }
}*/
</script>
<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    showProcessingMessages: false,
    tex2jax: { inlineMath: [['$','$'],['\\(','\\)']] }
  });
</script>
<script>
var Preview = {
  delay: 150,        // delay after keystroke before updating

  preview: null,     // filled in by Init below
  buffer: null,      // filled in by Init below

  timeout: null,     // store setTimout id
  mjRunning: false,  // true when MathJax is processing
  mjPending: false,  // true when a typeset has been queued
  oldText: null,     // used to check if an update is needed

  //
  //  Get the preview and buffer DIV's
  //
  Init: function () {
    this.preview = document.getElementById("MathPreview");
    this.buffer = document.getElementById("MathBuffer");
  },

  //
  //  Switch the buffer and preview, and display the right one.
  //  (We use visibility:hidden rather than display:none since
  //  the results of running MathJax are more accurate that way.)
  //
  SwapBuffers: function () {
    var buffer = this.preview, preview = this.buffer;
    this.buffer = buffer; this.preview = preview;
    buffer.style.visibility = "hidden"; buffer.style.position = "absolute";
    preview.style.position = ""; preview.style.visibility = "";
  },

  //
  //  This gets called when a key is pressed in the textarea.
  //  We check if there is already a pending update and clear it if so.
  //  Then set up an update to occur after a small delay (so if more keys
  //    are pressed, the update won't occur until after there has been 
  //    a pause in the typing).
  //  The callback function is set up below, after the Preview object is set up.
  //
  Update: function () {
    if (this.timeout) {clearTimeout(this.timeout)}
    this.timeout = setTimeout(this.callback,this.delay);
  },

  //
  //  Creates the preview and runs MathJax on it.
  //  If MathJax is already trying to render the code, return
  //  If the text hasn't changed, return
  //  Otherwise, indicate that MathJax is running, and start the
  //    typesetting.  After it is done, call PreviewDone.
  //  
  CreatePreview: function () {
    Preview.timeout = null;
    if (this.mjPending) return;
    var text = document.getElementById("MathInput").value;
    if (text === this.oldtext) return;
    if (this.mjRunning) {
      this.mjPending = true;
      MathJax.Hub.Queue(["CreatePreview",this]);
    } else {
      this.buffer.innerHTML = this.oldtext = text;
      this.mjRunning = true;
      MathJax.Hub.Queue(
  ["Typeset",MathJax.Hub,this.buffer],
  ["PreviewDone",this]
      );
    }
  },

  //
  //  Indicate that MathJax is no longer running,
  //  and swap the buffers to show the results.
  //
  PreviewDone: function () {
    this.mjRunning = this.mjPending = false;
    this.SwapBuffers();
  }

};

//
//  Cache a callback to the CreatePreview action
//
Preview.callback = MathJax.Callback(["CreatePreview",Preview]);
Preview.callback.autoReset = true;  // make sure it can run more than once

</script>
</head>
<body>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
<%

	ArrayList<Topic> topics=(ArrayList<Topic>)request.getAttribute("topics");

	for(int i=0;i<topics.size();i++)
	{
		ArrayList<String> aname=topics.get(i).getActivityName();
		String name=topics.get(i).getTname();
		System.out.println(name+" ####");
		
		
%>
	<a data-toggle="collapse" data-parent="#accordion1" href="<%="#"+name+"link" %>" id="<%= name%>"><%=name %></a>
   <ul id="<%=name+"link" %>" class="collapse">
<%
		for(int j=0;j<aname.size();j++)
		{		
			System.out.println(aname.get(j));
%>  
            <li><a href="javascript:void(0)" id="<%=aname.get(j) %>" data="<%=name %>" onClick="requestActivity(this,this.parentNode.parentNode)")><%=aname.get(j) %></a></li>
<%
		}
%>
   </ul>
<%
	}
%>
</div>
<script>

var group=[];

var text;

var equation;

var graphics;

var iterator;

var time=0;

var animationController=true;

var renderAll=false;

var hintController=false;

function playAnimation(bypass){
	
	if(hintController){
		hintController=false;
		return;
	}
	
	if(!animationController)
		return;
    
	if(iterator==group.length){
		time=0;
		renderAll=true;
		play();
		return;
	}
	
	console.log("iterator "+group[iterator].event);
	console.log(group[iterator].event);
	
	if(group[iterator].event=='onclick' && !bypass){
		time=0;
		return;
	}
	
	if(pause){
		time=0;
		return;
	}
	
	console.log("Came here");
	
	bypass=false;
	
	var children=group[iterator].kid;
	
	console.log(children);
	
	console.log("came in "+iterator+"  "+ children.length+" "+group.length);
	
	//children.sort(function(a,b){return a.order-b.order;});
	
	for(var i=0;i<children.length;i++){
		
		console.log(time+"  "+children[i].duration+" "+children[i].id);
		
		setTimeout(animateObject,time,children[i]);
		
		time+=children[i].duration;
		
	}
	
	time+=group[iterator].delay;
	
	iterator++;
	
	setTimeout(playAnimation,time,bypass);
	
	time=0;
        
}

function animateObject(obj){
	
	var c=obj.id[0];
	var i;
	if(c=='e'){
		
		for(i=0;i<equation.length;i++){
			
			if(equation[i].id==obj.id)
				break;
		}
		
		if(equation.length==i)
			return;
		
		console.log("&&&&& "+equation[i].id +"  "+ equation[i].outputId);
		
		$("."+equation[i].outputId).css("visibility","visible");
		
		console.log("entered animate equation with "+equation[i].outputId+" "+obj.animation);
		
		$("."+equation[i].outputId).animateCss(obj.animation);
		
		return;
		
	}
	
	if(c=='T'){
		
		for(i=0;i<text.length;i++){
			
			if(text[i].id==obj.id)
				break;
		}
		
		if(i==text.length)
			return;
		
		$("#"+text[i].id).css("visibility","visible");
	     
		console.log("entered animate text with "+text[i].id+"  "+obj.animation);
		
    	$("#"+text[i].id).animateCss(obj.animation);
    	
    	return;
	}
	
	for(var i=0;i<graphics.length;i++){
		
		if(graphics[i].id==obj.id)
			break;
	}
	
	if(i==graphics.length)
		return;
	canvas.item(i).set({visible:true,duration:obj.duration});
	
	canvas.renderAll();
	
	console.log("entered animate graphics with "+i+"  "+canvas.item(i).id+"  "+obj.animation);
	
	switch(obj.animation){
	
	case 'draw':
		draw(canvas.item(i));
		
		return;
		
	case 'fade out in':
		fade_out_in(canvas.item(i));
		
		return;
		
	case 'fade in':
		fade_in(canvas.item(i));
		
		return;
		
	case 'ease':
		ease(canvas.item(i));
		
		return;
	case 'disappear':
		disappear(canvas.item(i));
		
	}
	
}



</script>

<script>
window.addEventListener('load',initPage, false);

var tname;

var aname;

var uid;

function initPage()
{
	
	getObject();
	
	getLastActivity();
	
	var url="RetrieveActivity?tname="+escape(tname)+"&aname="+escape(aname);
	
	ajaxRequest.onreadystatechange=loadActivity;
	
	ajaxRequest.open("GET",url,true);
	
	ajaxRequest.send();
}

function getLastActivity()
{
	tname=localStorage.getItem("FlexiTname");
	aname=localStorage.getItem("FlexiAname");
	
	if(tname==null){
		
		tname="Default";
		aname="Default";
	}
	
}

function savePage()
{
	localStorage.setItem("FlexiTname",tname);
	
	localStorage.setItem("FlexiAname",aname);
}

</script>
<script>
var ajaxRequest;

function getObject()
{
	try{
		ajaxRequest=new XMLHttpRequest();
	}catch(e)
	{
		try{
			ajaxRequest=new ActivXObject("Msxm12.XMLHTTP");
		}catch(e)
		{
			try{
			ajaxRequest=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e)
			{
				alert("use a proper browser");
				return;
			}
			
			
		}
	}
}

function requestActivity(obj,obj1)
{
	tname=obj1.id;//topic name
	
	tname=tname.substr(0,tname.length-4);
	
	//tname=obj.data;
	
	aname=obj.id;//activity name
	
	//alert(tname+"  "+aname);
	
	getObject();
	
	var url="RetrieveActivity?tname="+escape(tname)+"&aname="+escape(aname);
	
	ajaxRequest.onreadystatechange=loadActivity;
	
	ajaxRequest.open("GET",url,true);
	
	ajaxRequest.send();
}

var json;

var pause;

function loadActivity()
{
	
	if(ajaxRequest.readyState==4)
	{
		
		console.log(ajaxRequest.responseText);
		
		var rt=ajaxRequest.responseText;
		
		console.log(rt);
		
		rt = rt.replace(/PLUS/g,"+");
		
		json=JSON.parse(rt);
		
		pause=true;
		renderAll=true;
		play();
	}
}

</script>
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" onclick="openNav()"><i class="glyphicon glyphicon-tree-conifer" title="Topic tree"></i></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="#">Home</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-sign-in"></span> Join us</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="row">
<div class="col-sm-1">


</div>
<div class="col-sm-11">
<div class="row-fluid container">
<div id="menubar" class="row-fluid"style="background-color:#33B8FF">
<center>

<button class="btn btn-default" id="play" onclick='play()'>
<i class="glyphicon glyphicon-pause toggleSym"></i>
</button>

<button class="btn btn-default" id="play" onclick='visible()'>
<i class="glyphicon glyphicon-step-forward"></i>
</button>

<div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Hints for the selected element: </h4>
        </div>
        <div class="modal-body">

  <div class="tab-content">
   
    <div id="menu1" class="tab-pane fade in active">
      <center style="padding:20px 0px 20px 0px">
  
    Brief Hint:
    <br></br> 
    <p id="displaySmallHint"></p>
    <br></br>

    Hint Description:
    <br></br>
    <p id="displayBigHint"></p>
    <br></br>

    Links for further reference:
    <br></br>
      <a id="anchor1" href="#" target="_blank">#</a>
    <br></br>
     
    </div>
   
  </div> 
        </div>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<script>

//Pause Button Functionality;

function play(){
	
	var element = document.getElementsByClassName("toggleSym");
	
	console.log(renderAll);
	
	if(!pause){
		
		element[0].classList.remove("glyphicon-pause");
		
		element[0].classList.add("glyphicon-play");
		
		pause = true;
		
	}
	else{
		
		element[0].classList.remove("glyphicon-play");
		
		element[0].classList.add("glyphicon-pause");
		
		pause = false;
		
		console.log(renderAll);
		
		if(!renderAll)
		playAnimation(true);
		
		else
		{
			animationController=true;
			addElements();
			renderAll=false;
		}
	}
}
</script>
</center>

<script>
//-------------------------------------------------------------------------------------------------------------------

fabric.Mycircle=fabric.util.createClass(fabric.Circle,{
	type:'mycircle',
	
	initialize: function(options){
	
	options||(options={});
	
	this.callSuper('initialize',options);
	this.set('id',options.id||'');
	this.set('right',options.right||0);
	this.set('bottom',options.bottom||0);
	this.set('effect',options.effect||'');
	this.set('delay',options.delay||0);
	this.set('duration',options.duration||0);
	this.set('anim_order',options.anim_order||0);
	
	
	},
	
	toObject:function(){
		return fabric.util.object.extend(this.callSuper('toObject'),{
			id:this.get('id'),
			right:this.get('right'),
			bottom:this.get('bottom'),
			effect:this.get('effect'),
			delay:this.get('delay'),
			duration:this.get('duration'),
			anim_order:this.get('anim_order')
		});
		
	},
	
	_render:function(ctx){
		this.callSuper('_render',ctx);
	}
	
	
});
fabric.Mycircle.fromObject = function (object, callback) {
    fabric.util.enlivenObjects(object.objects, function (enlivenedObjects) {
        delete object.objects;
        callback && callback(new fabric.Mycircle(enlivenedObjects, object));
    });
};
fabric.Mycircle.async = true;
fabric.Mytriangle=fabric.util.createClass(fabric.Triangle,{
	
		'type':'mytriangle',
		
		initialize: function(options){
		
		options||(options={});
		

		this.callSuper('initialize',options);
		this.set('id',options.id||'');
		this.set('right',options.right||0);
		this.set('bottom',options.bottom||0);
		this.set('effect',options.effect||'');
		this.set('delay',options.delay||0);
		this.set('duration',options.duration||0);
		this.set('anim_order',options.anim_order||0);
		
		},
		
		toObject:function(){
			return fabric.util.object.extend(this.callSuper('toObject'),{
				right:this.get('right'),
				bottom:this.get('bottom'),
				id:this.get('id'),
				effect:this.get('effect'),
				delay:this.get('delay'),
				duration:this.get('duration'),
				anim_order:this.get('anim_order')
			});
			
		},
		
		_render:function(ctx){
			this.callSuper('_render',ctx);
		}
		
});

fabric.Myrect=fabric.util.createClass(fabric.Rect,{
	
	'type':'myrect',
	
	initialize: function(options){
	
	options||(options={});
	

	this.callSuper('initialize',options);
	this.set('right',options.right||0);
	this.set('id',options.id||'');
	this.set('bottom',options.bottom||0);
	this.set('effect',options.effect||'');
	this.set('delay',options.delay||0);
	this.set('duration',options.duration||0);
	this.set('anim_order',options.anim_order||0);
	
	
	
	},
	
	toObject:function(){
		return fabric.util.object.extend(this.callSuper('toObject'),{
			right:this.get('right'),
			bottom:this.get('bottom'),
			id:this.get('id'),
			effect:this.get('effect'),
			delay:this.get('delay'),
			duration:this.get('duration'),
			anim_order:this.get('anim_order')
		});
		
	},
	
	_render:function(ctx){
		this.callSuper('_render',ctx);
	}
	
});

fabric.Myellipse=fabric.util.createClass(fabric.Ellipse,{
	
	'type':'myellipse',
	
	initialize: function(options){
	
	options||(options={});
	

	this.callSuper('initialize',options);
	this.set('right',options.right||0);
	this.set('bottom',options.bottom||0);
	this.set('id',options.id||'');
	this.set('effect',options.effect||'');
	this.set('delay',options.delay||0);
	this.set('duration',options.duration||0);
	this.set('anim_order',options.anim_order||0);
	
	
	
	},
	
	toObject:function(){
		return fabric.util.object.extend(this.callSuper('toObject'),{
			right:this.get('right'),
			id:this.get('id'),
			bottom:this.get('bottom'),
			effect:this.get('effect'),
			delay:this.get('delay'),
			duration:this.get('duration'),
			anim_order:this.get('anim_order')
		});
		
	},
	
	_render:function(ctx){
		this.callSuper('_render',ctx);
	}
	
});


fabric.Myline=fabric.util.createClass(fabric.Line,{
	
	'type':'myline',
	
	initialize: function(points,options){
	
	options||(options={});
	

	this.callSuper('initialize',points,options);
	this.set('right',options.right||0);
	this.set('id',options.id||'');
	this.set('bottom',options.bottom||0);
	this.set('effect',options.effect||'');
	this.set('delay',options.delay||0);
	this.set('duration',options.duration||0);
	this.set('anim_order',options.anim_order||0);
	this.set('length',options.length||0);
	this.set('drawType',options.drawType||'');
	
	
	},
	
	toObject:function(){
		return fabric.util.object.extend(this.callSuper('toObject'),{
			length:this.get('length'),
			id:this.get('id'),
			right:this.get('right'),
			bottom:this.get('bottom'),
			effect:this.get('effect'),
			delay:this.get('delay'),
			duration:this.get('duration'),
			anim_order:this.get('anim_order'),
			drawType:this.get('drawType')
		});
		
	},
	
	_render:function(ctx){
		this.callSuper('_render',ctx);
	}
	
});

</script>
<script>
var canvas;

var context;

var ref=[];

function addElements()
{
	
	var division=document.getElementById("canvas-wrap");
	
	var x=division.childNodes.length;
	
	for(i=0;i<x;i++)
		division.removeChild(division.lastChild);
	
	addChild="<canvas id=\"canv\" width=\"1136px\" height=\"1510px\"></canvas>";
	
	
	division.innerHTML+=addChild;
	
	for(var i=0;i<json.text.length;i++)
	{
		var t=json.text[i];
		
		addChild="<div id=\""+t.id+"\" name=\""+t.id+"\" class=\"demo ui-draggable cke_editable cke_editable_inline cke_contents_ltr cke_show_borders\" style=\"display: inline-block; left:"+ t.xPos+"px; top:"+ t.yPos+"px;\" tabindex=\"0\" spellcheck=\"false\" role=\"textbox\" aria-label=\"Rich Text Editor,"+t.id+"\" aria-describedby=\"cke_97\" contenteditable=\"true\">"+t.data+"</div>";
		
		division.innerHTML+=addChild;
	}
	
	
	for(var i=0;i<json.equation.length;i++)
	{
		var e=json.equation[i];
		//Made change here
		addChild="<div id='"+e.outputId+"' class='"+e.outputId+" demo' style='top:"+e.top+"px;left:"+e.left+"px;z-index:200'>";
		addChild+=e.code;
		addChild+="</div>";
		division.innerHTML+=addChild;
	}
	

	for(var i=0;i<json.hints.length;i++){
		if(json.hints[i].id[0]=='T' || json.hints[i].id[0]=='e'){
			var ryt=document.getElementById(json.hints[i].id);
			ryt.innerHTML+="<div class='tooltiptext' style='z-index:3'>"+json.hints[i].smallHint+" <button class='btn btn-default' data-toggle='modal' data-target='#myModal4' onclick='Show_Hint("+i+");'><i class='glyphicon glyphicon-info-sign'></i></button></div>";	
		}			
	}
	
	MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
	
	addGraphics();
	
	invisible();
	
	text=json.text;
	
	graphics=json.graphics.objects;
	
	equation=json.equation;
	
	group=json.group;
	
	console.log("going to play animation "+group.length);
	
	iterator=0;
	
	playAnimation(true);
	
	savePage();
	
}

</script>

<script>

</script>

<script>
function invisible(){
$(".demo").css("visibility","hidden");
	
}

$('.demo').mouseenter(function(){
	alert("entered");
	  var pos = $(this).position();
	  $(this).find('div').css('top', (pos.top)+50 + 'px').fadeIn();
	}).mouseleave(function(){
	  $(this).find('div').fadeOut();
	});

function visible(){
	
	//alert("Eneterd visible");
	
	renderAll=true;
	for(var i=0;i<json.graphics.objects.length;i++)
		canvas.item(i).set({visible:true});
	canvas.renderAll();
	
	$(".demo").css("visibility","visible");
	
	animationController=false;
	pause=false;
	play();
	
	
}
</script>
<script>
function addGraphics()
{
	canvas=new fabric.Canvas('canv');
	
	context=canvas.getContext("2d");
	
	
	for(var i=0;i<json.graphics.objects.length;i++){
		
		var gk=json.graphics.objects[i];
		
		var obj;
		console.log(gk.type+"  "+gk.strokeWidth);
		
		switch(gk.type)
		{
		case 'mycircle':
			obj=new fabric.Mycircle({
				left: gk.left,
		        top: gk.top,
		        width:gk.width,
		        height:gk.height,
		        fill:gk.fill,
		        stroke:gk.stroke,
		        strokeWidth:gk.strokeWidth,
		        strokeDashArray:gk.strokeDashArray,
		        scaleX:gk.scaleX,
		        scaleY:gk.scaleY,
		        angle:gk.angle,
		        opacity:gk.opacity,
		        visible:false,
		        backgroundColor:gk.backgroundColor,
		        selectable:false,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value,
		        
		        radius:gk.radius,
		        startAngle:gk.startAngle,
		        endAngle:gk.endAngle,
		        
		        
			});
			break;
			
		case 'myellipse':
			obj=new fabric.Myellipse({
				left: gk.left,
		        top: gk.top,
		        width:gk.width,
		        height:gk.height,
		        fill:gk.fill,
		        stroke:gk.stroke,
		        strokeWidth:gk.strokeWidth,
		        strokeDashArray:gk.strokeDashArray,
		        scaleX:gk.scaleX,
		        scaleY:gk.scaleY,
		        angle:gk.angle,
		        opacity:gk.opacity,
		        visible:false,
		        backgroundColor:gk.backgroundColor,
		        selectable:false,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value,
		        
		        rx:gk.rx,
		        ry:gk.ry
			});
	        break;
	        
		case 'myrect':
				obj=new fabric.Myrect({
					left: gk.left,
			        top: gk.top,
			        width:gk.width,
			        height:gk.height,
			        fill:gk.fill,
			        stroke:gk.stroke,
			        strokeWidth:gk.strokeWidth,
			        strokeDashArray:gk.strokeDashArray,
			        scaleX:gk.scaleX,
			        scaleY:gk.scaleY,
			        angle:gk.angle,
			        opacity:gk.opacity,
			        visible:false,
			        backgroundColor:gk.backgroundColor,
			        selectable:false,
			        right:gk.right,
			        bottom:gk.bottom,
			        effect:gk.effect,
			        duration:gk.duration,
			        anim_order:gk.anim_order,
			        easing:gk.easing,
			        ease_att:gk.ease_att,
			        ease_value:gk.ease_value,
			        
			        rx:gk.rx,
			        ry:gk.ry
			    });
				break;
		case 'mytriangle':
			obj=new fabric.Mytriangle({
				left: gk.left,
		        top: gk.top,
		        width:gk.width,
		        height:gk.height,
		        fill:gk.fill,
		        stroke:gk.stroke,
		        strokeWidth:gk.strokeWidth,
		        strokeDashArray:gk.strokeDashArray,
		        scaleX:gk.scaleX,
		        scaleY:gk.scaleY,
		        angle:gk.angle,
		        opacity:gk.opacity,
		        visible:false,
		        backgroundColor:gk.backgroundColor,
		        selectable:false,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value
		        
		    });
			break;
		case 'myline':
			obj=new fabric.Myline([gk.x1, gk.y1, gk.x2, gk.y2], {
				left: gk.left,
		        top: gk.top,
		        width:gk.width,
		        height:gk.height,
		        fill:gk.fill,
		        stroke:gk.stroke,
		        drawType:gk.drawType,
		        strokeWidth:gk.strokeWidth,
		        strokeDashArray:gk.strokeDashArray,
		        scaleX:gk.scaleX,
		        scaleY:gk.scaleY,
		        angle:gk.angle,
		        opacity:gk.opacity,
		        visible:false,
		        backgroundColor:gk.backgroundColor,
		        selectable:false,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value
		        
			});
		    
		
		}
		canvas.add(obj);
	}
}

//#############################################################################################################################

function fade_out_in(obj){
  obj.setOpacity(1);
  setTimeout(function(){ obj.animate('opacity', '1', {
      duration: obj.duration/2,
      onChange: canvas.renderAll.bind(canvas)
    })
  }, obj.duration/2); 

  obj.animate('opacity', '0', {
      duration: obj.duration/2,
      onChange: canvas.renderAll.bind(canvas)
  });
}

function fade_in(obj){
  obj.setOpacity(0);  
  canvas.renderAll();
  obj.animate('opacity', '1', {
      duration: obj.duration,
      onChange: canvas.renderAll.bind(canvas)
  });
}

var context = canvas.getContext('2d');
var startAngle;
var endAngle;
var t;

function draw(obj){
  if(obj.type == 'mycircle') {draw_circle(obj,'draw');}
  else if(obj.type == 'myellipse') {draw_ellip(obj,'draw');}
  else if(obj.type == 'myrect') {draw_rect(obj,'draw');}
  else if(obj.type == 'mytriangle') {draw_triangle(obj,'draw');}
  else if(obj.type == 'myline') {draw_line(obj,'draw');}
  else {console.log("No such shape");}
}

function draw_circle(obj,mode){
  if(mode == 'draw'){
    obj.setOpacity(0);
    canvas.renderAll();
  }
  startAngle = 0;
  endAngle = (2*Math.PI)/360;
  t = 1;
	cntr = 0;
  draw_helpc(obj,mode);
  if(mode == 'draw'){
    setTimeout(function(){
        obj.setOpacity(1);
        canvas.renderAll();
    } ,obj.duration);
  } 
}

function draw_helpc(obj,mode){
  if(t > 362) return;
  endAngle=(2*t*Math.PI)/360;
  context.beginPath();
  context.arc((obj.left+obj.right)/2,(obj.top+obj.bottom)/2, obj.radius, startAngle, endAngle, false);
  if(mode == 'draw'){
    context.lineWidth = obj.strokeWidth;
    context.strokeStyle = obj.stroke;
	if(obj.strokeDashArray != null && cntr%4 == 0) {
		context.lineWidth = 2*obj.strokeWidth;
    		context.strokeStyle = 'white';
	}
  }
  else if(mode == 'disa'){
    context.lineWidth = 2*obj.strokeWidth;
    context.strokeStyle = 'white';
  }
  context.stroke();
  startAngle = endAngle;
  t += 2500/obj.duration;
	cntr++;
  setTimeout(draw_helpc,1,obj,mode);
  
}

function draw_ellip(obj,mode){
  if(mode == 'draw'){
    obj.setOpacity(0);
    canvas.renderAll();
  }
  startAngle = 0;
  endAngle = (2*Math.PI)/360;
  t = 1;
	cntr = 0;
  console.log(obj.angle);
  draw_helpe(obj,mode);
  if(mode == 'draw'){
    setTimeout(function(){
        obj.setOpacity(1);
        canvas.renderAll();
    } ,obj.duration);
  }
}

function draw_helpe(obj,mode){
  if(t > 362) return;
  endAngle=(2*t*Math.PI)/360;
  context.beginPath();
  context.ellipse((obj.left+obj.right)/2, (obj.top+obj.bottom)/2, obj.rx, obj.ry, (obj.angle*Math.PI)/180, startAngle, endAngle, false);
  if(mode == 'draw'){
    context.lineWidth = obj.strokeWidth;
    context.strokeStyle = obj.stroke;
	if(obj.strokeDashArray != null && cntr%4 == 0) {
		context.lineWidth = 2*obj.strokeWidth;
    		context.strokeStyle = 'white';
	}
  }
  else if(mode == 'disa'){
    context.lineWidth = 2*obj.strokeWidth;
    context.strokeStyle = 'white';
  }
  context.stroke();
  startAngle = endAngle;
  t += 2500/obj.duration;
cntr++;
  setTimeout(draw_helpe,1,obj,mode);
  
}


function draw_rect(obj,mode){
  if(mode == 'draw'){
    obj.setOpacity(0);
    canvas.renderAll();
  } 
  
  A = obj.left;
  B = obj.top;
  C = obj.oCoords.tr.x;
  D = obj.oCoords.tr.y;
cntr = 0;

  draw_helpl(obj,A,B,C,D,obj.width,mode,obj.duration/4);

  setTimeout(function(){
    A = obj.oCoords.tr.x;
    B = obj.oCoords.tr.y;
    C = obj.right;
    D = obj.bottom;
cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.height,mode,obj.duration/4);}, obj.duration/4);

  setTimeout(function(){
    A = obj.right;
  B = obj.bottom
  C = obj.oCoords.bl.x;
  D = obj.oCoords.bl.y;
cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.width,mode,obj.duration/4);}, obj.duration/2);


  setTimeout(function(){
    A = obj.oCoords.bl.x;
  B = obj.oCoords.bl.y;
  C = obj.left;
  D = obj.top;
cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.height,mode,obj.duration/4);},    3*obj.duration/4);
  

  if(mode == 'draw'){
    setTimeout(function(){
        obj.setOpacity(1);
        canvas.renderAll();
    } ,obj.duration);
  }
}

function draw_triangle(obj,mode){
  if(mode == 'draw'){
    obj.setOpacity(0);
    canvas.renderAll();
  }
  
  A = (obj.left+obj.oCoords.tr.x)/2;
  B = (obj.top+obj.oCoords.tr.y)/2;
  C = obj.right;
  D = obj.bottom;
cntr = 0;
  var w1 = Math.sqrt((C-A)*(C-A)+(D-B)*(D-B));
  draw_helpl(obj,A,B,C,D,w1,mode,obj.duration/3);

  setTimeout(function(){
    A = obj.right;
    B = obj.bottom;
    C = obj.oCoords.bl.x;
    D = obj.oCoords.bl.y;
cntr = 0;
    var w2 = Math.sqrt((C-A)*(C-A)+(D-B)*(D-B));
    draw_helpl(obj,A,B,C,D,w2,mode,obj.duration/3);}, obj.duration/3);

  setTimeout(function(){
  A = obj.oCoords.bl.x;
  B = obj.oCoords.bl.y;
  C = (obj.left+obj.oCoords.tr.x)/2;
  D = (obj.top+obj.oCoords.tr.y)/2;
cntr = 0;
  var w3 = Math.sqrt((C-A)*(C-A)+(D-B)*(D-B));
    draw_helpl(obj,A,B,C,D,w3,mode,obj.duration/3);}, 2*obj.duration/3);

  if(mode == 'draw'){
    setTimeout(function(){
        obj.setOpacity(1);
        canvas.renderAll();
    } ,obj.duration);
  }

}

var A;
var B;
var C;
var D;
var cntr;

function draw_line(obj,mode){
  if(mode == 'draw'){
    obj.setOpacity(0);
    canvas.renderAll();
  }
	console.log(obj.drawType+ "  "+mode);
  if(obj.drawType == 'Q1'){
    A = obj.left;
    B = obj.top;
    C = obj.right;
    D = obj.bottom;
	cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.length,mode,obj.duration);
  }

  else if(obj.drawType == 'Q2'){
    A = obj.oCoords.tr.x;
    B = obj.oCoords.tr.y;
    C = obj.oCoords.bl.x;
    D = obj.oCoords.bl.y;
	cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.length,mode,obj.duration);
  }

  else if(obj.drawType == 'Q3'){
    A = obj.right;
    B = obj.bottom;
    C = obj.left;
    D = obj.top;
	cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.length,mode,obj.duration);
  }

  else if(obj.drawType == 'Q4'){
    C = obj.oCoords.tr.x;
    D = obj.oCoords.tr.y;
    A = obj.oCoords.bl.x;
    B = obj.oCoords.bl.y;
	cntr = 0;
    draw_helpl(obj,A,B,C,D,obj.length,mode,obj.duration);
  }


  if(mode == 'draw'){
    setTimeout(function(){
        obj.setOpacity(1);
        canvas.renderAll();
    } ,obj.duration);
  }
}


function draw_helpl(obj,a,b,c,d,len,mode,time){
	  if(len < Math.sqrt((A-a)*(A-a) + (B-b)*(B-b))) return;
	  context.beginPath();
	  if(mode == 'draw'){
	    context.lineWidth = obj.strokeWidth;
	    context.strokeStyle = obj.stroke;
		if(obj.strokeDashArray != null && cntr%4 == 0) {
			context.lineWidth = 2*obj.strokeWidth;
	    		context.strokeStyle = 'white';
		}
	  }
	  else if(mode == 'disa'){
	    context.lineWidth = 2*obj.strokeWidth;
	    context.strokeStyle = 'white';
	  }

	  context.moveTo(a,b);
	  b += (D-B)*8/time;
	  a += (C-A)*8/time;
		cntr++;
	  context.lineTo(a,b);
	  context.stroke();
	  setTimeout(draw_helpl,1,obj,a,b,c,d,len,mode,time);
}

      

	function ease(obj){
  var temp = obj.width;
  switch(obj.ease_att){
    case 'left':temp = obj.left;
    break;
    case 'top':temp = obj.top;
    break;
    case 'width':temp = obj.width;
    break;
    case 'height':temp = obj.height;
    break;
    case 'angle':temp = obj.angle;
    break;
    case 'opacity':temp = obj.opacity;
    break;

  }
  
  obj.animate(obj.ease_att, temp, {
    from: obj.ease_value,
    duration: obj.duration,
    easing: fabric.util.ease[obj.easing],
    onChange:canvas.renderAll.bind(canvas)
  });
}


function disappear(obj){
  if(obj.type == 'mycircle') {draw_circle(obj,'disa');}
  else if(obj.type == 'myellipse') {draw_ellip(obj,'disa');}
  else if(obj.type == 'myrect') {draw_rect(obj,'disa');}
  else if(obj.type == 'mytriangle') {draw_triangle(obj,'disa');}
  else if(obj.type == 'myline') {draw_line(obj,'disa');}
  else {console.log("No such shape");}
}


var time_diff;

function show_animation(){
  time_diff = 0;
    var obj = canvas.getActiveObject();
    switch(obj.effect){
      case 'fade in':
        setTimeout(fade_in,time_diff,obj);
        break;
      case 'fade out in':
        setTimeout(fade_out_in,time_diff,obj);
        break;
      case 'draw':
        setTimeout(draw,time_diff,obj);
        break;
      case 'ease':
        setTimeout(ease,time_diff,obj);
        break;
      case 'disappear':
        setTimeout(disappear,time_diff,obj);
        break;
    }
}
</script>
<script>

$.fn.extend({
    animateCss: function (animationName) {
      var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
          $(this).removeClass('animated ' + animationName);
        });
      }
});

</script>
<script>
var id,selectedEquation,AO;
jQuery(document).on("click", ".math_equation", function (event)
		{
			
		    id = jQuery(this).attr('id') || '';
		    if(id.charAt(0)!="e")
		    	id=null;
		    console.log("ajsdkasdasdsdasdasdasd "+id);
		});
jQuery(document).on("click", ".drag", function (event)
		{
			
		    id = jQuery(this).attr('id') || '';
		    if(id.charAt(0)!="T")
		    	id=null;
		    console.log("ajsdkasdasdsdasdasdasd "+id);
		 });
		
function Show_Hint(iterator){
	//alert("Started here");
	console.log("Hint "+iterator);
	
	hintController=true;
	//console.log(obj.id+"  "+obj.smallHint+"  "+obj.bigHint);
	document.getElementById("displaySmallHint").innerHTML=json.hints[iterator].smallHint;
	document.getElementById("displayBigHint").innerHTML=json.hints[iterator].bigHint;
	document.getElementById("anchor1").innerHTML=json.hints[iterator].url;
	document.getElementById("anchor1").href=json.hints[iterator].url;
}
</script>

<script>

</script>
</div>
<!--<canvas id="canv" width="1136px" height="1000px" style="border-style:groove">
</canvas>
<div id="div2">
</div>-->
<div id="canvas-wrap" onclick="playAnimation(true)">
	<canvas id="canv" width="1136px" height="1500px">
	</canvas>
	
</div>
</div>
</div>
</div>
</body>
</html>