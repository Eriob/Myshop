<?php
    
session_start();


header('Content-type: text/html; charset=UTF-8');

if(isset($_SESSION['pseudo'])){
    include_once('/Viewer/VheaderUser.php');
}else{
    include_once('/Viewer/Vheader.php');
}

    if (isset ($_GET['index'])) {
        switch ($_GET['index']) {
            case "subscribe":
                include ('/Controller/Csubscribe.php');
                break;
            case "connect":
                include('/Controller/Cconnect.php');
                break;
            case "disconnect":
                include('/Controller/Cdisconnect.php');
                break;
            case "contact":
                include('/Controller/Ccontact.php');
                break;
            case "requestContact":
                include('/Controller/CrequestContact.php');
                break;
            case "searchWebsite":
                include('/Controller/CsearchWebsite.php');
                break;
            case "myProfil":
                include('/Controller/CmyProfil.php');
                break;
            case "modifyProfil":
                include('/Controller/CmyProfil.php');
                break;
            case "myShop":
                include('/Controller/CmyShop.php');
                break;
            case "modifyShop":
                include('/Controller/CmyShop.php');
                break;
            default:
                include_once('/Controller/Cindex.php');
                break;
        }   
    }else{
        include_once('/Controller/Cindex.php');
    }

?>