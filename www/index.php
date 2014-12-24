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
                include('./Controller/Csubscribe.php');
                break;
            case "subscribe_step1":
                include('./Controller/Csubscribe.php');
                break;
            case "subscribe_step2":
                include('./Controller/Csubscribe.php');
                break;
            case "subscribe_step3":
                include('./Controller/Csubscribe.php');
                break;
            case "connect":
                include('./Controller/Cconnect.php');
                break;
            case "disconnect":
                include('./Controller/Cdisconnect.php');
                break;
            default:
                include('./Controller/Cindex.php');
                break;
        }   
    }else{
        include_once('./Controller/Cindex.php');
    }

        include_once('./Viewer/Vfooter.php');

?>