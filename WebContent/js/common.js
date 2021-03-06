boxheight(); //执行函数
function boxheight() { //函数：获取尺寸
    //获取浏览器窗口高度
    var winHeight = 0;
    if (window.innerHeight)
        winHeight = window.innerHeight;
    else if ((document.body) && (document.body.clientHeight))
        winHeight = document.body.clientHeight;
    //通过Document对body进行检测，获取浏览器可视化高度
    if (document.documentElement && document.documentElement.clientHeight)
        winHeight = document.documentElement.clientHeight;
    //DIV高度为浏览器窗口高度
    document.getElementById("Odiv").style.height = winHeight + "px";
    document.getElementById("Adiv").style.height = winHeight + "px";
    document.getElementById("Cdiv").style.height = winHeight + "px";
}
window.onresize = boxheight; //窗口或框架被调整大小时执行

$(document).ready(function () {
    var menuArray = $("#aside-menu>li")
    var secondMenuArray = $(".second-menu")
    var secondMenuItems = $(".second-menu>li")
    var commonIframe = $("#common-iframe")

    for (var i = 0; i < secondMenuItems.length; i++) {
        $(secondMenuItems[i]).on("click", function () {
            console.log(2)
            clearClass()
            $(this).addClass("li-active")
        })
    }

    function clearClass() {
        $("#aside-menu .li-active").removeClass("li-active")
    }

    $(menuArray[0]).on("click", function () {
        $(secondMenuArray[0]).slideToggle();
    })

    $(secondMenuItems[0]).on("click", function () {
        commonIframe.attr({
            src: "./employee.jsp"
        })
    })
    $(secondMenuItems[1]).on("click", function () {
        commonIframe.attr({
            src: "./attendance.jsp"
        })
    })
})
