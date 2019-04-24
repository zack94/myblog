$(function(){
    var toolbars = [["fullscreen","source","undo","redo","insertunorderedlist",
        "insertorderedlist","cleardoc","selectall","searchreplace","preview","date","time",
        "bold","italic","underline","fontborder","strikethrough","forecolor","backcolor",
        "superscript","subscript","justifyleft","justifycenter","justifyright","justifyjustify",
        "touppercase","tolowercase","directionalityltr","directionalityrtl","indent","removeformat",
        "formatmatch","autotypeset","customstyle","paragraph","rowspacingbottom","rowspacingtop",
        "lineheight","fontfamily","fontsize","imagenone","imageleft","imageright","imagecenter",
        "inserttable","deletetable","mergeright","mergedown","splittorows","splittocols","splittocells",
        "mergecells","insertcol","insertrow","deletecol","deleterow","insertparagraphbeforetable","charts","print","help"]];
    var ue = UE.getEditor('infoEditor',{
        toolbars: toolbars
    });

    //初始化编辑框内容
    // var htmlStr = $("#editorValue").val();
    var htmlStr = "${requestScope.article.article_content}";
    console.log(htmlStr);
    ue.ready(function() {
        ue.setContent(htmlStr, false);
    });
    $("textarea[type='checkbox']").prop("disabled",true)
})
function save(){
    var content= UE.getEditor('infoEditor').getContent();
    content = content.replace(new RegExp("<","g"),"<").replace(new RegExp(">","g"),">").replace(new RegExp("\"","g"),"");
    $("#editorValue").val(content);
    $("#ueform").submit();
}
