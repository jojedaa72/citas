<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
		<!-- Optimizar el sitio en dispositivos móviles -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Importar CSS de Bootstrap  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- Importar Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Importar Funciones JavaScript de Bootstrap -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
	    <div class="row">
<div class="text-center col-md-9 col-md-offset-3 ">
    	<img class="img-responsive" src="img/funday.jpg" alt="Family Fun Day">
	</div>

	    	<div class="col-sm-5 col-md-5 col-sm-offset-3 col-md-offset-4">

	            	<div class="account-wall">
						<form class="form-horizontal" method="POST" action="ingreso/valida.asp">
            
			                <div class="form-group">
				                <label class="col-sm-6 col-md-12" for="exampleInputPassword1">Usuario:</label>
				                <div class="col-sm-10 col-md-10" >
					                <input type="text" name="txtUsr" class="form-control input-lg" placeholder="" required autofocus>
				                </div>
				            </div>
				            <div class="form-group">
				                <label class="col-sm-6 col-md-12" for="exampleInputFile">Contraseña:</label>
				                <div class="col-sm-10 col-md-10">
				                	<input type="password" name="sclave2" class="form-control input-lg" placeholder="" required>
				                </div>
			                </div>

							<div class="col-sm-6 col-md-10">
	                			<button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
	                		</div>
	                	</form>
	            	</div>
	        </div>
	    </div>
	</div>
</body>
</html>