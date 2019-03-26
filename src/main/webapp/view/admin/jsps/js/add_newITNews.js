function saveInfo(data) {
    var content = $("#news_content").val();
    var url = $("#news_url").val();
    var way = $("#news_way").val();
    var data = {
        content: content,
        url: url,
        way: way
    };
    $.ajax({
            url: "http://localhost:8080/blog/addITNewsInfo.action",
            type: "post",
            data: data,
            success: function () {
                alert("success!");
            },
            error: function () {
                alert("error");
            }
        }
    )
}