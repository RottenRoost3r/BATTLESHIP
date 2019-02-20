
function hideInputs(){
var num = document.getElementById("ship_num");
var input = document.getElementById("input")
    if(num.value == 5){
        input.style.display = "none"
    }
}

function disableButton() {
    var dis = document.querySelectorAll('.cell_button')
    var other = document.querySelectorAll('.my_button')
    var shipnum = document.getElementById('ship_num')
    var ender = document.getElementById('ending')
    
    dis.forEach(function(element){
        if (element.innerHTML != '(~)') {
            element.disabled = true
        }
        
        if (ender.innerText == "YOU WIN!" || ender.innerText == "YOU LOSE!"){
            element.disabled = true
        }
    });

    other.forEach(function(element){
        if (element.innerHTML != '(~)'){
            element.disabled = true
        }

        if (shipnum.value == 5){
            element.disabled = true
        }
    });
}



    