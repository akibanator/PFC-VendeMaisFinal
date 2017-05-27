<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,400italic">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="shortcut icon" href="images/i.ico">
        <title>VendeMais Corp.</title>
    </head>

    <body>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <div class="main-body">
            <div class="container">
                <div class="row">
                    <div class="main-page">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Acesso Corporativo</h3>
                                    </div>
                                    <div class="panel-body">
                                        <form role="form" action="loginADM" method="post">
                                            <fieldset>
                                                <div class="form-group">
                                                    <input class="form-control" placeholder="E-mail" name="email" required>
                                                </div>
                                                <div class="form-group">
                                                    <input class="form-control" placeholder="senha" name="senha" maxlength="8" type="password" required>
                                                </div>
                                                <input type="submit" class="btn btn-success btn-block">
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>       
                    </div>
                </div>
                <footer class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 footer">
                        <p class="copyright">Copyright © 2017 VendeMais</p>
                    </div>
                </footer>
            </div>
        </div>
    </body>
</html>