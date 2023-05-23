<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JSP TPO entry page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>


<div class="container overlay">
    <header class="header">
        <h1 id="title" class="text-center">Game Finder</h1>
        <p id="description" class="text-center">
            Search for games by your own criteria
        </p>
    </header>
    <form action="main-servlet" method="get" class="form-wrap">
        <form id="survey-form">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label id="name-label" for="name">Game Name</label>
                        <input type="text" name="fgamename" id="name" placeholder="Enter searched game name" class="form-control">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label id="email-label" for="game-author">Game Author</label>
                        <input type="text" name="fgameauthor" id="game-author" placeholder="Enter searched game author name" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label id="number-label" for="game-genre">Game genre</label>
                        <input type="text" name="fgamegenre" id="game-genre" class="form-control" placeholder="Game genre name">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Sort by</label>
                        <select id="dropdown-sort" name="sortbyval" class="form-control" required>
                            <option value="name" selected>Game's Name</option>
                            <option value="author">Author's Name</option>
                            <option value="genre">Genre's Name</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Producer size</label>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline1" value="all" name="fgames" class="custom-control-input" checked="">
                            <label class="custom-control-label" for="customRadioInline1">All</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline2" value="indie" name="fgames" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline2">Indie</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline">
                            <input type="radio" id="customRadioInline3" value="corpo" name="fgames" class="custom-control-input">
                            <label class="custom-control-label" for="customRadioInline3">Corporation</label>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Additional Requirements</label>
                        <select name="additional-settings" multiple="multiple">
                            <option value="onlymultiplayer">Show only games with multiplayer</option>
                            <option value="onlysingleplayer">Show only games without multiplayer</option>
                            <option value="onlytrending">Show only trending genre games</option>
                            <option value="onlyniche">Show only niche genre games</option>
                            <option value="onlyadult">Show only adult games</option>
                            <option value="onlynonadult">Show only non-adult games</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <button type="submit" id="submit" class="btn btn-primary btn-block">Submit Search</button>
                </div>
            </div>

        </form>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        $('#multiple-checkboxes').multiselect({
            includeSelectAllOption: true,
        });
    });
</script>
</body>
</html>

<style>
    @import url('https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap');

    body {
        background-image: url("https://wallpaperaccess.com/full/4910984.gif");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        background-attachment: fixed;

    }


    .container{
        max-width: 1230px;
        width: 100%;
    }
    h1{
        font-weight: 700;
        font-size: 45px;
        color: #ffffff;
        font-family: 'Roboto', sans-serif;
    }

    .header{
        padding: 50px;
        margin-bottom: 80px;
        background-color: rgba(0,0,0,0.5);
    }
    #description{
        font-size: 24px;
        color: #ffffff;
    }

    .form-wrap{
        background: rgba(255,255,255,1);
        width: 100%;
        max-width: 850px;
        padding: 50px;
        margin: 0 auto;
        position: relative;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
        box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
    }
    .form-wrap:before{
        content: "";
        width: 90%;
        height: calc(100% + 60px);
        left: 0;
        right: 0;
        margin: 0 auto;
        position: absolute;
        top: -30px;
        background: #00bcd9;
        z-index: -1;
        opacity: 0.8;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        -webkit-box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
        -moz-box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
        box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.15);
    }
    .form-group{
        margin-bottom: 25px;
    }
    .form-group > label{
        display: block;
        font-size: 18px;
        color: #000;
    }
    .custom-control-label{
        color: #000;
        font-size: 16px;
    }
    .form-control{
        height: 50px;
        background: #ecf0f4;
        border-color: transparent;
        padding: 0 15px;
        font-size: 16px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }
    .form-control:focus{
        border-color: #00bcd9;
        -webkit-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        -moz-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
    }
    textarea.form-control{
        height: 160px;
        padding-top: 15px;
        resize: none;
    }

    .btn{
        padding: .657rem .75rem;
        font-size: 18px;
        letter-spacing: 0.050em;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }

    .btn-primary {
        color: #fff;
        background-color: #00bcd9;
        border-color: #00bcd9;
    }

    .btn-primary:hover {
        color: #00bcd9;
        background-color: #ffffff;
        border-color: #00bcd9;
        -webkit-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        -moz-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
    }

    .btn-primary:focus, .btn-primary.focus {
        color: #00bcd9;
        background-color: #ffffff;
        border-color: #00bcd9;
        -webkit-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        -moz-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
    }

    .btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
    .show > .btn-primary.dropdown-toggle {
        color: #00bcd9;
        background-color: #ffffff;
        border-color: #00bcd9;
    }

    .btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
    .show > .btn-primary.dropdown-toggle:focus {
        -webkit-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        -moz-box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
        box-shadow: 0px 0px 20px rgba(0, 0, 0, .1);
    }


</style>
