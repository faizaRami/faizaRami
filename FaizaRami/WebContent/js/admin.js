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
 document.getElementById("ajouE").style.display="none";
 document.getElementById("listelivre").style.display="none";
 document.getElementById("ajoulivre").style.display="none";

    }
else if (contenu=="Ajouter Etudiant ") { 
document.getElementById("acc").style.display="none";
 document.getElementById("ajouE").style.display="block";
 document.getElementById("listelivre").style.display="none";
 document.getElementById("ajoulivre").style.display="none";
    }
else if (contenu=="Ajouter Livre") {
	document.getElementById("acc").style.display="none";
 document.getElementById("ajouE").style.display="none";
 document.getElementById("listelivre").style.display="block";
 document.getElementById("ajoulivre").style.display="none";
}
else if (contenu=="Lister Livre") {
	 document.getElementById("acc").style.display="none";
 document.getElementById("ajouE").style.display="none";
 document.getElementById("listelivre").style.display="none";
 document.getElementById("ajoulivre").style.display="block";
}

}