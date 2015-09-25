<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <script src="js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title>四季</title> 
    <style type="text/css">
        body {
            margin: 0;
            overflow:auto;
        }

        #main {
            position:absolute;
            background-image: url('img/season/8.jpg');
            background-repeat: no-repeat;
            background-position: center;
            margin: 0px auto;
            z-index:5;
        }
        #bottom {
            position: absolute;
            background-image: url('img/season/1.jpg');
            background-repeat: no-repeat;
            background-position: center;
            margin: 0px auto;
            z-index: 2;
        }
        
        #text {
            position:absolute;
            margin: 0px auto;
            z-index:5;
           
        }
        #text div
        {
            display:none;
            float:left;
            vertical-align:center;
            font-size:1.8em;
            color:#fff;
            font-family:"微软雅黑";
            font-weight:bold;
            
        }
        
        #text div p
        { 
            text-align:right;
        }
    </style>
    
    <script type="text/javascript">

        var inspeed = 3000;
        var outspeed = 1;
        var ficTime = 500;
        var opacity = 1;
        var count = 5;
        $(function () {
            var sizeWidth = document.documentElement.clientWidth;
            var sizeHight = document.documentElement.clientHeight;
            if (sizeWidth / sizeHight > 1.5) {
                $("#main").css({ "width": "100%", "height": sizeHight, "background-Size": " auto 100%" });
                $("#bottom").css({ "width": "100%", "height": sizeHight, "background-Size": " auto 100%" });
                //alert($("#bottom").css("background-Size"));
                $("#text").css({ "width": sizeHight * 1.5, "height": sizeHight, "left": (sizeWidth - sizeHight * 1.5) / 2 });
                $("#text div").css({ "width": sizeHight * 3 / 8, "height": sizeHight });
                $("#text div p").css({ "width": sizeHight * 2 / 24, "height": sizeHight * 0.8, "margin-top": sizeHight * 0.2 });

            } else {
                $("#main").css({ "width": "100%", "height": sizeHight, "background-Size": "  100% auto" });
                $("#bottom").css({ "width": "100%", "height": sizeHight, "background-Size": "  100% auto" });
                $("#text").css({ "width": sizeWidth, "height": sizeWidth * 2 / 3, "top": (sizeHight - sizeWidth * 2 / 3) / 2 });

                $("#text").css({ "width": sizeWidth, "height": sizeWidth * 2 / 3, "top": (sizeHight - sizeWidth * 2 / 3) / 2 });
                $("#text div").css({ "width": sizeWidth/4, "height": sizeHight });
                $("#text div p").css({ "width": sizeWidth / 16, "height": (sizeWidth * 2 / 3) * 0.8, "margin-top": (sizeWidth * 2 / 3) * 0.2 });
            }
            $("body").css({ "width": "100%", "height": sizeHight });

            //return;
            $("#bottom").css({ "background-image": "url('img/season/1.jpg')" });
            $('#main').fadeOut(outspeed, function () {
                $("#main").css({ "background-image": "url('img/season/2.jpg')" });
                $('#main').fadeIn(inspeed, function () {
                    $("#bottom").css({ "background-image": "url('img/season/2.jpg')" });

                    $('#txt1').show(inspeed);
                    $('#main').fadeOut(outspeed, function () {
                        $("#main").css({ "background-image": "url('img/season/3.jpg')" });
                        $('#main').fadeIn(inspeed, function () {
                            $("#bottom").css({ "background-image": "url('img/season/3.jpg')" });

                            $('#main').fadeOut(outspeed, function () {
                                $("#main").css({ "background-image": "url('img/season/4.jpg')" });
                                $('#main').fadeIn(inspeed, function () {
                                    $("#bottom").css({ "background-image": "url('img/season/4.jpg')" });

                                    $('#txt2').show(inspeed);
                                    $('#main').fadeOut(outspeed, function () {
                                        $("#main").css({ "background-image": "url('img/season/5.jpg')" });
                                        $('#main').fadeIn(inspeed, function () {
                                            $("#bottom").css({ "background-image": "url('img/season/5.jpg')" });
                                            $('#main').fadeOut(outspeed, function () {
                                                $("#main").css({ "background-image": "url('img/season/6.jpg')" });
                                                $('#main').fadeIn(inspeed, function () {
                                                    $("#bottom").css({ "background-image": "url('img/season/6.jpg')" });

                                                    $('#txt3').show(inspeed);
                                                    $('#main').fadeOut(outspeed, function () {
                                                        $("#main").css({ "background-image": "url('img/season/7.jpg')" });
                                                        $('#main').fadeIn(inspeed, function () {
                                                            $("#bottom").css({ "background-image": "url('img/season/7.jpg')" });
                                                            $('#main').fadeOut(outspeed, function () {
                                                                $("#main").css({ "background-image": "url('img/season/8.jpg')" });
                                                                $('#main').fadeIn(inspeed, function () {
                                                                    $('#txt4').show(inspeed);
                                                                });

                                                            });
                                                        });
                                                    });
                                                });
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });

            });

        });
    window.onresize = function () {
        location.reload();
    }
    </script>
</head>
<body>
    <div id="bottom">
        &nbsp;
    </div>
    <div id="main" >
        &nbsp;
    </div>
    <div id="text" >
        <div id="txt1"><p style="color:#85DE94">${entity.bara}</p></div>
        <div id="txt2"><p style="color:#DE9485">${entity.barb}</p></div>
        <div id="txt3"><p style="color:#D0B833">${entity.barc}</p></div>
        <div id="txt4"><p style="color:#B8CCF8">${entity.bard}</p></div>
    </div>
</body>
</html>
