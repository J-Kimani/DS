
function onClickedPredictImpression() {
    console.log("Predict Delivery button clicked");
    var save = document.getElementById("saves");
    var comment = document.getElementById("comments");
    var share = document.getElementById("shares");
    var like = document.getElementById("likes");
    var prof_visit = document.getElementById("visits");
    var follow = document.getElementById("follows");
    var del = document.getElementById("uidel")
  
    var url = "http://127.0.0.1:5000/predict_impression";

    $.post(url, {
        save: parseInt(save.value),
        comment: parseInt(comment.value),
        share: parseInt(share.value),
        like: parseInt(like.value),
        prof_visit: parseInt(prof_visit.value),
        follow: parseInt(follow.value)
        
    },function(data, status) {
        console.log(data.Impressions);
        del.innerHTML = "<h2>" + data.Impressions + "</h2>";
        console.log(status);
    });
  }