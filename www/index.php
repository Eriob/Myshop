<?php
    
session_start();

header('Content-type: text/html; charset=UTF-8');

if(isset($_SESSION['name'])){
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
            case "valid_subscribe":
                include('./Controller/Csubscribe.php');
                break;
            case "connect":
                include('./Controller/Cconnect.php');
                break;
            case "disconnect":
                include('./Controller/Cdisconnect.php');
                break;
            case "update_profile":
                include('./Controller/Cupdate_profil.php');
                break;
            case "get_profile":
                include('./Controller/Cget_profile.php');
                break;
            case "contact":
                include('./Controller/Ccontact.php');
                break;
            case "get_informations":
                include('./Controller/Cget_informations.php');
                break;
            case "show_mywebsite":
                include('./Controller/Cshow_mywebsite.php');
                break;
            case "get_options":
                include('./Controller/Cget_options.php');
                break;
			case "myProfil":
                include('./Viewer/Vprofil.php');
                break;
			case "search_shop":
                include('./Viewer/Vsearchmyshop.php');
                break;
			case "search_started":
                include('./Viewer/Csearchmyshop.php');
                break;
            case "delete_shop":
                include('./Controller/Cdelete_shop.php');
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