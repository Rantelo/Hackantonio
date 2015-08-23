<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lasien tocuatro</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/custom.css" rel="stylesheet">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Page Content -->
    <div class="container">

        <div class="row">

          <div class="col-lg-12">
              <h1 class="page-header">Lasien Tocuatro</h1>
              <a href="Home.php" class="btn btn-default col-lg-2 col-md-2 col-xs-4" role="button">Regregar a dispositivos</a>
          </div>
          <div class="col-lg-12 text-center v-center">
            <div id="edit-device-container">
              <span class="normal">Cambia el nombre de</span><span class="big">192.168.0.19</span>
            </div>
            <form class="col-lg-12" data-toggle="validator" role="form" novalidate="true" onSubmit="return validate()">
              <div class="input-group" style="width:340px;text-align:center;margin:0 auto;">
                <input id="device-name" class="form-control input-lg" title="Ingresa un nuevo nombre para este dispositivo" placeholder="Nombre Previo" type="text" required >
                <span class="input-group-btn"><button type="submit" class="btn btn-lg btn-primary">Submit</button></span>
              </div>
            </form>
            <script>
              function validate() {
                  var name_value = document.getElementById("device-name").value;
                  if (name_value == null || name_value.trim() == "") {
                    alert("Debes proporcionar un nombre para este dispositivo") 
                    return false;
                  } else if (name_value.trim().length < 3) {
                    alert("La longitud del nombre debe ser mayor a 2 caracteres") 
                    return false;
                  } else {
                    return true
                  }
              } 
            </script>
          
          </div>
        </div>
        <hr>
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; HackAntonioBuenavista 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
