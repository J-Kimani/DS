function onClickedPredict() {
    console.log("Predict Price button clicked");
    var day = document.getElementById("day");
    var month = document.getElementById("month");
    var forcastwind = document.getElementById("wind_for");
    var SLEA = document.getElementById("system_load_for");
    var SMPEA = document.getElementById("price_for");
    var temp = document.getElementById("temp");
    var wind = document.getElementById("wind_for");
    var co2 = document.getElementById("Co2_int");
    var actualwind = document.getElementById("wind");
    var load = document.getElementById("load");
    var del = document.getElementById("uidel");
  
    var url = "http://127.0.0.1:5000/predict";

    $.ajax({
        type: "POST",
        url: url,
        contentType: "application/json",
        data: JSON.stringify({
            day: parseInt(day.value),
            month: parseInt(month.value),
            forcastwind: parseFloat(forcastwind.value),
            SLEA: parseFloat(SLEA.value),
            SMPEA: parseFloat(SMPEA.value),
            temp: parseFloat(temp.value),
            wind: parseFloat(wind.value),
            co2: parseFloat(co2.value),
            actualwind: parseFloat(actualwind.value),
            load: parseFloat(load.value)
        }),
        success: function(data, status) {
            console.log(data);
            console.log(data.price);
            del.innerHTML = "<h2>" + data.price + "</h2>";
            console.log(status);
        }
    });
  }
