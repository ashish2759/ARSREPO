history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    }

function onlyAlphaAndNumber(e) {
	var ch = e.which || e.keycode;
	if (!((ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122) || (ch == 32) || (ch>=48 && ch<=57))) {
		e.preventDefault();
	}
}


function restrictDate() {
	var date = new Date();
	var t = date.toISOString().substring(0, 10);
	document.getElementById("date1").setAttribute("min", t);
}


function isSame() {
	var source = document.getElementById("source").value;
	var destination = document.getElementById("destination").value;
	if (source === destination){
		document.getElementById("notsame").innerHTML="Source and Destination should be different";
		//alert('Source and Destination City cannot be similar');
		document.getElementById("source").value='';
		document.getElementById("destination").value='';
		return false;
	}
	else {
		return true;
	}

}
