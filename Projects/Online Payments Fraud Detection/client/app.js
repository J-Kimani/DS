function getBHKValue() {
    var uiBHK = document.getElementsByName("uiBHK");
    for(var i in uiBHK) {
      if(uiBHK[i].checked) {
          return parseInt(i);
      }
    }
    return -1; // Invalid Value
}
  

function onClickedPredictFraud() {
    console.log("Predict Fraud button clicked");
    var step = document.getElementById("Step");
    var type = getBHKValue();
    var amount = document.getElementById("Amount");
    var old_origin = document.getElementById("oldorigin");
    var new_origin = document.getElementById("neworigin");
    var old_dest = document.getElementById("olddest");
    var new_dest = document.getElementById("newdest");
    var del = document.getElementById("uidel");

  
    var url = "http://127.0.0.1:5000/detect_fraud";

    $.post(url, {
        step: parseInt(step.value),
        type: type,
        amount: parseFloat(amount.value),
        old_origin: parseFloat(old_origin.value),
        new_origin: parseFloat(new_origin.value),
        old_dest: parseFloat(old_dest.value),
        new_dest: parseFloat(new_dest.value)

    },function(data, status) {
        console.log(data.Fr);
        del.innerHTML = "<h2>" + data.Fr + "</h2>";
        console.log(status);
    });
  }