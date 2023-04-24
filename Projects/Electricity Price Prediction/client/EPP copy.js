$(document).ready(function(){
    $('#formsubmit').on('click', function(){
        var day = $('#day').val();
        var month = $('#month').val();
        var forcastwind = $('#wind_for').val();
        var SLEA = $('#system_load_for').val();
        var SMPEA = $('#price_for').val();
        var temp = $('#temp').val();
        var wind = $('#wind_for').val();
        var Co2_int = $('#Co2_int').val();
        var actualwind = $('#wind').val();
        var load = $('#load').val();
        
        var data = {
            'day': day,
            'month': month,
            'forcastwind': forcastwind,
            'SLEA': SLEA,
            'SMPEA': SMPEA,
            'temp': temp,
            'wind': wind,
            'Co2_int': Co2_int,
            'actualwind': actualwind,
            'load': load
        };
        
        $.ajax({
            url: 'http://127.0.0.1:5000/predict',
            type: 'POST',
            data: JSON.stringify(data),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function(response){
                console.log(response);
                $('#uidel h2').html("Predicted Bill: " + response['predicted_bill'].toFixed(2));
            },
            error: function(error){
                console.log(error);
                alert("Error: " + error.responseText);
            }
        });
    });
});
