<?php

$GLOBALS['THRIFT_ROOT'] = 'lib'; 

require_once 'gen-php/Types.php';
require_once 'gen-php/DeviceService.php';
require_once 'gen-php/ActionService.php';
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Exception/TException.php';
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Exception/TTransportException.php';    
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Transport/TTransport.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Transport/TSocket.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Protocol/TProtocol.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Protocol/TBinaryProtocol.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Transport/TBufferedTransport.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Type/TMessageType.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Factory/TStringFuncFactory.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/StringFunc/TStringFunc.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/StringFunc/Core.php';  
require_once $GLOBALS['THRIFT_ROOT'].'/Thrift/Type/TType.php';

use Thrift\Protocol\TBinaryProtocol;
use Thrift\Transport\TSocket;  
use Thrift\Transport\TSocketPool;  
use Thrift\Transport\TFramedTransport;  
use Thrift\Transport\TBufferedTransport;
use Thrift\Exception\TException;
use Thrift\Exception\TTransportException;

//Conexión con servidor

try {
  $socket = new TSocket('192.168.0.29', 9001);
  $transport = new TBufferedTransport($socket, 1024, 1024);
  $protocol = new TBinaryProtocol($transport);
  $client = new DeviceServiceClient($protocol);

  $transport -> open();

  $devs = $client->get_all_devices();

  $transport -> close();

} catch (TException $tx) {
  print 'TException: '.$tx->getMessage()."\n";
}

?>

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
            </div>
            <h3 class="page-subheader">Dispositivos</h3>

            <?php

            foreach ($devs as $dev) 
            {
              
            print '<div class="col-lg-3 col-md-4 col-xs-6 thumb thumbnail">
              <div class="thumbnail-border">
                <a class="device" href="edit_device.php">
                  <h1 class="device-name">'. $dev->name.'</h1>
                  <h5 class="device-ip">'. $dev->ip.'</h5>
                </a>

                <div class="options-container">
                  <a class="btn-column" href="edit_device.php">
                    <div>
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><br>
                      <span class="op-legend">Editar</span>
                    </div>
                  </a>
                  <a class="btn-column" href="#">
                    <div>
                      <span class="glyphicon glyphicon-indent-left" aria-hidden="true"></span><br>
                      <span class="op-legend">Explorar Acciones</span>
                    </div>
                  </a>
                  <a class="btn-column" href="#" onclick="return rem_device(\'El dispositivo\')">
                    <div>
                      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span><br>
                      <span class="op-legend">Eliminar</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>

            <div class="col-lg-3 col-md-4 col-xs-6 thumb thumbnail">
              <div class="thumbnail-border">
                <a class="device" href="#">
                  <h1 class="device-name">Another one</h1>
                  <h5 class="device-ip">192.168.0.15</h5>
                </a>

                <div class="options-container">
                  <a class="btn-column" href="#">
                    <div>
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span><br>
                      <span class="op-legend">Editar</span>
                    </div>
                  </a>
                  <a class="btn-column" href="#">
                    <div>
                      <span class="glyphicon glyphicon-indent-left" aria-hidden="true"></span><br>
                      <span class="op-legend">Explorar Acciones</span>
                    </div>
                  </a>
                  <a class="btn-column" href="edit_device.html" onclick="return rem_device(\'El dispositivo\')">
                    <div>
                      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span><br>
                      <span class="op-legend">Eliminar</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>';

            }

            ?>

            <div class="col-lg-3 col-md-4 col-xs-6 thumb thumbnail">
              <div class="thumbnail-border">
                <a class="btn-column" href="#">
                  <div class="add-device">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><br>
                    <span class="op-legend">Agregar Dispositivo</span>
                  </div>
                </a>
              </div>
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
    <script>
      function rem_device(id){
        return confirm("¿Seguro que quieres elimirar el dispositivo "+ id +"?");
      }
    </script>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
