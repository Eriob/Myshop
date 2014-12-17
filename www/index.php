<?php
    
session_start();


header('Content-type: text/html; charset=UTF-8');

if(isset($_SESSION['pseudo'])){
    include_once('./Viewer/VheaderUser.php');
}else{
    include_once('./Viewer/Vheader.php');
}

    if (isset ($_GET['index'])) {
        switch ($_GET['index']) {
            case "subscribe":
                include_once('./Controller/Csubscribe.php');
                break;
            case "valid_subscribe":
                include_once('./Controller/Csubscribe.php');
                break;
            case "connect":
                include_once('./Controller/Cconnect.php');
                break;
            case "disconnect":
                include_once('./Controller/Cdisconnect.php');
                break;
            default:
                include_once('./Controller/Cindex.php');
                break;
        }   
    }else{
        include_once('./Controller/Cindex.php');
    }

        include_once('./Viewer/Vfooter.php');

?>