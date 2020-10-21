/**
 * 
 */

function onloadFunction(pageStart,contentSize,totalRecords){
		if(pageStart<1){
			let first = document.getElementById("first");
			first.disabled = true;
			first.classList.add("isDisabled");
			let prev = document.getElementById("prev");
			prev.disabled = true;
			prev.classList.add("isDisabled");
		}
		if((pageStart+contentSize)>=totalRecords ||(pageStart=0 && contentSize==0 )){
			let last = document.getElementById("last");
			last.disabled = true;
			last.classList.add("isDisabled");
			let next = document.getElementById("next");
			next.disabled = true;
			next.classList.add("isDisabled");
		}
}



function changePageSize(size){
	var url="/admin_yourmart/products?pageSize="+size+"&pageStart="+0;
	document.location.href=url;
}


function searchSeller(data){
	var url="/admin_yourmart/products?&pageStart="+0+"&searchParam="+data;
	document.location.href=url;
}

function changePage(type,pageStart,pageSize,totalRecords){
	console.log(type,pageStart,pageSize,totalRecords)
	var url = "/admin_yourmart/products";
	if(type=="first"){
		url = url + "?&pageStart=0";
	}
	if(type=="prev"){
		let start = pageStart-pageSize;
		if(start<0)
			start = 0;
		url = url + "?&pageStart=" + start;
	}
	if(type=="next"){
		let start = pageStart+pageSize;
		url = url + "?&pageStart="+ start;
	}
	if(type=="last"){
		let start = Math.floor(totalRecords/pageSize) * pageSize;
		if(start==totalRecords)
			start -= pageSize;
		url = url + "?&pageStart="+ start;
	}
	document.location.href=url;
}

function sortTale(type){
	console.log(type)
	var url="/admin_yourmart/products?orderBy="+type;
	document.location.href=url;
}

