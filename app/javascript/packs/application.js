import "bootstrap";

var keywords = ["wedding", "party", "weekend escape", "festival"];
var count = 1;
setInterval(function(){
    $("span.keyword").fadeOut(400, function(){
        $(this).html(keywords[count]);
        count++;
        if(count == keywords.length)
            count = 0;
        $(this).fadeIn(400);
    });
}, 4000);
