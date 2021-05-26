window.onload=function(){
	
	var ssitem=document.getElementsByClassName("ssitem");
	for (i=0 ;i<ssitem.length; i++) {
		ssitem[i].addEventListener("click",Affichercontenussitem);
	}
	}
	function Affichercontenussitem(){
	var contenu=this.parentElement.children[i].textContent;
	

if (contenu=="ACCEUIL") { 
 document.getElementById("acc").style.display="block";
 document.getElementById("listelivre").style.display="none";
 document.getElementById("reslivre").style.display="none";

    }
else if (contenu=="Lister Livre") {
	document.getElementById("acc").style.display="none"
 document.getElementById("listelivre").style.display="block";
 document.getElementById("reslivre").style.display="none";
}
else if (contenu=="Reserver Livre") {
	 document.getElementById("acc").style.display="none";
 
 document.getElementById("listelivre").style.display="none";
 document.getElementById("reslivre").style.display="block";
}

}