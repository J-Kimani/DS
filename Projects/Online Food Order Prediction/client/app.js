function onClickedPredictReorder() {
    console.log("Predict Reorder button clicked");
    var age = document.getElementById("age");
    var gender = document.getElementById("gender");
    var marital = document.getElementById("marital");
    var occupation = document.getElementById("occupation");
    var income = document.getElementById("income");
    var qualification = document.getElementById("edu");
    var fam_size = document.getElementById("fam");
    var pin = document.getElementById("pin");
    var feedback = document.getElementById("review");
    var del = document.getElementById("uidel");
  
    var url = "http://127.0.0.1:5000/order_again";

    $.post(url, {
        age: parseInt(age.value),
        gender: parseInt(gender.value),
        marital: parseInt(marital.value),
        occupation: parseInt(occupation.value),
        income: parseInt(income.value),
        qualification: parseInt(qualification.value),
        fam_size: parseInt(fam_size.value),
        pin: parseInt(pin.value),
        feedback: parseInt(feedback.value)
        
    },function(data, status) {
        console.log(data['OR']);
    //    // function replace(key, val){
    //         if(typeof val ===  {
    //             "order again?": "Yes"
    //         }){
    //             return 'YES'
    //         }else{
    //             return 'NO'
    //         }
    //     }

        del.innerHTML = "<h2>" + data['OR'] + "</h2>";
        console.log(status);
    });
  }
 