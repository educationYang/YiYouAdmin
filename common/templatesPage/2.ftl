﻿<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <script src="js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title>I♥You</title> 
    <style type="text/css">
        body 
        {
            background: white;
            margin: 0;
        }

        #main {
            position:absolute;
            background-image: url('img/love/1.jpg');
            background-repeat: no-repeat;
            background-position: center;
            margin: 0px auto;
            z-index:2;
        }
        #bottom {
            position: absolute;
            background-image: url('img/love/1.jpg');
            background-repeat: no-repeat;
            background-position: center;
            margin: 0px auto;
            z-index: 1;
        }
        #text
        {
            position:absolute;
            z-index:3;
        }
        #text p
        {   
            position:absolute;
            bottom:0px;
            text-align:center;
            font-size:3em;
            line-height:1em;
            font-family:"微软雅黑";
            color:#FFAEBE;
           /* filter:alpha(opacity=70);
            -moz-opacity:0.7;
            opacity:0.7;-->8*/
        }
    </style>
    
    <script type="text/javascript">
        var max = 0;
        function textlist()  //自己的对象,存储字符串
        {
            max = textlist.arguments.length;
            for (i = 0; i < max; i++)
                this[i] = textlist.arguments[i];
        }
        tl = new textlist    //实际上是一个多维数组 tl[0]="想说的文字"其余类推
        (
                "${entity.bara}"
        );
        var x = 0; pos = 0;
        var l = tl[0].length;
        function textticker() {
            $("#text p").html(tl[x].substring(0, pos) + "_");
            if (pos++ == l) {
                pos = 0;
                setTimeout("textticker()", 1000); //控制两段话间的转换时间
                x++;
                if (x == max) {
                    //x = 0;
                    $("#text p").html("某某某,我爱你");
                    $('#text p').animate({ fontSize: "5em" }, 1000);
                }
                l = tl[x].length;
            } else
                setTimeout("textticker()", 500);  //控制文字间的显示时间
        }

        var it = 0
        var inspeed = 1000;
        var textspeed = 5000;
        var outspeed = 1;
        var ficTime = 500;
        var opacity = 1;
        var count = 5;
        var i=0;
        $(function () {
            var size = document.documentElement.clientHeight;
            var domWidth = document.documentElement.clientWidth;
            $("body").css({ "width": "100%", "height": size });
            $("#text").css({ "width": "100%", "height": size });
            $("#text p").css({ "left": (domWidth - size) / 2, "width": size });
            $("#main").css({ "width": "100%", "height": size, "background-Size": size });
            $("#bottom").css({ "width": "100%", "height": size, "background-Size": size });
            $("#bottom").css({ "background-image": "url('img/love/1.jpg')" });
            $('#main').fadeOut(outspeed, function () {
                $("#main").css({ "background-image": "url('img/love/2.jpg')" });
                $('#main').fadeIn(inspeed, function () {
                    $("#bottom").css({ "background-image": "url('img/love/2.jpg')" });
                    $('#main').fadeOut(outspeed, function () {
                        $("#main").css({ "background-image": "url('img/love/3.jpg')" });
                        $('#main').fadeIn(inspeed, function () {
                            $("#bottom").css({ "background-image": "url('img/love/3.jpg')" });
                            $('#main').fadeOut(outspeed, function () {
                                $("#main").css({ "background-image": "url('img/love/4.jpg')" });
                                $('#main').fadeIn(inspeed, function () {
                                    $("#bottom").css({ "background-image": "url('img/love/4.jpg')" });
                                    $('#main').fadeOut(outspeed, function () {
                                        $("#main").css({ "background-image": "url('img/love/5.jpg')" });
                                        $('#main').fadeIn(inspeed, function () {
                                            $("#bottom").css({ "background-image": "url('img/love/5.jpg')" });
                                            $('#main').fadeOut(outspeed, function () {
                                                $("#main").css({ "background-image": "url('img/love/6.jpg')" });
                                                $('#main').fadeIn(inspeed);
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });

            textticker();
            //            $("#text p").html("让时间见证我的心");
            //            $("#text").fadeIn(textspeed / 2, function () {
            //                $("#text").fadeOut(textspeed / 2, function () {
            //                    $("#text p").html("从开始的萌生爱意");
            //                    $("#text").fadeIn(textspeed / 2, function () {
            //                        $("#text").fadeOut(textspeed / 2, function () {
            //                            $("#text p").html("到最后的");
            //                            $("#text").fadeIn(textspeed / 2, function () {
            //                                $("#text").fadeOut(textspeed / 2, function () {
            //                                    $("#text p").html("你是我唯一的爱");
            //                                    $("#text").fadeIn(textspeed / 2, function () {
            //                                        $("#text").fadeOut(textspeed / 2, function () {
            //                                            $("#text p").html("时间见证我对你的爱");
            //                                            $("#text").fadeIn(textspeed / 2, function () {
            //                                                $("#text").fadeOut(textspeed / 2, function () {
            //                                                    var love = "某某某,我爱你"
            //                                                    $("#text p").html(love);
            //                                                    $("#text").fadeIn(inspeed, function () { $('#text p').animate({ fontSize: "5em" }, 1000); });
            //                                                   
            //                                                });
            //                                            });
            //                                        });
            //                                    });
            //                                });
            //                            });
            //                        });
            //                    });
            //                });
            //            });

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
    </div>
    <div id="text">
        <p></p>
    </div>
</body>
</html>
