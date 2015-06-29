$(function(){
$('.game-item').each(function(i, obj) {
    var splitted = obj.id.split("-");
    var num = parseInt(splitted[1]);
    $(this).click(function() {
        location.href='/game/' + num;
    });
    console.log("dupa");
});
});
