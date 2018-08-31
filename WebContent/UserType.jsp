<!DOCTYPE html>
<html>
<head>
<title>ekshiksha:Cubents</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, html {
    height: 100%;
}

.parallax {
    /* The image used */
    background-image: url('cube.gif');
   
    /* Full height */
    height: 100%; 

    /* Create the parallax scrolling effect */
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    opacity:0.7;
}

.caption {
    text-align: center;
    color: #000;
}
.caption {
  
    left: 0;
    top: 50%;

    width: 100%;
    text-align: center;
    color: #000;
  }
  .caption span.border {
    background-color: #111;
    color: #fff;
    padding: 18px;
    font-size: 24px;
}
.container3 {
    position: relative;
    width: 50%;
    padding-left:50px;
    
}

.image {
  opacity: 1;
  display: block;
  width: 100%;
  height: auto;
  transition: .5s ease;
  backface-visibility: hidden;
  width:500px;
  height:400px;
}

.middle {
  transition: .5s ease;
  opacity: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  padding-left:300px;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%)
}

.container3:hover .image {
  opacity: 0.3;
}

.container3:hover .middle {
  opacity: 1;
}

.text {

   background-color: #4CAF50;
  font-size: 16px;
  color: white;
  padding: 16px 32px;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">ekshiksha</a>
    </div>
    <ul class="nav navbar-nav">
    
      <li><a href="#">Cubents</a></li>
      <li><a href="#m1">About</a></li>
      <li><a href="#m2">Start here</a></li>
    </ul>
  </div>
</nav>
<div class="parallax">

</div>
<div class="container text-center" style="height:40px;width:100%;margin-top:50px;">
<div class="caption">
<span class="border"><sup><i class="fa fa-quote-left"></i></sup>Mathematics is not about numbers,equations, computations, or algorithms: it is about understanding.<sup><i class="fa fa-quote-right"></i></span>
</div>
</div>

<div class="container text-center" id="m1" style="height:500px;width:100%;color:white;background-color:rgba(12, 60, 96, 1);margin-top:70px;padding:50px">

<h1 style>About</h1>
<div class="row" style="margin-top:80px">
<div class="col-sm-6" style="font-size:24px">
We have impelmented a black board where educational content can be
displayed. The content will be animated and reproduced in a manner which is friendly
to the learner. The board will support three types of content which can be mixed
together in any manner as required by the content developer/teacher. The board will
support text, equations as well as simple graphics elements.
</div>
<div class="col-sm-6" style="font-size:24px">
The learner application will present a set of topics. When the learner chooses a topic,
the application will present the set of learning units (and their types) to the learner. The
learner is allowed to inspect the short description of each of the units.Once the learner chooses a learning unit, the content will be presented to him as per the animations created.
</div>
</div>

</div>

<div class="container text-center" id="m2" style="height:700px;width:100%;color:white;padding:50px;background-color:#F59B29">

<h1>Start here</h1>
<div class="row" style="margin-top:80px">
<div class="col-sm-6" style="color: #111;font-size:24px">
<div class="container3">
  <img src="editor.jpg" class="image">
  <a href="LearnerView?url=EditorView.jsp" target="_blank"><div class="middle">
    <div class="text">Editor</div>
  </div></a>
</div>
</div>
<div class="col-sm-6" style="color:white;font-size:24px">
<div class="container3">
 <img src="learner.jpeg" class="image">
  <a href="LearnerView?url=LearnerView.jsp" target="_blank"><div class="middle">
    <div class="text">Learner</div>
  </div></a>
</div>
</div>


</div>
</div>
<footer class="container-fluid text-center">
  <h3>Share us@
  <a href="https://www.facebook.com/facebook"><i class="fa fa-facebook"></i></a>   
  <a href="https://www.instagram.com/?hl=en"><i class="fa fa-instagram"></i></a>
  <a href="https://mobile.twitter.com/i/guest"><i class="fa fa-twitter"></i></a>  
</h3>   
</footer>
</body>
</html>
