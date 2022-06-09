// function validate(){
//   let x = document.getElementById("ship").value;

//   if (isNaN(x) || x < 0 || x > 73) {
//     alert("Invalid City!!")
//     return false;
//   }
//   return true;
  
// }

function onClickedPredictDelivery() {
    console.log("Predict Delivery button clicked");
    var city = document.getElementById("ship");
    var sku = document.getElementById("SKU");
    var quantity = document.getElementById("quantity");
    var total = document.getElementById("total");
    var fee = document.getElementById("Fee");
    var cod = document.getElementById("Cod");
    var del = document.getElementById("uidel")
  
    var url = "http://127.0.0.1:5000/predict_delivery";

    $.post(url, {
        city: parseInt(city.value),
        sku: parseInt(sku.value),
        quantity: parseInt(quantity.value),
        total: parseFloat(total.value),
        fee: parseFloat(fee.value),
        cod: parseInt(cod.value)
        
    },function(data, status) {
        console.log(data.delivery);
        del.innerHTML = "<h2>" + data.delivery + "</h2>";
        console.log(status);
    });
  }
  
  