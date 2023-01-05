function onclickpred(){
    console.log("Stress Detection Button Clicked");
    var user = document.getElementById("feeling");

    var url = "http://127.0.0.1:5000/stress";
    var userValue = user.value

    $.post(url, {
        user: userValue
    }, function(data, status){
        console.log(data.St);
        del.innerHTML = "<h2>" + data.St + "</h2>";
        console.log(status)
    });
}