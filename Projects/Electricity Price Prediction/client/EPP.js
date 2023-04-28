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

    // Convert day and month to integers
    var dayIndex = parseInt(day.value);
    var monthIndex = parseInt(month.value) - 1; // Convert to 0-indexed

    // Define lists for day and month
    var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

    $.ajax({
        type: "POST",
        url: url,
        contentType: "application/json",
        data: JSON.stringify({
            day: dayIndex,
            month: monthIndex,
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

    // Display selected day and month in user interface
    del.innerHTML += "<p>Selected Day: " + days[dayIndex] + "</p>";
    del.innerHTML += "<p>Selected Month: " + months[monthIndex] + "</p>";
}