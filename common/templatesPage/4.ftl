<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" content="" />
    <meta name="viewport" content="width=device-width" />
    <script src="js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <title>走进你的世界</title> 
    <style type="text/css">
        body {
            background: #fff;
            margin: 0;
            
        }
        #main {
            position:absolute;
            background-image: url('img/heartWorld/0.jpg');
            background-repeat: no-repeat;
            background-position: center;
            z-index:1;
        }
        #top
        {
            position:absolute;
            z-index:2;
        }
        #bottom
        {
            position:absolute;
            z-index:3;
        }
        #left
        {   
            display:none;
            position:absolute;
            z-index:4;
        }
        #right
        {
            display:none;
            position:absolute;
            z-index:5;
        }
        #love
        {
            display:none;
            background-image: url('img/heartWorld/love.png');
            background-repeat: no-repeat;
            background-position: center;
            position:absolute;
            z-index:6;
        }
       
        #text
        {
            position:absolute;
            z-index:7;
            height:1.5em;
            font-size:1.5em;
            font-family:"微软雅黑";
            color:#FFAEBE;
            text-align:center;
        }
    </style>
    
    <script type="text/javascript">
    
        var height = document.documentElement.clientHeight;
        var width= document.documentElement.clientWidth;
        $(function () {
            //            var width = window.screen.availWidth
            //            var height = window.screen.availHeight
            $("body").css({ "width": width, "height": height });
            $("#main").css({ "width": width / 3, "height": height, "background-Size": "100% 100% ", "left": width / 3 });
            $("#love").css({ "width": width / 3, "height": width / 24, "top": "50%", "background-Size": "35% auto ", "left": width / 3 });
            $("#text").css({ "width": width / 3, "bottom": "40%", "left": width / 3 });
            $("#top").css({ "width": width / 3, "left": width / 3});
            $("#bottom").css({ "width": width / 3, "left": width / 3 });
            $("#left").css({ "width": width / 12, "height": width / 24, "left": width * 5 / 12, "top": "50%" });
            $("#right").css({ "width": width / 12, "height": width / 24, "left": width * 6 / 12, "top": "50%" });

            var margin1 = parseInt($("#top").css("height"));
            var margin2 = parseInt($("#left").css("height"));
            $("#top").css({ "top": height / 2 - margin1 });
            $("#bottom").css({ "bottom": height / 2 - margin1 });
            $("#left").css({ "margin-top": "-" + parseInt($("#left").css("height")) / 2 + "px" });
            $("#right").css({ "margin-top": "-" + parseInt($("#right").css("height")) / 2 + "px" });
            $("#love").css({ "margin-top": "-" + parseInt($("#love").css("height")) / 2 + "px" });
            //            $("#right").css({ "top": height / 2 + margin2 / 2 });
            
            $('#top').animate({ top: 0 }, 16000);
            $('#bottom').animate({ bottom: 0 }, 16000);

            setTimeout(zyfl, "3000");
            setTimeout(love, "11000");
        });
    window.onresize = function () {
        location.reload();
    }
    function zyfl() {
        $('#left').fadeIn(3000, function () {
            $('#left').animate({ left: width * 4 / 12 }, 10000);
        });
        $('#right').fadeIn(3000, function () {
            $('#right').animate({ left: width * 7 / 12 }, 10000);
        });
    }
    function love() {
        $('#love').fadeIn(5000, function () {
            $('#left').animate({ top: "40%" }, 2000);
            $('#right').animate({ top: "40%" }, 2000);
            $('#love').animate({ top: "40%" }, 2000);
            setTimeout("textticker()", "1000");
        });

    }
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
        $("#text").html(tl[x].substring(0, pos) + "_");
        if (pos++ == l) {
            pos = 0;
            setTimeout("textticker()", 1000); //控制两段话间的转换时间
            x++;
            if (x == max) {
                //x = 0;
                $("#text").html("我的爱，像天使一样守护者你❤");
            }
            l = tl[x].length;
        } else
            setTimeout("textticker()", 500);  //控制文字间的显示时间
    }
    </script>
</head>
<body>
    <div id="main" >
        &nbsp;
    </div>
    <img src="img/heartWorld/top01.png"  id="top"/>
    <img src="img/heartWorld/bottom01.png" id="bottom" />
    
    <img src="img/heartWorld/left.png"  id="left"/>
    <img src="img/heartWorld/right.png" id="right" />

    <div id="love">
    </div>
    
    <div id="text">
        
    </div>
</body>
</html>
