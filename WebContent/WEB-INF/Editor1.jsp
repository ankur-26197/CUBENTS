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
<link rel="stylesheet" href="animate.css">
<script src="ReferenceLib/MathJax-master/MathJax.js?config=TeX-MML-AM_HTMLorMML"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.js"></script>

<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="https://cdn.ckeditor.com/4.7.0/full/ckeditor.js"></script>
<%@ page import="java.util.ArrayList,datamodel.Topic" %>
<style>
body{
  background:url("ReferenceLib/background.jpg");
}
.sidenav {
    height: 158%;
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
   font-family: Lucida Sans Unicode, Lucida Grande, sans-serif;
   font-weight:bold;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
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

.drag {
  position: absolute;
  /*border: 1px solid #89B;*/
  cursor: move;
  top: 120px;
  }
.selected {
  background-color: #ECB;
  border-color: #B98;
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
/*#div2{
position:absolute;
width:1141px;
height:1004px;
border-style:groove;

}*/

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
  overflow-x: scroll;
  width:1140px;
  height:1000px;
  padding:0px;
} /* Make this a positioned parent */
#canv{
  position:absolute;
  /*border-style:groove;*/
  z-index: -2;
  background-color:white;
  height:5000px;
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
.mathCursor{
  animation-name: blink;
  animation-duration: 800ms;
  animation-iteration-count: infinite;
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
@keyframes blink {
  from { opacity: 1; }
  to { opacity: 0; }
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
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
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
        
        if(name.equals("Default"))
            continue;
%>
    <a data-toggle="collapse" data-parent="#accordion1" href="<%="#"+name+"link" %>" id="<%= name%>"><%=name %></a>
   <ul id="<%=name+"link" %>" class="collapse">
<%
        for(int j=0;j<aname.size();j++)
        {        
%>  
            <li><a href="javascript:void(0)" id="<%=aname.get(j) %>" data="<%=name %>" onClick="requestActivity(this,this.parentNode.parentNode)")><%=aname.get(j) %></a></li>
<%
        }
%>
   </ul>
<%
}
%>
</div> <nav class="navbar navbar-inverse">
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
<div id="menubar" class="row-fluid" style="background-color:#33B8FF">

<div class="btn btn-group">
<button class="btn btn-default" title="Save" data-toggle="modal" data-target="#saveModal" >

<i class="fa fa-save"></i>
</button>

<div class="modal fade" id="saveModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Save As</h4>
        </div>
        <div class="modal-body">
          <input type="text" placeholder="Topic name" id="savetopicname"><br><br>
           <input type="text" placeholder="Activity name" id="saveactivityname"><br><br>
           <textarea style="width:200px;height:100px" placeholder="Description" id="description"></textarea><br><br>
           <button class="btn btn-primary" onClick="queryDataBase()" data-dismiss="modal">Save</button>
          
        </div>
        <div class="modal-footer">
          <button  class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
<button class="btn btn-default" data-toggle="dropdown">
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="LearnerView?url=EditorView.jsp" target="_blank">New</a></li>
      <li><a href="#" data-toggle="modal" data-target="#createGroup">Create Group</a></li>
    </ul>

</div>


<div class="modal fade" id="createGroup" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title">Create Group</h4></center>
        </div>
        <div class="modal-body">
        <center>
          <input type="text" placeholder="GroupOrder" id="createGroupOrder" ><br><br>
           <input type="text" placeholder="Delay" id="createGroupDelay"><br><br>
			  <input type="radio" name="groupEvent" value="onclick" checked> onclick 
			  <input type="radio" name="groupEvent" value="automatic"> AutomaticAfter<br><br>
           
           <button class="btn btn-primary" onClick="Create_Group()" data-dismiss="modal">Save</button>
          </center>
        </div>
        <div class="modal-footer">
          <button  class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
<div class="btn btn-group">
<button class="btn btn-default" title="Copy" onclick="Copy1();"><i class="fa fa-copy"></i></button>
<button class="btn btn-default" title="Paste" onclick="Paste1();"><i class="fa fa-paste"></i></button>
</div>

  <button class="btn btn-default" data-toggle="modal" data-target="#myModal2" title="Add animation">Animation</button>
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
  <!-- Modal content-->
  <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please give your specifications</h4>
        </div>
        <div class="modal-body">
         
     <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#menu1">Text</a></li>
        <li><a data-toggle="tab" href="#menu2">Graphics</a></li>
        <li><a data-toggle="tab" href="#menu3">Equation</a></li>
    </ul>

  <div class="tab-content">
   
    <div id="menu1" class="tab-pane fade in active">
    <center style="padding:20px 0px 20px 0px">
    In
    <select onchange="in_anim(this.value);" id="inAnim">
    <option value="flash">flash</option><option value="bounce">bounce</option><option value="type">type</option><option value="shake">shake</option><option value="tada">tada</option><option value="swing">swing</option><option value="wobble">wobble</option><option value="pulse">pulse</option><option value="flip">flip</option><option value="flipInX">flipInX</option><option value="flipInY">flipInY</option><option value="fadeIn">fadeIn</option><option value="fadeInUp">fadeInUp</option><option value="fadeInDown">fadeInDown</option><option value="fadeInLeft">fadeInLeft</option><option value="fadeInRight">fadeInRight</option><option value="fadeInUpBig">fadeInUpBig</option><option value="fadeInDownBig">fadeInDownBig</option><option value="fadeInLeftBig">fadeInLeftBig</option><option value="fadeInRightBig">fadeInRightBig</option><option value="bounceIn">bounceIn</option><option value="bounceInDown">bounceInDown</option><option value="bounceInUp">bounceInUp</option><option value="bounceInLeft">bounceInLeft</option><option value="bounceInRight">bounceInRight</option><option value="rotateIn">rotateIn</option><option value="rotateInDownLeft">rotateInDownLeft</option><option value="rotateInDownRight">rotateInDownRight</option><option value="rotateInUpLeft">rotateInUpLeft</option><option value="rotateInUpRight">rotateInUpRight</option><option value="rollIn">rollIn</option><option value="flash">flash</option><option value="bounce">bounce</option><option value="shake">shake</option><option value="tada">tada</option><option value="swing">swing</option><option value="wobble">wobble</option><option value="pulse">pulse</option><option value="flip">flip</option><option value="flipOutX">flipOutX</option><option value="flipOutY">flipOutY</option><option value="fadeOut">fadeOut</option><option value="fadeOutUp">fadeOutUp</option><option value="fadeOutDown">fadeOutDown</option><option value="fadeOutLeft">fadeOutLeft</option><option value="fadeOutRight">fadeOutRight</option><option value="fadeOutUpBig">fadeOutUpBig</option><option value="fadeOutDownBig">fadeOutDownBig</option><option value="fadeOutLeftBig">fadeOutLeftBig</option><option value="fadeOutRightBig">fadeOutRightBig</option><option value="bounceOut">bounceOut</option><option value="bounceOutDown">bounceOutDown</option><option value="bounceOutUp">bounceOutUp</option><option value="bounceOutLeft">bounceOutLeft</option><option value="bounceOutRight">bounceOutRight</option><option value="rotateOut">rotateOut</option><option value="rotateOutDownLeft">rotateOutDownLeft</option><option value="rotateOutDownRight">rotateOutDownRight</option><option value="rotateOutUpLeft">rotateOutUpLeft</option><option value="rotateOutUpRight">rotateOutUpRight</option><option value="hinge">hinge</option><option value="rollOut">rollOut</option>
    </select>&nbsp;&nbsp;
    
    Duration
    <input type="text" style="width:40px" id="in_duration" onchange="in_duration_change();">&nbsp;&nbsp;
    Animation order
    <input type="text" style="width:40px" id="in_a_order" onchange="in_anim_order()">&nbsp;
    <br><br>
    <button class="btn btn-primary" data-dismiss="modal" onclick="f1();">Show Text Animation</button>
    </center>
    </div>

   <div id="menu2" class="tab-pane fade">
     
      <center style="padding:20px 0px 20px 0px">
    Animation effect
    <select id="animate_g" onChange = "set_effect(this.value);">
    <option value="fade in">Fade In</option>
    <option value="fade out in">Fade Out-In</option>
    <option value="draw">Draw</option>
    <option value="ease">Ease</option>
    <option value="disappear">Disappear</option>    
    </select>
<br> <br>
    Easing attribute
    <select id="att_ease_g" onChange= "set_att_ease(this.value);">

  <option value="left">Left</option>
    <option value="top">Top</option>
    <option value="width">Width</option>
    <option value="height">Height</option>
    <option value="angle">Angle</option>
    <option value="opacity">Opacity</option>
    </select>
&nbsp;
    Easing Effect
   <select id="easing_g" onChange = "set_easing(this.value);">
    
    <option value="easeInQuad">easeInQuad</option>
    <option value="easeOutQuad">easeOutQuad</option>
    <option value="easeInOutQuad">easeInOutQuad</option>
    <option value="easeInCubic">easeInCubic</option>
    <option value="easeOutCubic">easeOutCubic</option>
    <option value="easeInOutCubic">easeInOutCubic</option>
    <option value="easeInQuart">easeInQuart</option>
    <option value="easeOutQuart">easeOutQuart</option>
    <option value="easeInOutQuart">easeInOutQuart</option>
    <option value="easeInQuint">easeInQuint</option>
    <option value="easeOutQuint">easeOutQuint</option>
    <option value="easeInOutQuint">easeInOutQuint</option>
    <option value="easeInSine">easeInSine</option>
    <option value="easeOutSine">easeOutSine</option>
    <option value="easeInOutSine">easeInOutSine</option>
    <option value="easeInExpo">easeInExpo</option>
    <option value="easeOutExpo">easeOutExpo</option>
    <option value="easeInOutExpo">easeInOutExpo</option>
    <option value="easeInCirc">easeInCirc</option>
    <option value="easeOutCirc">easeOutCirc</option>
    <option value="easeInOutCirc">easeInOutCirc</option>
    <option value="easeInElastic">easeInElastic</option>
    <option value="easeOutElastic">easeOutElastic</option>
    <option value="easeInOutElastic">easeInOutElastic</option>
    <option value="easeInBack">easeInBack</option>
    <option value="easeOutBack">easeOutBack</option>
    <option value="easeInOutBack">easeInOutBack</option>
    <option value="easeInBounce">easeInBounce</option>
    <option value="easeOutBounce">easeOutBounce</option>
    <option value="easeInOutBounce">easeInOutBounce</option>
  </select>

    
    <br> <br> Duration:<input id="duration_g" onchange="duration_change_g();">

    <!-- <input type="text" style="width:60px"> -->&nbsp;&nbsp;
    
    <br> Animation Order:<input id="a_order_g" onchange="anim_order_g()">

    <!-- <input type="text" style="width:60px"> -->&nbsp;

    <br> Ease Attribute Value:<input id="ease_value_g" onchange="ease_value_g()">
<br> <br>
        <button class="btn btn-primary" data-dismiss="modal" onclick="show_animation();">Show Graphics Animation</button>

    </center>
    </div>
   
   <div id="menu3" class="tab-pane fade">
    <center>
    <!--Change Made by A--> 
      Animation Order:<input id="equationAnimationOrder" onchange="changeAnimationOrder()">
    </center>
    <br><br>
    <center>
        <button class="btn btn-default" id="anim">Animate</button>
        <select name="in" id="animSelect">
        <option value="flash">flash</option>
        <option value="bounce">bounce</option>
        <option value="shake">shake</option>
        <option value="tada">tada</option>
        <option value="type">type</option>
        <option value="swing">swing</option>
        <option value="wobble">wobble</option>
        <option value="pulse">pulse</option>
        <option value="flip">flip</option>
        <option value="flipInX">flipInX</option>
        <option value="flipInY">flipInY</option>
        <option value="fadeIn">fadeIn</option>
        <option value="fadeInUp">fadeInUp</option>
        <option value="fadeInDown">fadeInDown</option>
        <option value="fadeInLeft">fadeInLeft</option>
        <option value="fadeInRight">fadeInRight</option>
        <option value="fadeInUpBig">fadeInUpBig</option>
        <option value="fadeInDownBig">fadeInDownBig</option>
        <option value="fadeInLeftBig">fadeInLeftBig</option>
        <option value="fadeInRightBig">fadeInRightBig</option>
        <option value="bounceIn">bounceIn</option>
        <option value="bounceInDown">bounceInDown</option>
        <option value="bounceInUp">bounceInUp</option>
        <option value="bounceInLeft">bounceInLeft</option>
        <option value="bounceInRight">bounceInRight</option>
        <option value="rotateIn">rotateIn</option>
        <option value="rotateInDownLeft">rotateInDownLeft</option>
        <option value="rotateInDownRight">rotateInDownRight</option>
        <option value="rotateInUpLeft">rotateInUpLeft</option>
        <option value="rotateInUpRight">rotateInUpRight</option>
        <option value="rollIn">rollIn</option><option value="flipOutX">flipOutX</option><option value="flipOutY">flipOutY</option><option value="fadeOut">fadeOut</option><option value="fadeOutUp">fadeOutUp</option><option value="fadeOutDown">fadeOutDown</option><option value="fadeOutLeft">fadeOutLeft</option><option value="fadeOutRight">fadeOutRight</option><option value="fadeOutUpBig">fadeOutUpBig</option><option value="fadeOutDownBig">fadeOutDownBig</option><option value="fadeOutLeftBig">fadeOutLeftBig</option><option value="fadeOutRightBig">fadeOutRightBig</option><option value="bounceOut">bounceOut</option><option value="bounceOutDown">bounceOutDown</option><option value="bounceOutUp">bounceOutUp</option><option value="bounceOutLeft">bounceOutLeft</option><option value="bounceOutRight">bounceOutRight</option><option value="rotateOut">rotateOut</option><option value="rotateOutDownLeft">rotateOutDownLeft</option><option value="rotateOutDownRight">rotateOutDownRight</option><option value="rotateOutUpLeft">rotateOutUpLeft</option><option value="rotateOutUpRight">rotateOutUpRight</option><option value="hinge">hinge</option><option value="rollOut">rollOut</option>
    </select>&nbsp;&nbsp;
    <!--Change Completed by A-->
    </center>
  </div>
  </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="btn btn-group">
  <button class="btn btn-default" title="Insert new div element" onclick="NewDiv();"><img src="textAdd.jpg" width="20px" height="20px">
  </button>
  <button class="btn btn-default" title="Delete div element" onclick="DeleteDiv();"><img src="textDelete.jpg" width="20px" height="20px">
  </button> 
</div>
<div class="btn btn-group">
<button class="btn btn-default" data-toggle="dropdown" title="Insert shapes" onclick="" value="2" style="margin-left:-10px">Shapes
    <span class="caret"></span></button>
    <button class="btn btn-default" id="linetype" title="Choose stroke type"><img src="straight.png" width="30px" height="20px"></button>
    <ul class="dropdown-menu" style="width:200px">
 <li> <center><div class="btn btn-group">

<button type="button" class="btn btn-default" onclick="shape='myline'" title="Line">&#9585;</button>

<button type="button" class="btn btn-default" style="font-size:20px" onclick="shape='myrect'" title="Rectangle">&#9645;</button>

<button type="button" class="btn btn-default" style="font-size:20px" onclick="shape='mytriangle'" title="Triangle">&#9651;</button>

<button type="button" class="btn btn-default" style="font-size:20px" onclick="shape='mycircle'" title="Circle">&#9711;</button>

<button type="button" class="btn btn-default" style="font-size:20px" onclick="shape='myellipse'" title="Ellipse"> <img src="ellipse_b.png" width="20px" height="20px"></button>

</div>
</center>
</li>
<li> <center><div class="btn btn-group" style="margin-top:-12px">
<input type="color" id="bottle" style="font-size:15pt">
<button onclick="Fill()">Fill</button>

<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">Size
    <span class="caret"></span></button>
	
    <ul class="dropdown-menu">
      <li><a href="#" onclick="strokewidth=1">1px</a></li>
      <li><a href="#" onclick="strokewidth=2">2px</a></li>
      <li><a href="#" onclick="strokewidth=4">4px</a></li>
      <li><a href="#" onclick="strokewidth=6">6px</a></li>
      <li><a href="#" onclick="strokewidth=8">8px</a></li>
      <li><a href="#" onclick="strokewidth=10">10px</a></li>
    </ul>
	
  </div>
</div>
<script>
$("#linetype").click(function(){
    
    if(coun%2==0){
    	$("#linetype").html("<img src='dotted.png' width='30px' height=\"20px\">");  	
      strokearray=[10,5];
    }
    else{
    	$("#linetype").html("<img src='straight.png' width='30px' height=\"20px\">");
      strokearray=null;
    }
    coun++;
});
</script>
</center>
</li>
</ul>
<button class="btn btn-default" onclick="deleteObjects()" title="Remove shape">
<i class="fa fa-trash"></i>
</button>
</div>
<button class="btn btn-default" title="Insert equation" data-toggle="modal" data-target="#myModal">&#937;
</button>&nbsp;
<!-- Hints Here -->
<button class="btn btn-default" title="Add Hint" data-toggle="modal" data-target="#myModal3"><i class="glyphicon glyphicon-question-sign"></i></button>

  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Please provide hint description: </h4>
        </div>
        <div class="modal-body">

  <div class="tab-content">
   
    <div id="menu1" class="tab-pane fade in active">
      <center style="padding:20px 0px 20px 0px">
  
    Brief Hint:
    <br></br>
    <textarea rows="1" cols="50" id="smallHint" onchange="smallHint();">
    </textarea> 
    <br></br>

    Hint Description:
    <br></br>
    <textarea rows="5" cols="50" id="bigHint" onchange="bigHint();">
    </textarea>
    <br></br>

    Links for further reference:
    <br></br>
    <textarea rows="1" cols="50" id="URLs" onchange="URLs();">
    </textarea>
    <br><br>
     
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

//*******************************************************************************************************************

var hint=[];
var h=0;
var flag=0;
var not_found=1;
function smallHint()
{
  var smallHint=document.getElementById("smallHint").value;
  var graphic=canvas.getActiveObject();
  if(graphic)
  {
     document.getElementById("displaySmallHint").innerHTML = smallHint;
    gid=graphic.id;
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==gid)
          {
            hint[i].smallHint=smallHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":gid, "smallHint":smallHint,"bigHint":null,"url":null});
            not_found=0; 
           }
  }
 
 else{
  if(T_E==1)
  {
  document.getElementById("displaySmallHint").innerHTML = smallHint; 
  document.getElementById(id).title=smallHint;
      for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==id)
          {
            hint[i].smallHint=smallHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":id, "smallHint":smallHint,"bigHint":null,"url":null});
            not_found=0; 
           }
}
  else if(T_E==0)
  {
  document.getElementById("displaySmallHint").innerHTML = smallHint; 
  document.getElementById(selectedEquation).title=smallHint;
      for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==selectedEquation)
          {
            hint[i].smallHint=smallHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":selectedEquation, "smallHint":smallHint,"bigHint":null,"url":null});
            not_found=0; 
           }
  };
  not_found=1;
}
}
function bigHint()
{
  var bigHint=document.getElementById("bigHint").value;
  var graphic=canvas.getActiveObject();
   if(graphic)
  {
    document.getElementById("displayBigHint").innerHTML = bigHint;
    gid=graphic.id;
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==gid)
          {
            hint[i].bigHint=bigHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":gid, "smallHint":null,"bigHint":bigHint,"url":null});
            not_found=0; 
           }
  }
else{
  if(T_E==1)
  {
     document.getElementById("displayBigHint").innerHTML = bigHint; 
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==id)
          {
            hint[i].bigHint=bigHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":id, "smallHint":null,"bigHint":bigHint,"url":null});
            not_found=0; 
           }
  }
  else if(T_E==0)
  {
    document.getElementById("displayBigHint").innerHTML = bigHint; 
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==selectedEquation)
          {
            hint[i].bigHint=bigHint;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":selectedEquation, "smallHint":null,"bigHint":bigHint,"url":null});
            not_found=0; 
           }
  }
  not_found=1;
}
}
function URLs()
{
  var urls=document.getElementById("URLs").value;
  var graphic=canvas.getActiveObject();
  if(graphic)
  {
    document.getElementById("anchor1").href=urls;
    document.getElementById("anchor1").innerHTML = urls; 
    gid=graphic.id;
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==gid)
          {
            hint[i].url=urls;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":gid, "smallHint":null,"bigHint":null,"url":urls});
            not_found=0; 
           }
  }
 else{
  if(T_E==1)
  {
    document.getElementById("anchor1").href=urls;
    document.getElementById("anchor1").innerHTML = urls; 
     for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==id)
          {
            hint[i].url=urls;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":id, "smallHint":null,"bigHint":null,"url":url});
            not_found=0; 
           }
  }
  else if(T_E==0)
  {
      document.getElementById("anchor1").href=urls;
      document.getElementById("anchor1").innerHTML = urls; 
       for(var i=0;i<hint.length ;i++)
      {
          if(hint[i].id==selectedEquation)
          {
            hint[i].url=urls;
            not_found=0;
            break;
          }
          else
          {
             not_found=1;
          }
      }
      if(not_found==1)
           { 
            hint.push({"id":selectedEquation, "smallHint":null,"bigHint":null,"url":urls});
            not_found=0; 
           }
  not_found=1;
  }
 }
}
function f_s_h()
{
var graphic=canvas.getActiveObject();
  if(graphic)
  {
      var hint_index=-1;
      
      for(var k=0;k<hint.length;k++)
      {
          if(hint[k].id==graphic.id)
           hint_index=k;
      }
      
      if(hint_index!=-1)
      {
      document.getElementById("displaySmallHint").innerHTML = hint[hint_index].smallHint; 
      document.getElementById("displayBigHint").innerHTML = hint[hint_index].bigHint ;
      document.getElementById("anchor1").href=hint[hint_index].URLs;
      document.getElementById("anchor1").innerHTML = hint[hint_index].url;
      }
  }
}


//*******************************************************************************************************************
</script>


<button class="btn btn-default" title="Show Hint" data-toggle="modal" data-target="#myModal4"><i class="glyphicon glyphicon-info-sign" onclick="f_s_h()"></i></button>

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
 <!-- Hint Ends-->
<button class="btn btn-default" onclick="play()" title="Play final animation"><i class="fa fa-play"></i></button>&nbsp;&nbsp;
<div class="modal fade" id="myModal" data-target="#myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header orange">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
        </button>
  
  Welcome to Equation Editor &nbsp;
  <button class="btn btn-default" type="button" data-toggle="dropdown">&#8721;
    <span class="caret"></span></button>
    <ul class="dropdown-menu" style="overflow:scroll;height:150px;width:200px;top:40px">
      
   <li><center>
  <div class="btn btn-group">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8704;</button><!--for all-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#8712;</button><!--for each-->
  <button type="button" class="btn btn-default supsub eqnbtn" >&#8721;</button><!--Sum-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8719;</button><!--Prod-->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8734;</button><!--Infin-->
  <button type="button" class="btn btn-default operate eqnbtn">+</button><!--Plus-->
  <button type="button" class="btn btn-default operate eqnbtn">-</button><!--minus-->
  <button type="button" class="btn btn-default operate eqnbtn">*</button><!--star-->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default  eqnbtn" id="fraction">a/b</button><!--frac-->
  <button type="button" class="btn btn-default eqnbtn" id="power">a^b</button><!--power-->
  <button type="button" class="btn btn-default sqroot eqnbtn">&#8730;</button><!--Square Root-->
  <button type="button" class="btn btn-default curoot eqnbtn">&#8731;</button><!--Cube root-->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">log</button>
  <button type="button" class="btn btn-default symbol eqnbtn">ln</button>
  <button type="button" class="btn btn-default sub eqnbtn">a<sub>b</sub></button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8495;</button>
  </div>
  </center></li>

  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default supsub eqnbtn">&#8745;</button><!--Intersection-->
  <button type="button" class="btn btn-default nroot eqnbtn">n&#8730;</button><!--nth root-->
  <button type="button" class="btn btn-default operate eqnbtn">&#8706;</button><!--part differential-->
  <button type="button" class="btn btn-default operate eqnbtn">&#100;</button><!--derivative -->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default supsub eqnbtn">&#8747;</button><!--Integral-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8748;</button><!--Double Integral-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8749;</button><!--Triple Integral-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8746;</button><!--Union-->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default supsub eqnbtn">&#8750;</button><!--Countour Integral-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8751;</button><!--d contour Integral-->
  <button type="button" class="btn btn-default supsub eqnbtn">&#8752;</button><!--t contour Integral-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#8756;</button><!--therefore -->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8757;</button><!--Since -->
  <button type="button" class="btn btn-default symbol eqnbtn">&#8840;</button><!--Not Subset-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#8838;</button><!--Subset-->
  <button type="button" class="btn btn-default operate eqnbtn">&#8711;</button><!-- Del Operator-->
  </div>
  </center></li>

  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#964;</button><!--Since -->
  <button type="button" class="btn btn-default symbol eqnbtn">&#967;</button><!--Not Subset-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#966;</button><!--Subset-->
  <button type="button" class="btn btn-default operate eqnbtn">&#969;</button><!-- Del Operator-->
  </div>
  </center></li>

  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn ">&#952;</button><!--Delta Operator-->
  <button type="button" class="btn btn-default symbol eqnbtn ">&#960;</button><!--d/dx-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#937;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#961;</button><!--Implies-->
  </div></center></li>

  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default operate eqnbtn">&#8710;</button><!--Delta Operator-->
  <button type="button" class="btn btn-default symbol eqnbtn">&#8904;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8658;</button><!--Implies-->
  <button type="button" class="btn btn-default complex eqnbtn">d|dx</button><!--d/dx-->
  </div></center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8764;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8771;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8773;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8775;</button>
  </div>
  </center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8785;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8791;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8804;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8805;</button>
  </div>
  </center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8816;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8817;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8946;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8947;</button>
  </div>
  </center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">&#8950;</button>
  <button type="button" class="btn btn-default operate eqnbtn">&#8853;</button>
  <button type="button" class="btn btn-default operate eqnbtn">&#8857;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8805;</button>
  </div>
  </center></li>
  
  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default supsub eqnbtn">&#8473;</button>
  <button type="button" class="btn btn-default supsub eqnbtn">&#8450;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8870;</button>
  <button type="button" class="btn btn-default symbol eqnbtn">&#8713;</button>
  </div>
  </center></li>

  <li><center>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default operate eqnbtn">&#8736;</button><!--angle-->
  <button type="button" class="btn btn-default operate eqnbtn">&#8723;</button><!--plus minus-->
  <button type="button" class="btn btn-default eqnbtn">&#8741;</button><!-- || -->
  <button type="button" class="btn btn-default eqnbtn">&#8742;</button><!-- !|| -->
  </div>
  </center></li>

  <li><center><p>Vector</p>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default vector eqnbtn">&rharu;</button>
  <button type="button" class="btn btn-default vector eqnbtn">&rarr;</button>
  <button type="button" class="btn btn-default vector eqnbtn">&tilde;</button>
  <button type="button" class="btn btn-default vector eqnbtn">^</button>
  </div>
  </center></li>

  <li><center><p>Trigonometry</p>
  <div class="btn btn-group" style="margin-top:-11px">
  <button type="button" class="btn btn-default symbol eqnbtn">cos</button>
  <button type="button" class="btn btn-default symbol eqnbtn">sin</button>
  <button type="button" class="btn btn-default symbol eqnbtn">tan</button>
  <button type="button" class="btn btn-default symbol eqnbtn">cot</button>
  </div>
  </center></li>
  </ul>

    </div>
       <div class="modal-body">
            <center><span id="MathPara"></span></center>
            <center><span>Insert Math Here : </span><input style="overflow:scroll" class="UserInput" placeholder="Insert Character">
            <button id="apply" class="btn btn-primary" disabled>Apply</button></center> 
            <center><textarea id="MathInput" onkeyup="Preview.Update()" style="margin-top:5px;width:500px;height:0px;overflow:scroll;visibility:hidden" placeholder="Please add an Equation using the button to start">
      </textarea></center>
        </div>
    
    <b style="margin-left:40px">Preview is shown here</b>
    <div id="MathPreview" style="margin-left:40px;padding: 3px; min-width:50%; margin-top:5px;overflow:scroll"></div>
    <div id="MathBuffer" style="margin-left:40px;padding: 3px; min-width:50%; margin-top:5px;visibility:hidden; position:absolute; top:0; left:0;overflow:scroll;"></div>
    <!--<div style="padding:30px 20px 30px">
    </div>-->
    <center><button class="btn btn-default" id="btnright" style="margin-bottom:20px">Click here to avail options</button></center>
    <div id="slidediv" style="display:none">
    <center>
    <button class="btn btn-default" id="addClass" title="Click to toggle modes">Text Mode</button>
    </center>
    <br>
    <center>
    Equation ClassNames : <select id="EqnClass" style="overflow: scroll;">
    </select>&nbsp;&nbsp;&nbsp;
    <div class="btn btn-group">
    <button class="btn btn-default" id="newEqn">New Eqn</button>
    <button class="btn btn-default" id="delEqn">Delete Eqn</button>
    </div>
    </center><br><p style="text-align: center;font-size: 140%;"><b>Styling</b></p>
    <center style="margin-bottom:10px">
    <input type="color" style="width:12%;margin-left:20px" id="favcolor">
    <button class="btn btn-default" id="color">Color</button>&nbsp;&nbsp;
    <input type="checkbox" id="btn-bold" name="radBold"> Bold
    </center>
    <center>
    Child ClassNames : <select id="ChildClass" style="overflow: scroll;">
    </select>&nbsp;&nbsp;&nbsp;
    <div class="btn btn-group">
    <button class="btn btn-default" id="newChild">New Style</button>
    <button class="btn btn-default" id="delChild">Delete Style</button>
    </div>
    </center>
    </div>
    <div class="modal-footer">
    <button class="btn btn-primary" id="preview">OK</button>
         <button class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>

</div>
<!--<canvas id="canv" width="1136px" height="1000px" style="border-style:groove">
</canvas>
<div id="div2">
</div>-->
<div id="canvas-wrap" >
  <canvas id="canv" width="1136px" height="2000px">
  </canvas>
  
</div>

</div>

</div>
</div>

<script>
//Declaring Global arrays for all three Forms Text/Graphics/Equations
//CReating groups Arrays
//Group Object
var Group = function(groupOrder,delay,event){
    this.groupOrder = groupOrder;
    this.event = event;
    this.kid = [];
    this.delay=delay;
}

//Group Array and Group Array Size
//Whenever Grouping is done the group order of each element mut be updated
var groupArray = [];
var grArraySize = 0;

//Canvas Offset 
var canvasOffset = $("#canv").offset();
//console.log("Hello : "+canvasOffset);
var canvasX = canvasOffset.left;
var canvasY = canvasOffset.top;
</script>

<script type="text/javascript">
Preview.Init();
$(function() {
$("#btnright").click(function() {
$('#slidediv').toggle('slide', { direction: 'right' }, 700);
});
$("#btnleft").click(function() {
$('#slidediv').toggle('slide', { direction: 'left' }, 700);
});
});

//Equation Object 
//DeleteEqn will work on both the arrays 
//DeleteChildClass will work on only one array


var Equation = function(className,code,animation,outputId){
  this.id = className;
  this.code = code;
  this.animation = animation;
  this.animOrder = 1;
  this.groupOrder = 0;
  this.childArray=[];
  this.outputId = outputId;
  this.top = 0;
  this.left = 0;
  this.isDeleted = false;
}

var Child=function(className,color,fontWeight,fontStyle){
  this.className = className;
  this.fontWeight = fontWeight;
  this.fontStyle = fontStyle;
  this.color = color;
}
// Opera 8.0+
var isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;

// Firefox 1.0+
var isFirefox = typeof InstallTrigger !== 'undefined';

// Safari 3.0+ "[object HTMLElementConstructor]" 
var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0 || (function(p) {
  return p.toString() === "[object SafariRemoteNotification]";
})(!window['safari'] || safari.pushNotification);

// Internet Explorer 6-11 
var isIE = /*@cc_on!@*/ false || !!document.documentMode;

// Edge 20+
var isEdge = !isIE && !!window.StyleMedia;

// Chrome 1+
var isChrome = !!window.chrome && !!window.chrome.webstore;
var position = 0;

// text to anser
//var text = 'Inserted Text';
//All global Variables For the Equation IDE
var operator = ["+","-","*",".","(",")",",","[","]","=","{","}","?","!","~","^"];
var math_main_class = [];//update on open
//var math_child_class = [];
var math_indx = -1;//update on open
var MathMode = true;//update on open
var childName = "";
var eqnId="";
var selectFlag=0;
//Stack of Cursor Positions for all possible operations
//Stack dataStructure to maintain the stack of operations
var posArray=[];//update on open
var stack=[];//update on open
var  cursorStatus = [];//update on open
var globalStatus = [];//update on open
//var cursorStack = [];
//text for cursor
var textCursor = "<mo class='mathCursor'>|</mo>";
var updateCursor=true;//update on open
var globalCursor;//update on open
var selectedEquation;
var selectedIndex;

$(document).ready(function(){
/* Adding text on click based on browser */
  $("#MathInput").val("");
  $(".UserInput").val("");
  $(".UserInput").on("keypress",function(event){
      var char = event.which || event.keyCode;
      var str = String.fromCharCode(char);
      insertAtCaret('MathInput',""+convertCode(str,char));
      $(this).val("");
      //Runs the preview in MathJax Mechanism all over again
      var textCode = $("#MathInput").val();
      textCode = textCode.replace(/(\r\n|\n|\r)/gm,"");
      math_main_class[math_indx].code = textCode;
      insertCursor();
      $(this).focus();
  });

  $("#MathInput").on("keypress", function(event) {
    var char = event.which || event.keyCode;
    if(event.ctrlKey){
      var textCode = $(this).val();
      textCode = textCode.replace(/(\r\n|\n|\r)/gm,"");
      //console.log("CTRL" + textCode);
      math_main_class[math_indx].code = textCode;
      return;
    }
    if( event.keyCode >= 37 && event.keyCode <= 40 ) {
      math_main_class[math_indx].code = $(this).val();
      return; // arrow keys
    }
    if( event.keyCode === 8 || event.keyCode === 46 || event.keyCode==13) {
      if(event.keyCode == 13 && MathMode){
        var txt = "<mspace linebreak='newline' />";
        insertAtCaret('MathInput',txt);
      }
      var textCode = $(this).val();
      textCode = textCode.replace(/(\r\n|\n|\r)/gm,"");
      math_main_class[math_indx].code = $(this).val();
      return; // backspace (8) / delete (46)
    }
    else if(((char>=48 && char<58) || (char>=65 && char<=90) || (char>=97 && char<=122) ||operator.includes(String.fromCharCode(char))) && MathMode){
      var str = String.fromCharCode(char);
      insertAtCaret('MathInput',""+convertCode(str,char));
      event.preventDefault();
    }
    //Storing the edited Equation
    var textCode = $(this).val();
    textCode = textCode.replace(/(\r\n|\n|\r)/gm,"");
    math_main_class[math_indx].code = textCode;
});

$("#fraction").on("click",function(){
  var txt = "\n<mfrac>\n<mrow></mrow>\n<mrow></mrow>\n</mfrac>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(2);
});

$("#power").on("click",function(){
  var txt = "\n<msup>\n<mrow></mrow>\n<mrow></mrow>\n</msup>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(2);
});

$("#anim").on("click",function(){
    //Change made by a
    var anim = $("#animSelect").val();
    var c_name = math_main_class[selectedIndex].id;
    c_name = "."+c_name;
    $(c_name).animateCss(anim);
    math_main_class[selectedIndex].animation = anim;
    console.log("In anim : "+math_main_class[selectedIndex].id);
    //$(".e01").animateCss(anim);
    //alert(anim);
});
var xoff1,yoff1;
var leffter1=[];
var topper1=[];
$("#newEqn").on("click",function(){
    if(math_main_class.length!=0){
      math_main_class[math_indx].code = $("#MathInput").val();
      cursorStatus[math_indx]=updateCursor;
      globalStatus[math_indx]=globalCursor;
      //console.log("GQ1 = "+globalCursor);
      stack[math_indx]=posArray;
    }
    var c_order = "e"+math_main_class.length;
    var neq = new Equation(c_order,"<math class='"+c_order+"'>\n</math>","fadeIn","eq"+(math_main_class.length));
    $("#MathInput").val("<math class='"+c_order+"'>\n</math>");
    var elem = document.getElementById('MathInput');
    elem.setSelectionRange(elem.value.lastIndexOf("</math>"),elem.value.lastIndexOf("</math>"));
    math_main_class.push(neq);
    math_indx=math_main_class.length-1;
    //console.log("The outputId is : "+neq.outputId);
    $("#canvas-wrap").append("<div id='"+neq.outputId+"' class='demo drag draggable ui-widget-content math_equation' style='display:inline-block;'></div>");
    //Making each of the divisions draggable and assigning current positions to the array
    //Each element will have the final possitions stored
    var currElem = math_main_class[math_indx];
    $("#"+neq.outputId).draggable({
      drag: function(){
            var offset = $(this).offset();
            var xPos = offset.left-canvasX;
            var yPos = offset.top-canvasY;
            //console.log("Final coords : "+xPos+" "+yPos+" And element :"+neq.outputId);
            currElem.top = yPos;
            currElem.left = xPos;
            //console.log("Final coords : "+xPos+" "+yPos+" And element :"+currElem.className);
        }
    });
    $("#"+neq.outputId).click(function(){
      $( this ).toggleClass("selected");      
      $(this).draggable( "option", "disabled", true );
    })
    .drag("init",function(dd){
        /*if(flag==1)
        {
          id=this.id;
          console.log("After Deleting the drag has started from :"+id);
        }*/
     
        return $('.selected');        
    })
    .drag(function( ev, dd ){
       //   console.log("drag: "+id);
        $( this ).css({
          top: dd.offsetY-Y,
          left: dd.offsetX-X
        });
        currElem.top = dd.offsetY-Y;
        currElem.left = dd.offsetX-X;
    });
    //inserting the equation into the options menu
    $("#EqnClass").html($("#EqnClass").html()+"<option value='"+c_order+"'>"+c_order+"</option>");
    $("#currClass").html("Current : <strong>"+c_order+"</strong>");
    loadChildSelect(neq.childArray);
    Preview.CreatePreview();
    $(".UserInput").val("");
    $('#EqnClass').val(""+c_order);
    cursorStatus.push(true);
    globalStatus.push(elem.value.lastIndexOf("</math>"));
    globalCursor = elem.value.lastIndexOf("</math>");
    stack.push([]);
    updateCursor = true;
    posArray = stack[math_indx];
    disableApply();
});

$('#EqnClass').on('change', function() {
    math_main_class[math_indx].code = $("#MathInput").val();
    stack[math_indx]=posArray;
    cursorStatus[math_indx]=updateCursor;
    globalStatus[math_indx]=globalCursor;
    var index = parseInt($(this).val().substring(1));
    var sel_eqn = math_main_class[index];
    $("#MathInput").val(sel_eqn.code);
    $("#currClass").html("Current : <strong>"+sel_eqn.id+"</strong>");
    math_indx = index;
    posArray = stack[math_indx];
    updateCursor = cursorStatus[math_indx];
    globalCursor = globalStatus[math_indx];
    //console.log("GQ2 = "+globalCursor);
    loadChildSelect(sel_eqn.childArray);
    Preview.CreatePreview();
    $(".UserInput").val("");
    var elem = document.getElementById('MathInput');
    elem.setSelectionRange(globalCursor,globalCursor);
    disableApply();
});

$('#newChild').on('click',function(){
    var parent = math_main_class[math_indx].id;
    var sel_eqn = math_main_class[math_indx];
    var childName = parent+"c"+sel_eqn.childArray.length;
    var childObj = new Child(childName,"#0000ff","none","none");
    sel_eqn.childArray.push(childObj);
    //$(".e1c1").css("color","#0000ff");    MathMode = true;
    $("#ChildClass").html($("#ChildClass").html()+"<option value='"+childName+"'>"+childName+"</option>");
});

$("#addClass").on('click',function(){
  if(MathMode){
    $(this).text("Math Mode");
    MathMode = false;
    $("#MathInput").css('visibility','visible');
    $("#MathInput").css('height','150px');
  }else{ 
    $(this).text("Text Mode");
    MathMode = true;
    $("#MathInput").css('visibility','hidden');
    $("#MathInput").css('height','0px');
  }
});

$("#color").on('click',function(){
    var colVal = $("#favcolor").val();
    var parent = math_main_class[math_indx];
    childName = $("#ChildClass").val();
    var child = parent.childArray.find(findChild);
    try{    
      MathMode = true;
      child.color = colVal;
    }catch(e){
      alert("Please select a ChildClass");
    }
});

$("#btn-bold").on('change',function(){
    var isBold = false;
    if($('#btn-bold').is(':checked')) { 
        isBold = true;
    }
    var parent = math_main_class[math_indx];
    childName = $("#ChildClass").val();
    var child = parent.childArray.find(findChild);
    try{
      child.fontWeight = (isBold)?"bold":"none";
    }catch(e){
      alert("Please select a ChildClass");
    }
    //console.log(child);
});

$("#preview").on('click',function(){
	var textCode = $("#MathInput").val();
    textCode = textCode.replace(/(\r\n|\n|\r)/gm,"");
    math_main_class[math_indx].code = textCode;
    try{
    var finalEq = math_main_class[math_indx];
    var eqname = "."+finalEq.id;
    var arrayChild = finalEq.childArray;
    for(var itr=0;itr<arrayChild.length;itr++){
        var child = arrayChild[itr];
        var clname = child.className;
        clname="."+clname;
        $(clname).css({"color":child.color,"font-weight":child.fontWeight});
    }
    var output = "#"+finalEq.outputId;
    //$(output).html($("#MathPreview").html());
    var target = "#";
    if (!($("#MathPreview").css('visibility') === 'hidden')) {
        target+="MathPreview";
    }else target+="MathBuffer";
    $(output).html($(target).html());
    console.log("DONE "+output+" "+target);
    $(".UserInput").val("");
    $(eqname).animateCss(finalEq.animation);
    $(".mathCursor").remove();
  }catch(e){
    alert("Please Add Some Equations");
  }
});

//Button Functionalities according to the classes
//symbol class
$(".symbol").on("click",function(){
  //Change made by a
  var txt = "<mi>"+$(this).text()+"</mi>";
  insertAtCaret('MathInput',txt); 
  Preview.CreatePreview();
  $(".UserInput").val("");
});
//supsub class
$(".supsub").on("click",function(){
  var txt = "\n<munderover><mrow><mo>"+$(this).text()+"</mo></mrow>\n<mrow> </mrow>\n<mrow> </mrow>\n</munderover>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(2);
});
//operator class
$(".operate").on("click",function(){
  //Change made by A
  var txt = "<mo>"+$(this).text()+"</mo>";
  insertAtCaret('MathInput',txt);
  Preview.CreatePreview();
  $(".UserInput").val(""); 
});
//root Classes
$(".sub").on('click',function(){
  var txt = "\n<msub>\n<mrow></mrow>\n<mrow></mrow>\n</msub>";
  insertAtCaret('MathInput',txt);
  getArgPositions(2); 
});
$(".sqroot").on("click",function(){
  var txt = "\n<msqrt>\n<mrow></mrow></msqrt>";
  insertAtCaret('MathInput',txt);
  getArgPositions(1);
});
//curoot
$(".curoot").on("click",function(){
  var txt="\n<mroot>\n<mrow> </mrow>100\n<mn>3</mn>\n</mroot>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(1);
}); 
//n-root class
$(".nroot").on("click",function(){
  var txt="\n<mroot>\n<mrow> </mrow>\n<mrow> </mrow>\n</mroot>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(2);
});
//vector class
$(".vector").on("click",function(){
  var txt = "\n<mover><mrow></mrow><mo>"+$(this).text()+"</mo></mover>\n";
  insertAtCaret('MathInput',txt);
  getArgPositions(1);
});
//complex class
$(".complex").on("click",function(){
  //Change made by A
  var txt="\n<mfrac><mo>d</mo><mrow><mo>dx</mo></mrow></mfrac>";
  insertAtCaret('MathInput',txt);
  Preview.CreatePreview();
  $(".UserInput").val("");
});

$("#delEqn").on("click",function(){
  //Change made by A
    var output = "#"+math_main_class[math_indx].outputId;
    var rm="#EqnClass option[value='"+ math_main_class[math_indx].id +"']";
    math_main_class[math_indx].isDeleted = true;
    $(rm).remove();
    $(output).remove();
});

//This is required to insert stuff at the pointer position
$("#MathInput").on("focusout", function(e) {
  position = $(this)[0].selectionStart;
});
});

$.fn.extend({
    animateCss: function (animationName) {
        var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        this.addClass('animated ' + animationName).one(animationEnd, function() {
            $(this).removeClass('animated ' + animationName);
        });
    }
});

function getArgPositions(args){
    //removeCursor();
    updateCursor=false;
    var elem = document.getElementById('MathInput');
    var EqnString = elem.value;
    var cursorPosition = $('#MathInput').prop("selectionStart");
    $(".UserInput").val("");
    //console.log("cursorposition = "+ cursorPosition);
    var stringLength = elem.value.length;
    if(args==1){
        VarArgs=1;
        EqnString = EqnString.substring(0,cursorPosition);
        var lastpos = EqnString.lastIndexOf("</mrow>");
        posArray.push(stringLength-cursorPosition);
        elem.setSelectionRange(lastpos,lastpos);
        insertCursor();
        globalCursor = lastpos;
        $(".UserInput").val("");
        //$(".UserInput").placeholder(placeHolder);
        doneFlag=1;
        enableApply();
    }else if(args==2){
        VarArgs=2;
        EqnString = EqnString.substring(0,cursorPosition);
        //console.log(EqnString);
        posArray.push(stringLength - cursorPosition);
        var lastpos = EqnString.lastIndexOf("</mrow>");
        //console.log("lastPos"+lastpos+" "+EqnString.length);
        posArray.push(stringLength - lastpos);
        EqnString = EqnString.substring(0,lastpos);
        lastpos = EqnString.lastIndexOf("</mrow>");
        elem.setSelectionRange(lastpos,lastpos);
        insertCursor();
        globalCursor = lastpos;
        doneFlag=1;
        enableApply();
    }
}

$("#apply").on("click",function(){
    removeCursor();
    var elem = document.getElementById('MathInput');
    var cin = document.getElementsByClassName('UserInput');
    var pos=elem.value.length - posArray.pop();
    //console.log(pos);
    elem.focus();
    elem.setSelectionRange(pos,pos);
    insertCursor();
    globalCursor = pos;
    updateCursor=false;
    disableApply();
    cin[0].focus();
    cin[0].value="";
});

function enableApply(){
    var app = document.getElementById('apply');
    var state = app.disabled;
    //console.log(state);
    if(!state){
        return;
    }
    app.disabled=false;
}
function disableApply(){
  var app = document.getElementById('apply');
  console.log(posArray.length);
  if(posArray.length == 0){
    app.disabled=true;
  }else app.disabled=false;
}

function findChild(obj) { 
    return obj.className === childName;
}

function loadChildSelect(array){
    console.log("called "+JSON.stringify(array));
    $("#ChildClass").html("<option value=''></option>");
    for(var itr=0;itr<array.length;itr++){
        var c_name = array[itr].className;
        //console.log("cname = "+c_name);
        var string = "<option value='"+c_name+"'>"+c_name+"</option>";
        $("#ChildClass").html($("#ChildClass").html()+string);
    }
}

function removeCursor(){
    //console.log(updateCursor+ " UC ");
    var textEqn="";
    var elem = document.getElementById('MathInput');
    var EqnString = elem.value;
    var curpos = EqnString.indexOf(textCursor);
    if(curpos != -1){
      //console.log(curpos+" "+textCursor.length);
      textEqn+=EqnString.substring(0,curpos)+EqnString.substring(curpos+textCursor.length);
      elem.value = textEqn;
      if(updateCursor){
        elem.setSelectionRange(curpos,curpos);
        globalCursor = curpos;
      }
      else{
        elem.setSelectionRange(globalCursor,globalCursor);
        updateCursor = true;
      } 
    }
    //insertCursor();
}

function insertCursor(){
  insertAtCaret('MathInput',textCursor);
  Preview.CreatePreview();
}

function convertCode(text,code){
  var txt="";
  if((code>=65&&code<=90) || (code>=97&&code<=122))
    txt="<mi>"+text+"</mi>";
  else if(code>=48 && code<58)
    txt="<mn>"+text+"</mn>";
  else if(operator.includes(text))
    txt="<mo>"+text+"</mo>";
  return txt;
}

function insertAtCaret(areaId, text) {
    removeCursor();
    var txtarea = document.getElementById(areaId);
    if (!txtarea) { return; }

    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") {
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        strPos = range.text.length;
    } else if (br == "ff") {
        strPos = txtarea.selectionStart;
    }

    var front = (txtarea.value).substring(0, strPos);
    var back = (txtarea.value).substring(strPos, txtarea.value.length);
    txtarea.value = front + text + back;
    strPos = strPos + text.length;
    if (br == "ie") {
        txtarea.focus();
        var ieRange = document.selection.createRange();
        ieRange.moveStart ('character', -txtarea.value.length);
        ieRange.moveStart ('character', strPos);
        ieRange.moveEnd ('character', 0);
        ieRange.select();
    } else if (br == "ff") {
        txtarea.selectionStart = strPos;
        txtarea.selectionEnd = strPos;
        txtarea.focus();
    }

    txtarea.scrollTop = scrollPos;
}

var copiedEqn;
var T_E=-1;
//Change made by A
jQuery(document).on("click", ".math_equation", function (event) {
    T_E=0;
    console.log(T_E);
    selectedEquation = jQuery(this).attr('id') || '';
    selectedIndex = selectedEquation.substring(2);
    math_indx = parseInt(selectedIndex);
    //console.log(selectedEquation+ " "+selectedIndex+" "+math_indx);
 	var hint_index=-1;
    for(var k=0;k<hint.length;k++)
    {
     if(hint[k].id==selectedEquation)
      hint_index=k;
    }
    if(hint_index!=-1)
      { document.getElementById("displaySmallHint").innerHTML = hint[hint_index].smallHint; 
       document.getElementById("displayBigHint").innerHTML = hint[hint_index].bigHint ;
       document.getElementById("anchor1").href=hint[hint_index].url;
       document.getElementById("anchor1").innerHTML = hint[hint_index].url; 
     }
    $("#equationAnimationOrder").val(''+math_main_class[selectedIndex].animOrder);
  }
);

function changeAnimationOrder(){
    math_main_class[selectedIndex].animOrder = $("#equationAnimationOrder").val();
    console.log(math_main_class[selectedIndex].animOrder);
}
function copyEquation(eqObj){
	copiedEqn = new Equation("e"+math_main_class.length,eqObj.code,eqObj.animation,null,null,[],"eq"+math_main_class.length,0,0,false);
  	//Change here -- line added
  	copiedEqn.code = copiedEqn.code.substring(0,copiedEqn.code.indexOf('e')+1)+math_main_class.length+copiedEqn.code.substring(copiedEqn.code.indexOf('>')-1);
  	copiedEqn.outputId = "eq"+math_main_class.length;
  //console.log("Copied "+JSON.stringify(copiedEqn));
}
function pasteEquation(){
    if(copiedEqn == null)
      return;
    math_main_class.push(copiedEqn);
    math_indx=math_main_class.length-1;
    stack.push([]);
    cursorStatus.push(true);
    globalStatus.push(0);
    $("#canvas-wrap").append("<div id='"+copiedEqn.outputId+"' class='demo drag draggable ui-widget-content math_equation' style='display:inline-block;'></div>");
    $("#EqnClass").html($("#EqnClass").html()+"<option value='"+copiedEqn.id+"'>"+copiedEqn.id+"</option>");
    $("#"+copiedEqn.outputId).html(copiedEqn.code);
    MathJax.Hub.Queue(["Typeset",MathJax.Hub,copiedEqn.outputId]);
    $("#EqnClass").val(copiedEqn.id);
    $("#MathInput").val(copiedEqn.code);
    var currElem = math_main_class[math_main_class.length-1];
    $("#"+copiedEqn.outputId).draggable({
      drag: function(){
            var offset = $(this).offset();
            var xPos = offset.left-canvasX;
            var yPos = offset.top-canvasY;
            //console.log("Final coords : "+xPos+" "+yPos+" And element :"+neq.outputId);
            currElem.top = yPos;
            currElem.left = xPos;
            //console.log("Final coords : "+xPos+" "+yPos+" And element :"+currElem.className);
        }
    });
    $("#"+copiedEqn.outputId).click(function(){
      $( this ).toggleClass("selected");      
      $(this).draggable( "option", "disabled", true );
    })
    .drag("init",function(dd){
        return $('.selected');        
    })
    .drag(function( ev, dd ){
        $( this ).css({
          top: dd.offsetY-Y,
          left: dd.offsetX-X
        });
        currElem.top = dd.offsetY-Y;
        currElem.left = dd.offsetX-X;
    });
    copiedEqn = null;
}
//Added on 27th June
//className,code,animation,outputId,hint
function loadEquation(eobj){
    var loadItr = parseInt(eobj.id.charAt(1));
    //Buggy Please Check
    for(var i=math_main_class.length;i<loadItr;i++){
    	var tempEqn = new Equation('e'+i,'<math class="e'+i+'"></math>','flash','eq'+i);
    	tempEqn.isDeleted = true;
    	math_main_class.push(tempEqn);
    	cursorStatus.push(true);
        globalStatus.push(eobj.code.lastIndexOf("</math>"));
        globalCursor = eobj.code.lastIndexOf("</math>");
        stack.push([]);
    }
    //eobj.animation='type';
    math_main_class.push(eobj);
    math_indx=math_main_class.length-1;
    var elem=document.getElementById("MathInput");
    $("#EqnClass").html($("#EqnClass").html()+"<option value='"+eobj.id+"'>"+eobj.id+"</option>");
    loadChildSelect(eobj.childArray);
    $(".UserInput").val("");
    $('#EqnClass').val(""+eobj.id);
    elem.value=eobj.code;
    //console.log("elem val = "+elem.value+" "+elem.value.lastIndexOf("</math>"));
    //elem.setSelectionRange(elem.value.lastIndexOf("</math>"),elem.value.lastIndexOf("</math>"));
    cursorStatus.push(true);
    globalStatus.push(eobj.code.lastIndexOf("</math>"));
    globalCursor = eobj.code.lastIndexOf("</math>");
    stack.push([]);
    updateCursor = true;
    posArray = stack[math_indx];
    disableApply();
}
</script>

<div class="hide" id="rmenu">
            <ul>
                <li>
                    <a onclick="Copy()">Copy</a>
                </li>

                <li>
                    <a onclick="Paste()">Paste</a>
                </li>
            </ul>
</div>

<script>
var coun=0;
var ref=[];
var clipboard;
var objectCounter=0;
var strokewidth=1;
var strokearray=null;
var canvas = new fabric.Canvas('canv', { selection: true,stopContextMenu:true });
var shape = null;
var isDown = false;
var origX, origY, finX, finY, prev=null;
var selecting = false;
var grouping = false;
var group=[];
var x1,y1,x2,y2;
var first = 1;

canvas.on('mouse:down', function(o){
	
	console.log(shape);
  if(shape==null) return;
    isDown = true;
    var pointer = canvas.getPointer(o.e);
    origX = pointer.x;
    origY = pointer.y;
});

canvas.on('mouse:move', function(o){
	  if (!isDown) return;
	  var pointer = canvas.getPointer(o.e);

	  switch(shape) {
	    case 'mycircle':
	    var Circ=new fabric.Mycircle({
	        id:'G'+objectCounter,
	        left: origX,
	        top: origY,
	        radius: Math.abs(origX - pointer.x)/2,
	        right: origX + Math.abs(origX - pointer.x),
	        bottom: origY + Math.abs(origY - pointer.y),
	        strokeWidth: strokewidth,
	        strokeDashArray: strokearray,
	        fill: null,
	        angle:0,
	        stroke: 'black',
	        selectable: true,
	        backgroundColor: 'transparent',
	        originX: 'left', originY: 'top',
	        effect: null,
	        easing: "easeOutElastic",
	        ease_att: 'width',
	        ease_value: 10,
	        duration: 1000,
	        anim_order: 1
	    });
	    if(pointer.x<origX){
	      Circ.set({left: pointer.x});
	    }
	    else{
	      Circ.set({left: origX});
	    }
	    if(pointer.y>origY){
	      Circ.set({top: origY});
	    }
	    else{
	      Circ.set({top: pointer.y});
	    }
	    del(prev);
	    if(prev==null){
	      ref.push(Circ);
	      objectCounter++;
	    }
	    else{
	      ref[objectCounter-1]=Circ;
	    }
	    canvas.add(Circ);
	    prev=Circ;
	    break;

	  case 'myellipse':
	    var ellip=new fabric.Myellipse({
	      id:'G'+objectCounter,
	        left: origX,
	        top: origY,
	        rx: Math.abs(origX - pointer.x)/2,
	        ry: Math.abs(origY - pointer.y)/2,
	        right: origX + Math.abs(origX - pointer.x),
	        bottom: origY + Math.abs(origY - pointer.y),
	        strokeWidth: strokewidth,
	        strokeDashArray: strokearray,
	        fill: null,
	        angle:0,
	        stroke: 'black',
	        selectable: true,
	        backgroundColor: 'transparent',
	        originX: 'left', originY: 'top',
	        effect: null,
	        easing: "easeOutElastic",
	        ease_att: 'width',
	        ease_value: 10,
	        duration: 1000,
	        anim_order: 1
	    });
	    if(pointer.x<origX){
	      ellip.set({left: pointer.x});
	    }
	    else{
	      ellip.set({left: origX});
	    }
	    if(pointer.y>origY){
	      ellip.set({top: origY});
	    }
	    else{
	      ellip.set({top: pointer.y});
	    }
	    del(prev);
	    if(prev==null){
	      ref.push(ellip);
	      objectCounter++;
	    }
	    else{
	      ref[objectCounter-1]=ellip;
	    }
	    canvas.add(ellip);
	    prev=ellip;
	    break;


	    case 'myrect':
	    var Recta=new fabric.Myrect({
	        id:'G'+objectCounter,
	        left: origX,
	        top: origY,
	        width: Math.abs(origX - pointer.x),
	        height: Math.abs(origY - pointer.y),
	        right: origX + Math.abs(origX - pointer.x),
	        bottom: origY + Math.abs(origY - pointer.y),
	        strokeWidth: strokewidth,
	        strokeDashArray: strokearray,
	        fill: null,
	        angle:0,
	        stroke: 'black',
	        selectable: true,
	        backgroundColor: 'transparent',
	        originX: 'left', originY: 'top',
	        effect: null,
	        easing: "easeOutElastic",
	        ease_att: 'width',
	        ease_value: 10,
	        duration: 1000,
	        anim_order: 1,
	      drawType:'Q1'
	    });
	    if(pointer.x<origX){
	      Recta.set({left: pointer.x});
	    }
	    else{
	      Recta.set({left: origX});
	    }
	    if(pointer.y>origY){
	      Recta.set({top: origY});
	    }
	    else{
	      Recta.set({top: pointer.y});
	    }
	    del(prev);
	    if(prev==null){
	      ref.push(Recta);
	      objectCounter++;
	    }
	    else{
	      ref[objectCounter-1]=Recta;
	    }
	    canvas.add(Recta);
	    prev=Recta;
	    break;

	    case 'mytriangle':
	    var Tri=new fabric.Mytriangle({
	        id:'G'+objectCounter,
	        left: origX,
	        top: origY,
	        width: Math.abs(origX - pointer.x),
	        height: Math.abs(origY - pointer.y),
	        right: origX + Math.abs(origX - pointer.x),
	        bottom: origY + Math.abs(origY - pointer.y),
	        angle:0,
	        strokeWidth: strokewidth,
	        strokeDashArray: strokearray,
	        fill: null,
	        stroke: 'black',
	        selectable: true,
	        backgroundColor: 'transparent',
	        originX: 'left', originY: 'top',
	        effect: null,
	        easing: "easeOutElastic",
	        ease_att: 'width',
	        ease_value: 10,
	        duration: 3000,
	        anim_order: 1,
	        drawType:'Q1'
	    });
	    if(pointer.x<origX){
	      Tri.set({left: pointer.x});
	    }
	    else{
	      Tri.set({left: origX});
	    }
	    if(pointer.y>origY){
	      Tri.set({top: origY});
	    }
	    else{
	      Tri.set({top: pointer.y});
	    }
	    del(prev);
	    if(prev==null){
	      ref.push(Tri);
	      objectCounter++;
	    }
	    else{
	      ref[objectCounter-1]=Tri;
	    }
	    canvas.add(Tri);
	    prev=Tri;
	    break;

	    case 'myline':
	    finX=pointer.x;
	    finY=pointer.y;
	    var angg;
	    if(prev==null){
	        angg=0;
	    }
	    else{
	        angg=prev.getAngle();
	    }
	    var line = new fabric.Myline([origX, origY, finX, finY], {
	      id:'G'+objectCounter,
	      left:origX,
	      top: origY,
	      right: finX,
	      bottom: finY,
	      angle: angg,
	      length: Math.sqrt((origX-finX)*(origX-finX)+(origY-finY)*(origY-finY)),
	      stroke: 'black',
	      strokeWidth: strokewidth,
	      strokeDashArray: strokearray,
	      selectable: true,
	      effect: null,
	      easing: "easeOutElastic",
	      ease_att: 'width',
	      ease_value: 10,
	      duration: 2000,
	      anim_order: 1,
	      drawType: 'Q1'
	      });
	  if(pointer.x<origX){
	      line.set({left: pointer.x});
	    }
	    else{
	      line.set({left: origX});
	    }
	    if(pointer.y>origY){
	      line.set({top: origY});
	    }
	    else{
	      line.set({top: pointer.y});
	    }

	  if(origX < finX && origY < finY)line.set({drawType:'Q1'});
	  if(origX > finX && origY < finY)line.set({drawType:'Q2'});
	  if(origX > finX && origY > finY)line.set({drawType:'Q3'});
	  if(origX < finX && origY > finY)line.set({drawType:'Q4'});

	    del(prev);
	    if(prev==null){
	      ref.push(line);
	      objectCounter++;
	    }
	    else{
	      ref[objectCounter-1]=line;
	    }
	    canvas.add(line);
	    prev=line;
	    break;
	  }
	  canvas.renderAll();
	});

canvas.on('mouse:up', function(o){
  for(var i=0;i<objectCounter;i++){
      if(ref[i].type=='mycircle'){
        var off=ref[i].strokeWidth;
        var radii=((ref[i].getWidth())-off)/2;
        ref[i].set({scaleX:1});
        ref[i].set({scaleY:1});
        var ang=ref[i].getAngle();
        ref[i].set({angle:ang});
        ref[i].set({radius:radii});
ref[i].set({left: ref[i].oCoords.tl.x, top: ref[i].oCoords.tl.y, right: ref[i].oCoords.br.x, bottom: ref[i].oCoords.br.y});
      }
  else if(ref[i].type == 'myellipse'){
    var off=ref[i].strokeWidth;
        var rx_v=((ref[i].getWidth())-off)/2;
    var ry_v=((ref[i].getHeight())-off)/2;
        ref[i].set({scaleX:1});
        ref[i].set({scaleY:1});
        var ang=ref[i].getAngle();
        ref[i].set({angle:ang});
        ref[i].set({rx:rx_v,ry:ry_v});

ref[i].set({left: ref[i].oCoords.tl.x, top: ref[i].oCoords.tl.y, right: ref[i].oCoords.br.x, bottom: ref[i].oCoords.br.y});


  }
      else if(ref[i].type =='myline'){
    	  console.log("ksdkasjdla");
        var wd=ref[i].getWidth();
        var ht=ref[i].getHeight();
        var ang=ref[i].getAngle();
    
ref[i].set({left: ref[i].oCoords.tl.x, top: ref[i].oCoords.tl.y, right: ref[i].oCoords.br.x, bottom: ref[i].oCoords.br.y});
    
        ref[i].set({angle:ang});
        var off=ref[i].strokeWidth;
        var len=Math.sqrt(wd*wd+ht*ht)-Math.sqrt(off);
        ref[i].set({length:len});
      }
      else{
        var wd=ref[i].getWidth();
        var ht=ref[i].getHeight();
        var ang=ref[i].getAngle();

  ref[i].set({left: ref[i].oCoords.tl.x, top: ref[i].oCoords.tl.y, right: ref[i].oCoords.br.x, bottom: ref[i].oCoords.br.y});


        ref[i].set({angle:ang});
        ref[i].set({scaleX:1});
        ref[i].set({scaleY:1});
        var off=ref[i].strokeWidth;
        ref[i].set({width:wd-off});
        ref[i].set({height:ht-off});
      }
    }
  isDown = false;
  shape=null;
  prev=null;
  selectable=true;
});

function Fill(){
  var col=document.getElementById("bottle").value;
  //console.log(col);
  if(canvas.getActiveObject()){
    canvas.getActiveObject().set({fill:col});
  }
  else if (canvas.getActiveGroup()) {
            var objectsInGroup = canvas.getActiveGroup().getObjects();
            canvas.discardActiveGroup();
            objectsInGroup.forEach(function(object) {
            object.set({fill:col});
            });
  }
  canvas.renderAll();
}

var copiedObject;
function Copy(){
     if(canvas.getActiveObject()){
    var obj = canvas.getActiveObject();
    if(obj.type == 'mycircle'){
      copiedObject = new fabric.Mycircle({
        id:'G'+objectCounter,
        left: obj.left+10,
        top: obj.top+10,
        radius: obj.radius,
    right: obj.right+10,
    bottom: obj.bottom+10,
        strokeWidth: obj.strokeWidth,
        fill: obj.fill,
        angle:obj.angle,
        stroke: obj.stroke,
        selectable: obj.selectable,
        backgroundColor: obj.backgroundColor,
        originX: obj.originX, originY: obj.originY,
    effect: obj.effect,
	strokeDashArray: obj.strokeDashArray,
        easing: obj.easing,
      ease_att: obj.ease_att,
      ease_value: obj.ease_value,
        duration: obj.duration,
        anim_order: obj.anim_order
    });
    }
    
    else if(obj.type == 'myellipse'){
      copiedObject = new fabric.Myellipse({
      id:'G'+objectCounter,
        left: obj.left+10,
        top: obj.top+10,
    rx: obj.rx,
    ry: obj.ry,
    right: obj.right+10,
    bottom: obj.bottom+10,
        strokeWidth: obj.strokeWidth,
        fill: obj.fill,
        angle:obj.angle,
        stroke: obj.stroke,
        selectable: obj.selectable,
        backgroundColor: obj.backgroundColor,
        originX: obj.originX, originY: obj.originY,
    effect: obj.effect,
	strokeDashArray: obj.strokeDashArray,
        easing: obj.easing,
      ease_att: obj.ease_att,
      ease_value: obj.ease_value,
        duration: obj.duration,
        anim_order: obj.anim_order

    });
}

else if(obj.type == 'myrect'){
  copiedObject = new fabric.Myrect({
        id:'G'+objectCounter,
        left: obj.left+10,
        top: obj.top+10,
        width: obj.width,
        height: obj.height,
    right: obj.right+10,
    bottom: obj.bottom+10,
        strokeWidth: obj.strokeWidth,
        fill: obj.fill,
        angle:obj.angle,
        stroke: obj.stroke,
        selectable: obj.selectable,
        backgroundColor: obj.backgroundColor,
        originX: obj.originX, originY: obj.originY,
    effect: obj.effect,
	strokeDashArray: obj.strokeDashArray,
        easing: obj.easing,
      ease_att: obj.ease_att,
      ease_value: obj.ease_value,
        duration: obj.duration,
        anim_order: obj.anim_order,
      drawType: obj.drawType
    });

}

else if(obj.type == 'mytriangle'){
  copiedObject = new fabric.Mytriangle({
        id:'G'+objectCounter,
        left: obj.left+10,
        top: obj.top+10,
        width: obj.width,
        height: obj.height,
    right: obj.right+10,
    bottom: obj.bottom+10,
        strokeWidth: obj.strokeWidth,
        fill: obj.fill,
        angle:obj.angle,
        stroke: obj.stroke,
        selectable: obj.selectable,
        backgroundColor: obj.backgroundColor,
        originX: obj.originX, originY: obj.originY,
    effect: obj.effect,
	strokeDashArray: obj.strokeDashArray,
        easing: obj.easing,
      ease_att: obj.ease_att,
      ease_value: obj.ease_value,
        duration: obj.duration,
        anim_order: obj.anim_order,
      drawType: obj.drawType

    });

}

else if(obj.type == 'myline'){
  copiedObject = new fabric.Myline([origX, origY, finX, finY],{
      id:'G'+objectCounter,
    left: obj.left+10,
      top: obj.top+10,
    right: obj.right+10,
    bottom: obj.bottom+10,
      angle: obj.angle,
      length: obj.length,
        stroke: obj.stroke,
        strokeWidth: obj.strokeWidth,
        selectable: obj.selectable,
    effect: obj.effect,
	strokeDashArray: obj.strokeDashArray,
        easing: obj.easing,
      ease_att: obj.ease_att,
      ease_value: obj.ease_value,
        duration: obj.duration,
        anim_order: obj.anim_order,
      drawType: obj.drawType
      });

    }

  }
}


function Paste(){
      if(copiedObject){
    canvas.add(copiedObject);
           ref.push(copiedObject);
           objectCounter++;
    ref[objectCounter-1].set({id:'G' + objectCounter});
    canvas.setActiveObject(copiedObject);
        canvas.renderAll();
  }
}

function deleteObjects(){
  var activeObject = canvas.getActiveObject(),
    activeGroup = canvas.getActiveGroup();
    if (activeObject) {
        if (confirm('Are you sure?')) {
          activeObject.remove();
        }
    }
    else if (activeGroup) {
        if (confirm('Are you sure?')) {
            var objectsInGroup = activeGroup.getObjects();
            canvas.discardActiveGroup();
            objectsInGroup.forEach(function(object) {
            object.remove();
            });
        }
    }
    canvas.renderAll();
}

function del(ob){
  var activeObject = ob;
    if (activeObject) {
        canvas.remove(activeObject);
    }
}

//ANIMATION SCRIPT START
function set_effect(effect_g){
  if(canvas.getActiveObject()){ 
    canvas.getActiveObject().set({effect:effect_g});
  }
}

function set_easing(easing_g){
  if(canvas.getActiveObject()){ 
    canvas.getActiveObject().set({easing:easing_g});
  }
}

function set_att_ease(easea_g){
  if(canvas.getActiveObject()){ 
    canvas.getActiveObject().set({ease_att:easea_g});
  }
}


function duration_change_g(){
	  if(canvas.getActiveObject()){
		console.log(first);
		first++; 
		if(first == 2) return;
		
	  canvas.getActiveObject().set({duration:parseInt(document.getElementById('duration_g').value)});
	  }
}

function anim_order_g(){
  if(canvas.getActiveObject()){ 
  canvas.getActiveObject().set({anim_order:parseInt(document.getElementById('a_order_g').value)});
  }
}

function ease_value_g(){
  if(canvas.getActiveObject()){ 
  canvas.getActiveObject().set({ease_value:parseInt(document.getElementById('ease_value_g').value)});
  }
}


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

function show_animation_old(){
	  time_diff = 0;

	  for(var i = 0 ; i < objectCounter; i++){
	    var obj = ref[i];
	    if(!obj.visible) continue;
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
	    time_diff += obj.duration;
	  }
}

//ANIMATION SCRIPT END

</script>

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
    this.set('duration',options.duration||0);
    this.set('anim_order',options.anim_order||0);
    this.set('easing',options.easing||"easeOutElastic");
    this.set('ease_att',options.ease_att||"width");
    this.set('ease_value',options.ease_value||10);
    this.set('groupOrder',options.groupOrder||0);
    
 
    },
    
    toObject:function(){
        return fabric.util.object.extend(this.callSuper('toObject'),{
            id:this.get('id'),
            right:this.get('right'),
            bottom:this.get('bottom'),
            effect:this.get('effect'),
            duration:this.get('duration'),
            anim_order:this.get('anim_order'),
            easing:this.get('easing'),
            ease_att:this.get('ease_att'),
            ease_value:this.get('ease_value')
            ,groupOrder:this.get('groupOrder')
        });
        
    },
    
    _render:function(ctx){
        this.callSuper('_render',ctx);
    }
    
    
});

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
        this.set('duration',options.duration||0);
        this.set('anim_order',options.anim_order||0);
        this.set('easing',options.easing||"easeOutElastic");
        this.set('ease_att',options.ease_att||"width");
        this.set('ease_value',options.ease_value||10);
        this.set('groupOrder',options.groupOrder||0);
        
        },
        
        toObject:function(){
            return fabric.util.object.extend(this.callSuper('toObject'),{
                right:this.get('right'),
                bottom:this.get('bottom'),
                id:this.get('id'),
                effect:this.get('effect'),
                duration:this.get('duration'),
                anim_order:this.get('anim_order'),
                easing:this.get('easing'),
                ease_att:this.get('ease_att'),
                ease_value:this.get('ease_value')
                ,groupOrder:this.get('groupOrder')
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
    this.set('duration',options.duration||0);
    this.set('anim_order',options.anim_order||0);
    this.set('easing',options.easing||"easeOutElastic");
    this.set('ease_att',options.ease_att||"width");
    this.set('ease_value',options.ease_value||10);
    this.set('groupOrder',options.groupOrder||0);
    
    },
    
    toObject:function(){
        return fabric.util.object.extend(this.callSuper('toObject'),{
            right:this.get('right'),
            bottom:this.get('bottom'),
            id:this.get('id'),
            effect:this.get('effect'),
            duration:this.get('duration'),
            anim_order:this.get('anim_order'),
            easing:this.get('easing'),
            ease_att:this.get('ease_att'),
            ease_value:this.get('ease_value')
            ,groupOrder:this.get('groupOrder')
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
    this.set('duration',options.duration||0);
    this.set('anim_order',options.anim_order||0);
    this.set('easing',options.easing||"easeOutElastic");
    this.set('ease_att',options.ease_att||"width");
    this.set('ease_value',options.ease_value||10);
    this.set('groupOrder',options.groupOrder||0);
    
    
    
    },
    
    toObject:function(){
        return fabric.util.object.extend(this.callSuper('toObject'),{
            right:this.get('right'),
            id:this.get('id'),
            bottom:this.get('bottom'),
            effect:this.get('effect'),
            duration:this.get('duration'),
            anim_order:this.get('anim_order'),
            easing:this.get('easing'),
            ease_att:this.get('ease_att'),
            ease_value:this.get('ease_value')
            ,groupOrder:this.get('groupOrder')
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
    this.set('duration',options.duration||0);
    this.set('anim_order',options.anim_order||0);
    this.set('length',options.length||0);
    this.set('drawType',options.drawType||0);
    this.set('easing',options.easing||"easeOutElastic");
    this.set('ease_att',options.ease_att||"width");
    this.set('ease_value',options.ease_value||10);
    this.set('groupOrder',options.groupOrder||0);
    
    
    },
    
    toObject:function(){
        return fabric.util.object.extend(this.callSuper('toObject'),{
            id:this.get('id'),
            length:this.get('length'),
            right:this.get('right'),
            bottom:this.get('bottom'),
            effect:this.get('effect'),
            duration:this.get('duration'),
            anim_order:this.get('anim_order'),
            drawType:this.get('drawType'),
            easing:this.get('easing'),
            ease_att:this.get('ease_att'),
            ease_value:this.get('ease_value'),
            groupOrder:this.get('groupOrder')
        });
        
    },
    
    _render:function(ctx){
        this.callSuper('_render',ctx);
    }
    
});

</script>
<script>
//------------------------------------------------------------------------------------------------------------------

</script>


<!-- Text-Scripts-->


<script>
var MyArray=[]; //Array to store all text elements
var id="T0";    //initially id=0;
var index=0;    //intial index of first element in array is 0;
//Script to make the default element Drragable 
//Script to make default element draggable on click and content editable on double click
  
var AO,xoff=0,yoff=0,i;
var lefter=[];
var topper=[];
var leff,topp;
var id,flag=0;
  var O=$(document.getElementById("canvas-wrap")).offset();
  var X=O.left;
  var Y=O.top;
  
//Script to delete a text element
        function DeleteDiv()
    {
          if(MyArray.length>=0 && document.getElementById(id)!=null)
            {
              document.getElementById(id).style.visibility="hidden";
              MyArray[index].isDeleted=true;
          //MyArray.splice(index, 1);
          //document.getElementById(id).remove();
          }
          else if(document.getElementById(id)==null && MyArray.length!=0)
          {
          alert("Select an element to delete");
          }
          else if(MyArray.length==0)
          {
          alert("There is no  element that can be  deleted");         
          }
          
    }
    var X1=0,Y1=0;
    $(document).ready(function(){
    	$("#canvas-wrap").scroll(function(){
    		X1=$(this).scrollLeft();
    		Y1=$(this).scrollTop();
    	});
    		});
//Script to create a new text element, make it draggable and on double click it should be content editable, giving it default attributes and storing it in the array 
      var c=0;
      var tdata="Enter text here.";
      var txpos=140;
      var typos=50;
    function NewDiv()
    { 
      $("#canvas-wrap").append('<div id="T'+ c +'" name="T'+ c +'" class="demo" contenteditable="true" style="display: inline-block;"  class="ui-widget-content draggable,animated,drag">'+tdata+'</div> ');
            var x=  "#T"+c;    

            document.getElementById("T"+c).style.left=txpos+'px';
            document.getElementById("T"+c).style.top=typos+'px';
      $(x).draggable({ containment: "parent" },
            {
      drag: function(){
            var offset = $(this).offset();
            var xPos = offset.left-X+X1;
            var yPos = offset.top-Y+Y1;
      MyArray[index].xPos=xPos;
      MyArray[index].yPos=yPos;
             },
            })
      .drag("init",function(dd){
            /*if(flag==1)
            {
              id=this.id;
              console.log("After Deleting the drag has started from :"+id);
            }*/
            id=this.id;
            if( $( this ).is('.selected') )
              console.log("init: "+ id);
              AO=canvas.getActiveObject();
              AG=canvas.getActiveGroup();
              var offset=$(this).offset();
              left=offset.left;
              topp=offset.top;
              if(AO && this.id==id &&  $( this ).is('.selected'))      
              {
               
                xoff=AO.getLeft()-left;
                yoff=AO.getTop()-topp;
                console.log("id matched for init is "+id);
              }
              else if(AG  && this.id==id && $( this ).is('.selected'))
                {
                 
                 lefter = [];
                 topper = [];
                 var objects=AG.getObjects();
                 objects.forEach(function(object){
                 lefter.push(object.getLeft()-left);
                 topper.push(object.getTop()-topp);
                 });
                }
            return $('.selected');        
        })
        .drag(function( ev, dd ){
           //   console.log("drag: "+id);
            $( this ).css({
              top: dd.offsetY-Y+Y1,
              left: dd.offsetX-X+X1
            });

            for(var k=0;k<MyArray.length;k++)
                {
                if(MyArray[k].id==this.id)
                    index=k;
                }
             var offset = $(this).offset();
             var xPos = offset.left-X+X1;
             var yPos = offset.top-Y+Y1;
             MyArray[index].xPos=xPos;
                MyArray[index].yPos=yPos;
                //console.log("index: "+index+"Xpos: "+MyArray[index].xPos+"Ypos: "+MyArray[index].yPos);

            if(AO && this.id==id && $(this).hasClass("selected")) 
            {
              
              var a=(dd.offsetY+yoff);
              var b=(dd.offsetX+xoff);
              AO.set({top:a,left:b});
              AO.setCoords();
              canvas.renderAll();
              console.log("id matched for drag is "+id);
            }
            else if(AG && this.id==id && $(this).hasClass("selected"))
            {
              
                 var objects=AG.getObjects();
                 i=0;
                 objects.forEach(function(object){
                 object.set({top:dd.offsetY+topper[i],left:dd.offsetX+lefter[i]});
                 object.setCoords();
                 i++;
                 canvas.renderAll();
                 });           
            }
        })

         .drag("end",function(ev,dd)
                {
                        for(var k=0;k<MyArray.length;k++)
                        {
                          if($( document.getElementById(MyArray[k].id)).is('.selected'))
                           {
                             var offset = $(document.getElementById(MyArray[k].id)).offset();
                             var xPos = offset.left-X+X1;
                             var yPos = offset.top-Y+Y1;
                             MyArray[k].xPos=xPos;
                                MyArray[k].yPos=yPos;
                             console.log("index: "+k+"Xpos: "+MyArray[k].xPos+"Ypos: "+MyArray[k].xPos);
                           }
                         }
                        });

      var s=document.getElementById(id).innerHTML;
      var i="flash";
      var offset=document.getElementById(id);
      var l=txpos;
      var t=typos;

     MyArray.push({id:"T"+c,Data:s,in_anim:i,xPos:l,yPos:t,in_delay:"2",in_duration:"3000",animOrder:"1",groupOrder:"0"});
      $(document.getElementById("#"+x)).attr( 'contenteditable', true );
      CKEDITOR.inline( "T"+c,{});
      c++;
    
    function singleClick(e) {
           $( this ).toggleClass("selected");
            
                   $(this).draggable( "option", "disabled", true );
                 $(this).attr('contenteditable','true');
                 id = this.id || '';
                 for(var j=0;j<MyArray.length;j++)
                 {
                 if(MyArray[j].id==id)
                       { index=j;
                   break;}
                 }
         T_E=1;
         
         var hint_index=-1;
         for(var k=0;k<hint.length;k++)
         {
          if(hint[k].id==id)
           hint_index=k;
         }
         if(hint_index!=-1)
           {
            document.getElementById("displaySmallHint").innerHTML = hint[hint_index].smallHint; 
            document.getElementById("displayBigHint").innerHTML = hint[hint_index].bigHint ;
            document.getElementById("anchor1").href=hint[hint_index].URLs;
            document.getElementById("anchor1").innerHTML = hint[hint_index].url; 
          }
    }
      function doubleClick(e)
      {
        //console.log("double click");
        this.focus();
        $(x).prop('contentEditable',true);
          MyArray[index].Data=this.innerHTML;
      }
      $(x).click(function(e) 
      {
        var that = this;
        setTimeout(function() 
        {
         var dblclick = parseInt($(that).data('double'), 10);
         if (dblclick > 0) 
            {
               $(that).data('double', dblclick-1);
          }
           else 
             {
            singleClick.call(that, e);
          }
        }, 300);
      })
      .dblclick(function(e)
      {
        $(this).data('double', 2);
        doubleClick.call(this, e);
      });
      tdata="Enter text here.";
    }
          
          
//Script to give in animation
    function in_anim(value)
    {
        MyArray[index].in_anim=value;
    }
//Script to give in delay
    function in_delay_change()
    {
         var v1=document.getElementById("in_delay").value;
         if(v1!=null && v1!="")
         {
           $("#"+id).css({"-webkit-animation-duration": v1+'s'});
         $("#"+id).css({"-moz-animation-duration": v1+'s'});
         $("#"+id).css({"animation-duration": v1+'s'});
         MyArray[index].delay=v1;
         }
    }
    
//Script to give in duration
    function in_duration_change()
    {
         var v2=document.getElementById("in_duration").value;
         MyArray[index].in_duration=v2;
    } 
//Script to give in animmation order
    function in_anim_order()
    {
        MyArray[index].animOrder=document.getElementById("in_a_order").value;
    }
    
//Script to extend the animation function
    $.fn.extend({
        animateCss: function (animationName) {
          var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            this.addClass('animated ' + animationName).one(animationEnd, function() {
              $(this).removeClass('animated ' + animationName);
            });
          }
    });
//Script to show animation    
    function f1()
    {
      var element=document.getElementById(id);
      var e1 = MyArray[index].in_anim;
      $(element).animateCss(""+e1);
    }
</script>
<script>

//--------------------------------------------------------------------------------------------------------------

//Script for playing animations;


var iterator=0;

var time=0;

var animationController=true;

var renderAll=false;

function play(){
	
	console.log("Entered play");
	iterator=0;
	playAnimation();
}
function playAnimation(){
	
	
	console.log("$$$$"+groupArray.length+"  "+iterator);
	
	console.log(groupArray);
	if(iterator==groupArray.length){
		time=0;
		return;
	}
	
	
	bypass=false;
	
	var children=groupArray[iterator].kid;
	
	console.log(children.length+" "+iterator);
	
	children.sort(function(a,b){return a.order-b.order;});
	
	for(var i=0;i<children.length;i++){
		
		console.log(children[i].id+"  "+children[i].animation);
		
		setTimeout(animateObject,time,children[i]);
		
		console.log("returned");
		
		time+=parseInt(children[i].duration);
		
	}
	
	time+=parseInt(groupArray[iterator].delay);
	
	console.log("time="+time);
	
	iterator++;
	
	console.log(groupArray.length+"  "+iterator);
	
	setTimeout(playAnimation,time);
	
	console.log("came here");
	
	time=0;
        
}

function animateObject(obj){
	
	var c=obj.id[0];
	var i;
	if(c=='e'){
		
		for(i=0;i<math_main_class.length;i++){
			
			if(math_main_class[i].id==obj.id)
				break;
		}
		
		$("."+math_main_class[i].outputId).css("visibility","visible");
		
		console.log("entered animate equation with "+math_main_class[i].outputId+" "+obj.animation);
		
		$("#"+math_main_class[i].outputId).animateCss(obj.animation);
		
		return;
		
	}
	
	if(c=='T'){
		
		for(i=0;i<MyArray.length;i++){
			
			if(MyArray[i].id==obj.id)
				break;
		}
		
		$("#"+MyArray[i].id).css("visibility","visible");
	     
		console.log("entered animate text with "+MyArray[i].id+"  "+obj.animation);
		
    	$("#"+MyArray[i].id).animateCss(obj.animation);
    	
    	return;
	}
	
	for(i=0;i<canvas.getObjects().length;i++){
		
		//console.log(canvas.item(i).type+ "  "+ canvas.getObjects().length);
		if(ref[i].id==obj.id)
			break;
	}
	
	console.log(canvas.getObjects().length+ "  "+i);
	
	canvas.item(i).set({visible:true,duration:obj.duration});
	
	canvas.renderAll();
	
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
function Create_Group(){
  var groupKid=[];
  //var TEArray = MyArray.concat(math_main_class); 
  for(var k=0;k<MyArray.length;k++){
    var element=document.getElementById(MyArray[k].id);
    console.log("Element"+element);
    if($(element).hasClass("selected")){
    	MyArray[k].groupOrder=1;
       groupKid.push({id:MyArray[k].id,order:MyArray[k].animOrder,animation:MyArray[k].in_anim,duration:1000});
     }
  }
  for(var k=0;k<math_main_class.length;k++){
    var element=document.getElementById(math_main_class[k].outputId);
    console.log("Element"+element);
    if($(element).hasClass("selected")){
    	math_main_class[k].groupOrder=1;
       groupKid.push({id:math_main_class[k].id,order:math_main_class[k].animOrder,animation:math_main_class[k].animation,duration:1000});
     }
  }
  AO=canvas.getActiveObject();
  if(AO){
	  AO.set({groupOrder:1});
    groupKid.push({
      id:AO.id,
      order:AO.anim_order,
      animation:AO.effect,
      duration:AO.duration
    });
  }
  AG=canvas.getActiveGroup();
  if(AG){
    var objects=AG.getObjects();
    objects.forEach(function(object)
    {
        //groupKid.push(object);
        groupKid.push({
          id:object.id,
          order:object.anim_order,
          animation:object.effect,
          duration:object.duration
        });
        object.set({groupOrder:1});
     }
    );
    
    
  }
  
  if(document.getElementById("createGroupOrder").value=="" || document.getElementById("createGroupDelay").value=="")
  {
		alert("Group Not Created. Enter proper values");
		return;
  }
  
  for(var i=0;i<groupArray.length;i++){
	  
	  if(groupArray[i].groupOrder==document.getElementById("createGroupOrder").value)
	  {
	  		alert("Group Order "+groupArray[i].groupOrder +"already exists");
	  		return;
	  }
  }
  var myGroup = new Group(document.getElementById("createGroupOrder").value,document.getElementById("createGroupDelay").value,$('input[name="groupEvent"]:checked').val());
  myGroup.kid = groupKid;
  groupArray.push(myGroup);
  grArraySize++;
  console.log("Group Created");
  console.log(JSON.stringify(groupArray));
}
</script>


<script>
function addGraphics()
{
	
	for(var i=0;i<json.graphics.objects.length;i++){
		
		var gk=json.graphics.objects[i];
		
		var obj;
		console.log(gk.type+"  "+gk.strokeWidth);
		
		switch(gk.type)
		{
		case 'mycircle':
			obj=new fabric.Mycircle({
				id:gk.id,
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
		        visible:true,
		        backgroundColor:gk.backgroundColor,
		        selectable:true,
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
		        groupOrder:gk.groupOrder
		        ,effect:gk.effect,
		        anim_order:gk.anim_order,
		        duration:gk.duration
		        
		        
		        
			});
			break;
			
		case 'myellipse':
			obj=new fabric.Myellipse({
				id:gk.id,
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
		        visible:true,
		        backgroundColor:gk.backgroundColor,
		        selectable:true,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value,
		        groupOrder:gk.groupOrder,
		        rx:gk.rx,
		        ry:gk.ry
		        ,effect:gk.effect,
		        anim_order:gk.anim_order,
		        duration:gk.duration
			});
	        break;
	        
		case 'myrect':
				obj=new fabric.Myrect({
					left: gk.left,
					id:gk.id,
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
			        visible:true,
			        backgroundColor:gk.backgroundColor,
			        selectable:true,
			        right:gk.right,
			        bottom:gk.bottom,
			        effect:gk.effect,
			        duration:gk.duration,
			        anim_order:gk.anim_order,
			        easing:gk.easing,
			        ease_att:gk.ease_att,
			        ease_value:gk.ease_value,
			        groupOrder:gk.groupOrder,
			        rx:gk.rx,
			        ry:gk.ry
			        ,effect:gk.effect,
			        anim_order:gk.anim_order,
			        duration:gk.duration
			    });
				break;
		case 'mytriangle':
			obj=new fabric.Mytriangle({
				left: gk.left,
				id:gk.id,
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
		        visible:true,
		        backgroundColor:gk.backgroundColor,
		        selectable:true,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value,
		        groupOrder:gk.groupOrder
		        ,effect:gk.effect,
		        anim_order:gk.anim_order,
		        duration:gk.duration
		        
		    });
			break;
		case 'myline':
			obj=new fabric.Myline([gk.x1, gk.y1, gk.x2, gk.y2], {
				left: gk.left,
				id:gk.id,
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
		        visible:true,
		        backgroundColor:gk.backgroundColor,
		        selectable:true,
		        right:gk.right,
		        bottom:gk.bottom,
		        effect:gk.effect,
		        duration:gk.duration,
		        anim_order:gk.anim_order,
		        easing:gk.easing,
		        ease_att:gk.ease_att,
		        ease_value:gk.ease_value,
		        groupOrder:gk.groupOrder
		        ,effect:gk.effect,
		        anim_order:gk.anim_order,
		        duration:gk.duration
		        
			});
		    
		
		}
		canvas.add(obj);
		
		console.log(canvas.getObjects().length+" akdak");
	}
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
            ajaxRequest=new ActiveXObject("Msxm12.XMLHTTP");
        }catch(e)
        {
            try{
                ajaxRequest=new ActiveXObject("Microsoft.HMLHTTP");
                
            }catch(e)
            {
                alert("use a proper browser you idiot");
                return false;
                
            }
            
        }
        
    }
    
}
function innerHTMLChange()
{
    for(var k=0;k<MyArray.length;k++)
        {
            MyArray[k].Data=document.getElementById(MyArray[k].id).innerHTML;
        }
}
function queryDataBase(){
	
	if(document.getElementById("savetopicname").value==""||document.getElementById("saveactivityname").value=="")
	{
		alert("Activity not Saved. Enter Proper Values");
		return;
	}
    innerHTMLChange();
    var equations=[];
    
    //Default Group Causing errors
    var defaultGroup = new Group(-1,1000,'automatic');
    var groupKid=[];
    for(var i=0;i<math_main_class.length;i++)
    {
        if(!math_main_class[i].isDeleted)
            equations.push(math_main_class[i]);
       	if(math_main_class[i].groupOrder == 0){
        	groupKid.push({id:math_main_class[i].id,order:math_main_class[i].animOrder,animation:math_main_class[i].animation,duration:1000});
        }
    }
    
    var texts=[];
    for(var i=0;i<MyArray.length;i++){
        if(!MyArray[i].isDeleted)
            texts.push(MyArray[i]);
        if(MyArray[i].groupOrder == 0)
        	groupKid.push({id:MyArray[i].id,order:MyArray[i].animOrder,animation:MyArray[i].in_anim,duration:1000});
    }
    
    for(var i=0;i<ref.length;i++){
        if(ref[i].groupOrder == 0)
        	groupKid.push({id:ref[i].id,order:ref[i].anim_order,animation:ref[i].effect,duration:ref[i].duration});
    }
   defaultGroup.kid=groupKid;
   if(groupArray.length>0 && groupArray[0].groupOrder == -1){
	   groupArray.shift();
   }
   groupArray.unshift(defaultGroup);
   console.log("After Creating the default : "+groupArray);
    
   	var topic = document.getElementById("savetopicname").value;
    var activity = document.getElementById("saveactivityname").value;
    activity = activity.split(' ').join('_');
    topic = topic.split(' ').join('_');
    console.log(topic + ' ' + activity);
    
    var activity={
           	tname:topic,
            aname:activity,
            desc:document.getElementById("description").value,
            type:"tutorial",
            text:texts,
            equation:equations,
            graphics:canvas,
            group:groupArray,
            hints:hint
    }
    
    var json=JSON.stringify(activity);
   
    json = json.replace(/\+/g,"PLUS");
    
    
    
    console.log(json);
    console.log(escape(json));
    
    getObject();
    
    $.ajax({
        type:'post',
        url:'StoreActivity',
        dataType:'JSON',
        data:
        {
           activity:escape(json)
        },
        success:processRequest,
        error:function(){alert("Error");}
    });
    
    
    
}

function processRequest()
{
    alert("Activity Has been saved successfully");    
    //location.reload();
}

</script>

<script>
function requestActivity(obj,obj1)
{
	tname=obj1.id; //topic name
	
	tname=tname.substr(0,tname.length-4); 
    
    aname=obj.id; //activity name
    
    getObject();
    
    var url="RetrieveActivity?tname="+escape(tname)+"&aname="+escape(aname);
    
    ajaxRequest.onreadystatechange=loadActivity;
    
    ajaxRequest.open("GET",url,true); //sending a get request to the servlet RetrieveActivity
    
    ajaxRequest.send();
}

var tname;
var aname;
var desc;
var type;
var json;
function loadActivity()
{
    if(ajaxRequest.readyState==4)
    {
        
        console.log(ajaxRequest.responseText);
        
        var rt=ajaxRequest.responseText;
        
        console.log(rt);
        
        rt = rt.replace(/PLUS/g,"+"); //since + is not a character well passed in a url requuest, we convert + to PLUS and then while retrieval too we reconvert it 
        
        json=JSON.parse(rt);
        
        tname=json.tname;
        
        aname=json.aname;
        
        desc=json.desc;
        
        type=json.type;
        
        addElements(json);
    }
}

function addElements(json)
{
    var division=document.getElementById("canvas-wrap");
    
    var x=division.childNodes.length;
    
    //clearing the parent div for new entry of data
    
    for(i=0;i<x-2;i++)
        division.removeChild(division.lastChild);
    
    canvas.clear();//clearing the canvas
   
    math_main_class=[];
  	math_indx=-1;
    stack=[];
    posArray=[];
    globalStatus=[];
    cursorStatus=[];
    $("#EqnClass").empty();
    for(var i=0;i<json.equation.length;i++)
    {
        var e=json.equation[i];
        loadEquation(e);
        text="<div id='"+e.outputId+"' class='demo drag draggable ui-widget-content math_equation' style='display:inline-block;top:"+e.top+"px;left:"+e.left+"px;z-index:2'>";
        text+=e.code;
        text+="</div>";
        $("#canvas-wrap").append(text);
        var currElem = math_main_class[math_indx];
        $("#"+e.outputId).draggable({
          drag: function(){
                var offset = $(this).offset();
                var xPos = offset.left-canvasX;
                var yPos = offset.top-canvasY;
                currElem.top = yPos;
                currElem.left = xPos;
                
            }
        });
        $("#"+e.outputId).click(function(){
          $( this ).toggleClass("selected");      
          $(this).draggable( "option", "disabled", true );
        })
        .drag("init",function(dd){
            
         
            return $('.selected');        
        })
        .drag(function( ev, dd ){
           //   console.log("drag: "+id);
            $( this ).css({
              top: dd.offsetY-Y,
              left: dd.offsetX-X
            });
            currElem.top = dd.offsetY-Y;
            currElem.left = dd.offsetX-X;
        });
    }
    MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
    $(".mathCursor").remove();
    ref=[];
    
    
    for(var i=0;i<json.text.length;i++)
    {
        var t=json.text[i];
        c=t.id.substr(1);
        txpos=t.xPos;
        typos=t.yPos;
        tdata=t.data;
        NewDiv();
        MyArray[MyArray.length-1].groupOrder = json.text[i].groupOrder;
        MyArray[MyArray.length-1].in_anim=json.text[i].in_anim;
        MyArray[MyArray.length-1].animOrder=json.text[i].animOrder;
        MyArray[MyArray.length-1].in_duration=json.text[i].in_duration;
    }
    

    txpos=10;
    typos=10;
    if(MyArray.length>0)
    c=parseInt(MyArray[MyArray.length-1].id.substring(1))+1;
    
    else
    	c=0;
    tdata="<p>This is typical Text Element</p>";
	
    addGraphics();
    
    
    for(var i=0;i<json.graphics.objects.length;i++){
    	
    	ref.push(canvas.item(i));
    	
    	console.log(ref.length);
    	
    }
    
    if(ref.length>0)
    objectCounter=c=parseInt(ref[ref.length-1].id.substring(1))+1;
    else
    	objectCounter=0;
    
    groupArray = json.group;
    
    console.log(json.group.length+" "+groupArray.length);
    
    
}


</script>
<script>

function Copy1()
{
     AO=canvas.getActiveObject();
     AG=canvas.getActiveGroup();

   if(AG==null && AO==null)
   {
      if(T_E==1)
    {
    tdata=document.getElementById(id).innerHTML;
    }
    else
    {
    var copyIndex = parseInt(selectedIndex);
    var eqObj = math_main_class[copyIndex];
    console.log(copyIndex+" "+eqObj);
    copyEquation(eqObj);
    }
   }
   else //Graphics
   {
   Copy();
   }
}

function Paste1()
{

   if(AG==null && AO==null)
   {
      if(T_E==1)
    {
    NewDiv();
    }
    else if(T_E==0)
    {

    console.log("Paste called for eqtn");
    pasteEquation();
    }
   }
   else //Graphics
   {
   Paste();
   }
}
</script>
</body>
</html>
