<?php
    
session_start();


header('Content-type: text/html; charset=UTF-8');

if(isset($_SESSION['pseudo'])){
    include_once('/var/www/Myshop/www/Viewer/VheaderUser.php');
}else{
    include_once('/var/www/Myshop/www/Viewer/Vheader.php');
}

    if (isset ($_GET['index'])) {
        switch ($_GET['index']) {
            case "subscribe":
                include ('/var/www/Myshop/www/Controller/Csubscribe.php');
                break;
            case "connect":
                include('/var/www/Myshop/www/Controller/Cconnect.php');
                break;
            case "disconnect":
                include('/var/www/Myshop/www/Controller/Cdisconnect.php');
                break;
            default:
                include_once('/var/www/Myshop/www/Controller/Cindex.php');
                break;
        }   
    }else{
        include_once('/var/www/Myshop/www/Controller/Cindex.php');
    }

        include_once('/var/www/Myshop/www/Viewer/Vfooter.php');

?>