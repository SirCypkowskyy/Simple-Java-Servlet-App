<%@ page import="java.util.List" %>
<%@ page import="com.pjatk.tpo_servlet1.Models.Game" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JSP games</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<br>

<header class="header">
  <h1 id="title" class="text-center">Game Finder</h1>
  <p id="description" class="text-center">
    Queried games: <%= ((ArrayList<Game>) request.getAttribute("games")).size() %>
  </p>
</header>

<section>
  <div class="container">
    <div class="row">
      <%
        int index = 0;
        for (Game game : (ArrayList<Game>) request.getAttribute("games"))
        {
          index++;
      %>
      <div class="col-md-4">
        <div class="card card-01">
          <img class="card-img-top" src="https://cdn.cloudflare.steamstatic.com/steam/apps/<%= game.steamId %>/header.jpg" alt="game img">
          <div class="card-body">
            <h4 class="card-title"><%=game.name%></h4>
            <h5 class="card-text font-weight-light"><%=game.author.name%></h5>
            <p><%=game.genre.name%> Genre</p>
            <br/>
            <% if (game.hasMultiplayer) { %>
            <span class="badge bg-success">Has multiplayer</span>
            <% } %>
            <% if (!game.author.isBiggerCompany) { %>
            <span class="badge bg-primary">Indie developer</span>
            <% } %>
            <% if (game.isForAdults) { %>
            <span class="badge bg-danger">For adults</span>
            <% } %>
            <br/>
            <a href="https://store.steampowered.com/app/<%=game.steamId%>/" class="btn btn-default text-uppercase">Find on Steam</a>
          </div>
        </div>
      </div>
      <%
        }
      %>
    </div>
    </div>
</section>

<div class="ml-0 mr-0 mb-3 mx-auto text-center">
  <a href="index.jsp" class="btn btn-warning">Back to search page</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>

<style>
  @import url('https://fonts.googleapis.com/css?family=Libre+Baskerville:400,700');

  h1{
    font-weight: 700;
    font-size: 45px;
    color: #ffffff;
    font-family: 'Roboto', sans-serif;
  }

  .header{
    margin-bottom: 80px;
  }
  #description{
    font-size: 24px;
    color: #ffffff;
  }

  body {
    background-image: url("https://wallpaperaccess.com/full/4910984.gif");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
  }

  h4 {
    font-weight: 700;
    font-size: 1.5rem;
    line-height: 0.83rem;
  }

  section{
    float:left;
    width:100%;
    padding:30px 0;
    position:relative;
    overflow:hidden;
    margin: 30px;
  }

  span {
    font-size: 20px;
    color: #DFC717;
    margin: 10px;
  }

  section:before{
    content:"";
    position:absolute;
    width:110%;
    height:100%;
    filter: blur(10px);
    z-index:0;
    transform: scale(2);-ms-transform: scale(2);
    -webkit-transform: scale(2);
  }

  .btn-default{
    background:#006EFF; width: 100%; color:#fff; font-weight:700; text-shadow:1px 1px 0 rgba(0,0,0,0.2); font-size:14px;
  }
  .card{
    box-shadow:2px 2px 20px rgba(0,0,0,0.3); border:none; margin-bottom:30px;
  }
  .card:hover{
    transform: scale(1.05);
    transition: all 1s ease;
    z-index: 999;
  }
  .card-01 .card-body{
    position:relative; padding-top:40px;
  }
  .card-01 .badge-box{
    position:absolute;
    top:-20px; left:50%; width:100px; height:100px;margin-left:-50px; text-align:center;
  }
  .card-01 .badge-box i{
    background:#006EFF; color:#fff; border-radius:50%;  width:50px; height:50px; line-height:50px; text-align:center; font-size:20px;
  }
  .card-01 .height-fix{
    height:455px; overflow:hidden;
  }

  .card-01 .height-fix .card-img-top{
    width:auto!imporat;
  }


  .profile-box img{
    width:170px; height:170px; position:relative; border:5px solid #fff;
  }

  .social-box i {
    border:1px solid #006EFF; color:#006EFF; width:30px; height:30px; border-radius:50%;line-height:30px;
  }

  .social-box i:hover{
    background:#DFC717; color:#fff;
  }

  .social-box a{margin: 0 5px;}

  .card-01.height-fix .card-img-overlay{
    top:unset;
    color:#fff;
    background: -moz-linear-gradient(top, rgba(26,96,111,0) 0%, rgba(26,96,111,0) 1%, rgba(24,87,104,0.91) 31%, rgba(21,65,89,0.91) 100%); /* FF3.6-15 */
    background: -webkit-linear-gradient(top, rgba(26,96,111,0) 0%,rgba(26,96,111,0) 1%,rgba(24,87,104,0.91) 31%,rgba(21,65,89,0.91) 100%); /* Chrome10-25,Safari5.1-6 */
    background: linear-gradient(to bottom, rgba(26,96,111,0) 0%,rgba(26,96,111,0) 1%,rgba(24,87,104,0.91) 31%,rgba(21,65,89,0.91) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#001a606f', endColorstr='#e8154159',GradientType=0 );
  }
  .card-01.height-fix .fa{color: #fff;font-size: 22px;margin-right: 18px;};

  .card__back .card{
    width:100%;
    height:65vh;
  }
  .card-flipper.effect__hover:hover .card__front {
    -webkit-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
  }

  .card-flipper.effect__hover:hover .card__back {
    -webkit-transform: rotateY(0);
    transform: rotateY(0);
  }

  .card-flipper.effect__random.flipped .card__front {
    -webkit-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
  }

  .card-flipper.effect__random.flipped .card__back {
    -webkit-transform: rotateY(0);
    transform: rotateY(0);
  }
</style>
