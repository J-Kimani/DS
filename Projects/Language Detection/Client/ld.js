function onclickpred(){
    console.log("Stress Detection Button Clicked");
    var user = document.getElementById("say");

    var url = "http://127.0.0.1:5000/detect";
    var userValue = user.value

    $.post(url, {
        user: userValue
    }, function(data, status){
        console.log(data.Ld);
        del.innerHTML = "<h2>" + data.Ld + "</h2>";
        console.log(status)
    });
}