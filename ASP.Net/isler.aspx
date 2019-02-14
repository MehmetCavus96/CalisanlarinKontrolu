<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="isler.aspx.cs" Inherits="ASP.Net.isler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Çalışan Kontrol</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
    <meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="FreeHTML5.co" />


    <meta property="og:title" content="" />
    <meta property="og:image" content="" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="" />
    <meta property="og:description" content="" />
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico" />

    <link href="https://fonts.googleapis.com/css?family=Raleway:200,300,400,700" rel="stylesheet" />

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css" />

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css" />

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous">
     <%--//AJAX KULLANICAKSAN KESİNLİKLE BU JQUERY KODUNU EKLE !!!--%>
    </script>
</head>
<body>
    <form id="form1" runat="server">



        <div id="fh5co-page">
            <header id="fh5co-header" role="banner">
                <div class="container">
                    <div class="header-inner">
                        <h1><a href="Default.aspx">Flew</a></h1>
                        <nav role="navigation">
                            <ul>
                                <li><a href="calisan.aspx">Çalışan</a></li>
                                <li class="active"><a href="isler.aspx">İşler</a></li>
                                <li><a href="odemeler.aspx">Ödemeler</a></li>

                            </ul>
                        </nav>
                    </div>
                </div>
            </header>

        </div>





        <div id="fh5co-services-section" class="fh5co-light-grey-section">
            <div class="container">



                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">İş Ekle</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">İş Girişi</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        İş:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtisleris" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Açıklama:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtisleraciklama" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Kontenjan Sayısı:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtislerkontenjan" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-default" data-dismiss="modal">Kapat</button>

                                <button type="button" class="btn btn-success" data-dismiss="modal" onclick="sendislerData()">Kaydet</button>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>


        <!-- Stellar -->
        <script src="js/jquery.stellar.min.js"></script>

        <!-- MAIN JS -->
        <script src="js/main.js"></script>



    </form>
</body>
</html>

<%--document burada sayfaya yüklenirken yüklenmesi gereken bişi varsa onu yüklüyor--%>
<script>
    $(document).ready(function () {
    });
    function sendislerData() {
        var meslek = document.getElementById("txtisleris").value; //burada txtcalisanad diye belirlediğim textboxun 
        //idsindeki verileri ad adlı bir yere atıyorum.
        var aciklama = document.getElementById("txtisleraciklama").value;
        var kontenjan = document.getElementById("txtislerkontenjan").value;
        $.ajax({
            url: 'isler.aspx/IsleriKaydet',  //burası backend de işlem yapmak için kullandığım metodun adresi
            type: "POST",
            data: "{meslek:'" + meslek + "', aciklama:'" + aciklama + "', kontenjan:'" + kontenjan + "'}",       // kırmızı renkde olan ad savepersonel metodunda belirlediğim ad aynı yazılmalı
            //beyaz olan ad da üstte texten aldığım ad değerini metoda atıyor
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert(response.d);
            }
        });
    }
</script>
