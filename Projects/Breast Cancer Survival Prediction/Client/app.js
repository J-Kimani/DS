
function getgend(){
    var gender = document.getElementsByName("gender")
    for(var i in gender) {
        if(gender[i].checked) {
            return parseInt(i);
        }
      }
      return -1;
}
function getts(){
    var ts = document.getElementsByName("ts")
    for(var i in ts) {
        if(ts[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}
function gethist(){
    var Histology = document.getElementsByName("histo")
    for(var i in Histology) {
        if(Histology[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}
function geter(){
    var er = document.getElementsByName("er")
    for(var i in er) {
        if(er[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}
function getpr(){
    var pr = document.getElementsByName("pr")
    for(var i in pr) {
        if(pr[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}
function gether2(){
    var her2 = document.getElementsByName("her2")
    for(var i in her2) {
        if(her2[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}
function getst(){
    var st = document.getElementsByName("st")
    for(var i in st) {
        if(st[i].checked) {
            return parseInt(i)+1;
        }
      }
      return -1;
}




function onclickpredsurv() {
    console.log("Predict Survival button clicked");
    var age = document.getElementById("Age");
    var gender = getgend();
    var p1 = document.getElementById("prot1");
    var p2 = document.getElementById("prot2");
    var p3 = document.getElementById("prot3");
    var p4 = document.getElementById("prot4");
    var ts = getts();
    var Histology = gethist();
    var er = geter();
    var pr = getpr();
    var her2 = gether2();
    var st = getst();


    var url = "http://127.0.0.1:5000/pred_survival";

    $.post(url, {
        age: parseInt(age.value),
        gender: gender,
        p1: parseFloat(p1.value),
        p2: parseFloat(p2.value),
        p3: parseFloat(p3.value),
        p4: parseFloat(p4.value),
        ts: ts,
        Histology: Histology,
        er: er,
        pr: pr,
        her2: her2,
        st: st
        

    },function(data, status) {
        console.log(data.PS);
        del.innerHTML = "<h2>" + data.PS + "</h2>";
        console.log(status);
    });
  }