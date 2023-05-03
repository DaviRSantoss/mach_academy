<?php
    include('../Parts/All/conexao.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <?php include("../Parts/Cadastros/Cadastro_Criador/linksCss.html"); ?>
        <title>Cadastro Criador</title>
    </head>
    <body>
        <Header>
            <?php
                include("../Parts/Home/main.php");
            ?>
        </Header> 
        <main>
            <?php  
            include("../Parts/Cadastros/Cadastro_Criador.php");
            ?>
        </main>
        <footer>
            <?php
                //include("../Parts/Home/linksJs.html");
            ?>
        </footer>
    </body>
</html>
