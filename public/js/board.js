
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

function colorMod(){
    var button_set = document.querySelectorAll('.cell_button')
    var other_button_set = document.querySelectorAll('.my_button')

    other_button_set.forEach(function(element){
        if (element.innerHTML == '(C)'){
            element.style.color = 'blue';
        };

        if (element.innerHTML == '(B)'){
            element.style.color = 'blue';
        };

        if (element.innerHTML == '(D)'){
            element.style.color = 'blue';
        };

        if (element.innerHTML == '(P)'){
            element.style.color = 'blue';
        };

        if (element.innerHTML == 'O'){
            element.style.color = 'yellow'
        };
            
        if (element.innerHTML == 'X'){
            element.style.color = 'red'
        };

    });

    button_set.forEach(function(element){
        if (element.innerHTML == 'O'){
        element.style.color = 'yellow'
        };
        if (element.innerHTML == 'X'){
            element.style.color = 'red'
        };
    });
}


function showModal(){
    var modal = document.getElementById('myModal');
    modal.style.display = "block";   
}

function onModal(){
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
}

function size(){
    var size = document.getElementById('size');
    var table = document.getElementById('table');
    var nme_table = document.getElementById('nme_table');
       
    if (size.value == 12){
        table.style.zoom = '100%';
        nme_table.style.zoom = '100%';

    }

    if (size.value == 24){
        table.style.zoom = '55%';
        nme_table.style.zoom = '55%';
    }

}



