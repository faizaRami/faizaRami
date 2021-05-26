<%@page import="mymodels.Personne"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myservices.servicelivre"%>
<%@page import="myservices.servicecategorie"%>
<%@page import="myservices.servicepersonne"%>
<%@page import="mymodels.Livre"%>
<%@page import="mymodels.Categorie"%>
<%@page import="mydao.daocategorie"%>
<% Personne p = (Personne)session.getAttribute("personne"); 
if(p==null){
	response.sendRedirect("http://localhost:8282/faizaRami/authentification");

}else{

%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>MYBOOK page d'admin</title>
  <script type="text/javascript" src="js/admin.js"></script>
  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  <script src="lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="admin.jsp" class="logo"><b>MY<span>BOOK</span></b></a>
      <!--logo end-->
      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="authentification.jsp">Deconnexion</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="img/ui-sam.jpg" class="img-circle" width="80"></a></p>
          <h5 class="centered"><%=p.getNom()+" "+p.getPrenom() %></h5>
          <li class="mt">
            <a class="active" >
              <i class="fa fa-dashboard"></i>
              <span class="ssitem">ACCEUIL</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-user"></i>
              <span class="ssitem">Ajouter Etudiant</span>
              </a>
       
        
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-plus"></i>
              <span class="ssitem">Ajouter Livre</span>
              </a>
            
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span class="ssitem">Lister Livre</span>
              </a>
            
         </li> 
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
       
        
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
  <!--main content   start-->
			 <section id="main-content">
		      <section class="wrapper">
		        <h3 id="acc"><i class="fa fa-angle-right"></i> Form Ajouter Etudiant</h3>
		        <!-- BASIC FORM VALIDATION -->
		        <div class="row mt" id="ajouE">
		          <div class="col-lg-12">
		            <h4  ><i class="fa fa-angle-right"></i>Ajouter Etudiant</h4>
		            <div class="form-panel">
		              <form role="form" class="form-horizontal style-form" action="Inscription" method="post">
			            <div class="form-group has-success">
		                  <label class="col-lg-2 control-label" >NOM Etudiant</label>
		                  <div class="col-lg-10">
		                    <input type="text" placeholder="" id="f-name" class="form-control" name="nom">
		                    <p class="help-block"></p>
		                  </div>
		                </div>
		                 <div class="form-group has-success">
		                  <label class="col-lg-2 control-label">Prenom Etudiant</label>
		                  <div class="col-lg-10">
		                    <input type="text" placeholder="" id="f-name" class="form-control" name="prenom">
		                    <p class="help-block"></p>
		                  </div>
		                </div>
		                 <div class="form-group has-success">
		                  <label class="col-lg-2 control-label">Email Etudiant</label>
		                  <div class="col-lg-10">
		                    <input type="email" placeholder="" id="f-name" class="form-control" name="email">
		                    <p class="help-block"></p>
		                  </div>
		                </div>
		                 <div class="form-group has-success">
		                  <label class="col-lg-2 control-label">Mot de passe Etudiant</label>
		                  <div class="col-lg-10">
		                    <input type="password" placeholder="" id="f-name" class="form-control" name="mdp">
		                    <p class="help-block"></p>
		                  </div>
		                </div>
		                <div class="form-group">
		                  <div class="col-lg-offset-2 col-lg-10">
		                    <button class="btn btn-theme" type="submit">Ajouter</button>
		                  </div>
		                </div>
		              </form>
		            </div>
		            <!-- /form-panel -->
		          </div>
		          <!-- /col-lg-12 -->
		          
		            <div class="row mt" id="listelivre">
		          <div class="col-md-12  mt"  >
		            <div class="content-panel">
		              <% ArrayList<Livre> livres = servicelivre.listelivre(); %>
		              <table class="table table-hover">
		                <h4> <i class="fa fa-angle-right"></i> Liste des livres</h4>
		                <hr>
		                <thead>
		                  <tr>
		                    <th>#</th>
		                    <th>ISBN</th>
		                    <th>TITLE</th>
		                    <th>GENRE</th>
		                    <th>ANNEE EDITION </th>
		                    <th>CATEGORIE</th>
		                    <th>AUTEUR</th>
		                  </tr>
		                </thead>
		                <tbody>
		                 <%for(Livre l :livres){
		                                                            	%>
		                  <tr>
		                    <td><%=l.getId() %></td>
		                    <td><%=l.getIsbn() %></td>
		                    <td><%=l.getTitre() %></td>
		                    <td><%=l.getGenre() %></td>
		                    <td><%=l.getAnnee_edition() %></td>
		                     <td><%=l.getCategorie().getNom() %></td>
		                    <td><%=l.getAuteur().getNom()+""+l.getAuteur().getPrenom() %></td>
		                  </tr>
		          		 <%} %>
		                </tbody>
		              </table>
		            </div>
		          </div>  
		          </div>
		          <br>
		          <!-- /col-md-12 -->
		          	        
        <!-- *************************************************************************************** -->
         <div class="row mt" id="ajoulivre">
          <div class="col-lg-12">
            <h4><i class="fa fa-angle-right"></i> veuillez saisir les donnees de votre Livre:</h4>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" id="signupForm" method="post" action="livre">
                  <div class="form-group ">
                    <label for="firstname" class="control-label col-lg-2">ISBN</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="firstname" name="isbn" type="number" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="lastname" class="control-label col-lg-2">Titre</label>
                    <div class="col-lg-10">
                      <input class=" form-control" id="lastname" name="titre" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="username" class="control-label col-lg-2">Genre</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="username" name="genre" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="username" class="control-label col-lg-2">Description</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="password" name="description" type="text" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="confirm_password" class="control-label col-lg-2">Annee Edition</label>
                    <div class="col-lg-10">
                      <input class="form-control " id="confirm_password" name="ae" type="number" />
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="username" class="control-label col-lg-2">Categorie</label>
                    <div class="col-lg-9">
                    <%ArrayList<Categorie> categories=servicecategorie.listecategorie(); %>
                      <select class="form-control" name="">
                      <%for(Categorie c:categories){%>
		                  <option><%=c.getNom() %></option>
		                  <%} %>
		                </select>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="username" class="control-label col-lg-2">Categorie</label>
                    <div class="col-lg-9">
                    <%ArrayList<Personne> auteurs=servicepersonne.listeauteurs(); %>
                      <select class="form-control" name="">
                      <%for(Personne a:auteurs){%>
		                  <option><%=a.getNom() %></option>
		                  <%} %>
		                </select>
                    </div>
                  </div>
                 
                </form>
              </div>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>
         <!-- /row -->
        <!-- ******************************************************************************************** -->
		      </div>
		     </section>
		        </section>
		
    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
     <div class="text-center">
        <p>
          &copy; Copyrights <strong>MYBOOK</strong>. All Rights Reserved
        </p>
        <div class="credits">
          <!--
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
          -->
          Created with Faiza Rami Application/2021<a href="https://templatemag.com/">MYBOOK</a>
        </div>
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer>
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>

  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>
  <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="lib/sparkline-chart.js"></script>
  <script src="lib/zabuto_calendar.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
      var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Welcome to Dashio!',
        // (string | mandatory) the text inside the notification
        text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo.',
        // (string | optional) the image to display on the left
        image: 'img/ui-sam.jpg',
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        //time: 8000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
      });

      return false;
    });
  </script>
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.php?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
</body>

</html>
<%}%>