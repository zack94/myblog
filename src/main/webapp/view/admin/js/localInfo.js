

window.onload = function() {
    var appName = navigator.appName; //浏览器的正式名称
    var appVersion = navigator.appVersion; //浏览器的版本号
    var cookieEnabled = navigator.cookieEnabled; // 返回用户浏览器是否启用了cookie
    var cpuClass = navigator.cpuClass; //返回用户计算机的cpu的型号，通常intel芯片返回"x86"（火狐没有）

    var mimeType = navigator.mimeTypes; // 浏览器支持的所有MIME类型的数组
    var platform = navigator.platform; // 浏览器正在运行的操作系统平台，包括Win16(windows3.x)
    //   Win32(windows98,Me,NT,2000,xp),Mac68K(Macintosh 680x0)
    //     和ＭacPPC(Macintosh PowerPC)
    var plugins = navigator.plugins; //  安装在浏览器上的所有插件的数组
    var userLanguage = navigator.userLanguage; // 用户在自己的操作系统上设置的语言（火狐没有）
    var userAgent = navigator.userAgent; //包含以下属性中所有或一部分的字符串：appCodeName,appName,appVersion,language,platform
    var systemLanguage = navigator.systemLanguage; // 用户操作系统支持的默认语言（火狐没有）



    var info = "<table>";
    info += "<tr><td>浏览器属性信息：</td><td>" + userAgent + "</td></tr>";
    info += "<tr><td>浏览器的正式名称：</td><td>" + appName + "</td></tr>";
    info += "<tr><td>浏览器的版本号：</td><td>" + appVersion + "</td></tr>";
    info += "<tr><td>浏览器的是否启用了cookie：</td><td>" + cookieEnabled + "</td></tr>";
    info += "<tr><td>屏幕分辨率高度：</td><td>" + window.screen.height + "</td></tr>";
    info += "<tr><td>屏幕分辨率宽度：</td><td>" + window.screen.width + "</td></tr>";
    info += "<tr><td>颜色质量：</td><td>" + window.screen.colorDepth + "位</td></tr>";
    info += "</table>";
    document.getElementById("info1").innerHTML = info;
    return info;
}

//判断是否IE
function isIe() {
    var i = navigator.userAgent.toLowerCase().indexOf("msie");
    return i >= 0;
}
//判断是否firefox
function isFireFox() {
    var i = navigator.userAgent.toLowerCase().indexOf("firefox");
    return i >= 0;
}
//获取插件所有的名称
function getPluginName() {
    var info = "";
    var plugins = navigator.plugins;
    if (plugins.length > 0) {
        for (i = 0; i < navigator.plugins.length; i++) {
            info += navigator.plugins[i].name + ";";
        }
    }
    return info;
}

