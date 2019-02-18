
function hideInputs(){
var num = document.getElementById("ship_num");
var input = document.getElementById("input")
    if(num.value == 5){
        input.style.display = "none"
    }
}

function disableButton() {
    var dis = document.querySelectorAll('.cell_button')
    dis.forEach(function(element){
        if (element.innerHTML != '(~)') {
            element.disabled = true
        }
    });
}

document.onkeyup = function (event) {

    var grid = document.getElementById('board')
    var nme_grid = document.getElementById('nme_board')

    if (event.which == 37 || event.keyCode == 37){
        grid.style.display = "block"
        nme_grid.style.display = "none"
    }

    if (event.which == 39 || event.keyCode == 39){
        grid.style.display = "none"
        nme_grid.style.display = "block"
    }
}


    