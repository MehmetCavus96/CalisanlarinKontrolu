<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="calisan.aspx.cs" Inherits="ASP.Net.calisan" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
                                <li class="active"><a href="calisan.aspx">Çalışan</a></li>
                                <li><a href="isler.aspx">İşler</a></li>
                                <li><a href="odemeler.aspx">Ödemeler</a></li>

                            </ul>
                        </nav>
                    </div>
                </div>
            </header>
        </div>



        <div id="fh5co-work-section" class="fh5co-light-grey-section">
            <div class="container">



                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Çalışan Ekle</button>

                <!-- Ekleme Pop-up -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Çalışan Girişi</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        Adi:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtcalisanad" ClientIDMode="Static" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Soyadı:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtcalisansoyad" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Görevi:
                                    </div>
                                    <div class="col-md-6" id="isliste">
                                        <asp:DropDownList ID="ddlCalisanGorev" runat="server" Width="180px">
                                            <Items>
                                                <asp:ListItem Text="Bir Meslek Secin." Value=""></asp:ListItem>
                                            </Items>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Maaş:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtcalisanmaas" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="button" onclick="GetCalisanlar()" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                <button type="button" onclick="sendcalisanData()" class="btn btn-success">Kaydet</button>

                            </div>
                        </div>

                    </div>
                </div>


                <!-- Güncelleme Pop-up -->
                <div class="modal fade" id="guncelleme" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Çalışan Güncelleme</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-2">
                                        Adi:                                    
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TxtGuncelleAd" ClientIDMode="Static" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Soyadı:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TxtGuncelleSoyad" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Görevi:
                                    </div>
                                    <div class="col-md-6" id="islisteguncelle">
                                        <asp:DropDownList ID="ddlGuncelleMeslek" runat="server" Width="180px"></asp:DropDownList>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        Maaş:
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="TxtGuncelleMaas" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">

                                <button type="button" onclick="GetCalisanlar()" class="btn btn-default" data-dismiss="modal">Kapat</button>
                                <button type="button" onclick="updateCalisanData()" class="btn btn-success">Güncelle</button>

                            </div>
                        </div>

                    </div>
                </div>




                <div id="Employes">
                </div>


                <asp:HiddenField ID="idtutan" ClientIDMode="Static" runat="server" />



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
        <%--<script src="js/jquery.stellar.min.js"></script>--%>
        <script src="js/jquery.flexslider-min.js"></script>

        <!-- MAIN JS -->
        <%--<script src="js/main.js"></script>--%>
    </form>








</body>
</html>



<%--document burada sayfaya yüklenirken yüklenmesi gereken bişi varsa onu yüklüyor--%>
<script>

    $(document).ready(function () {
        GetCalisanlar();
    });

    //$(document).ready(function () {
    //    console.log("ready!");
    //});

    function sendcalisanData() {
        var ad = document.getElementById("txtcalisanad").value; //burada txtcalisanad diye belirlediğim textboxun 
        //idsindeki verileri ad adlı bir yere atıyorum.
        var soyad = document.getElementById("txtcalisansoyad").value;
        var gorev = $("#<%=ddlCalisanGorev.ClientID%> option:selected").text();
        //var gorev = $("#ddlCalisanGorev option:selected").value;
        //var gorev = document.getElementById("ddlCalisanGorev").value;
        var maas = document.getElementById("txtcalisanmaas").value;
        $.ajax({
            url: 'calisan.aspx/SavePersonel',  //burası backend de işlem yapmak için kullandığım metodun adresi
            type: "POST",
            data: "{Adi:'" + ad + "', Soyadi:'" + soyad + "', Gorev:'" + gorev + "', Maasi:'" + maas + "'}",       // kırmızı renkde olan ad savepersonel metodunda belirlediğim ad aynı yazılmalı
            //beyaz olan ad da üstte texten aldığım ad değerini metoda atıyor
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert(response.d);
                GetCalisanlar();
                clear()
            }
        });
    }

    function deletedata(id) {
        if (confirm("Silmek istediğinize emin misiniz?") == true) {
            $.ajax({
                url: 'calisan.aspx/DeletePersonel',  //burası backend de işlem yapmak için kullandığım metodun adresi
                type: "POST",
                data: "{idsi:'" + id + "'}",       // kırmızı renkde olan ad savepersonel metodunda belirlediğim ad aynı yazılmalı
                //beyaz olan ad da üstte texten aldığım ad değerini metoda atıyor
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert(response.d);
                    GetCalisanlar();
                    clear()
                }
            });
            return true;
        }
        else {
            return false;
        }
    }


    function clear() {
        $("#txtcalisanad").val("");
        $("#txtcalisansoyad").val("");
        $("#ddlCalisanGorev").val("");
        $("#txtcalisanmaas").val("");

        $("#TxtGuncelleAd").val("");
        $("#TxtGuncelleSoyad").val("");
        $("#ddlGuncelleMeslek").val("");
        $("#TxtGuncelleMaas").val("");


    }


    function GetCalisanlar() {

        $('#Employes').empty();

        $.ajax({
            url: 'calisan.aspx/GetCalisanlar',  //burası backend de işlem yapmak için kullandığım metodun adresi
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var Result = "<table width='100%' class='table table-striped table-bordered' cellspacing='0' width='100%' id='CalisanlarTablosu'>";
                Result += "<thead>";
                Result += "<tr>";
                Result += "<th>Id</th>";
                Result += "<th>Ad</th>";
                Result += "<th>Soyad</th>";
                Result += "<th>Gorevi</th>";
                Result += "<th>Kayit Tarihi</th>";
                Result += "<th>Maas</th>";
                Result += "<th>Kaydı Sil</th>";
                Result += "<th>Kaydı Güncelle</th>";
                Result += "</tr>";
                Result += "</thead>";
                Result += "<tbody>";
                $.each(data.d, function (i, calisan) {
                    Result += "<tr>";
                    Result += "<td>" + calisan.Id + "</td>";
                    Result += "<td>" + calisan.Ad + "</td>";
                    Result += "<td>" + calisan.Soyad + "</td>";
                    Result += "<td align='center'>" + calisan.Gorevi + "</td>";
                    Result += "<td>" + calisan.KayitTarihiStr + "</td>";
                    Result += "<td>" + calisan.Maas + "</td>";
                    Result += "<td><a onclick='deletedata(" + calisan.Id + ")' >Sil</a></td>";
                    Result += "<td><a onclick='SetInfo(" + JSON.stringify(calisan) + ")'>Güncelle</a></td>";
                    Result += "</tr>";
                });
                Result += "</tbody>";
                Result += "</table>";
                $('#Employes').append(Result);
                //$('#Employes').DataTable();
            }
        });
    }





    function SetInfo(calisan) {

        //var calisan = JSON.parse(calisanA)
        $('#idtutan').val(calisan.Id);
        $('#TxtGuncelleAd').val(calisan.Ad);
        $('#TxtGuncelleSoyad').val(calisan.Soyad);
        $('#<%=ddlGuncelleMeslek.ClientID%> option:selected').text(calisan.Gorevi);
        $('#TxtGuncelleMaas').val(calisan.Maas);
        $('#guncelleme').modal('show');
    }


    function updateCalisanData() {
        var id = document.getElementById("idtutan").value;
        //alert(id); buralara alertler koyarak nerelerde hata olduğunu öğrenebiliriz
        var ad = document.getElementById("TxtGuncelleAd").value;
        var soyad = document.getElementById("TxtGuncelleSoyad").value;
        var gorev = $("#<%=ddlGuncelleMeslek.ClientID%> option:selected").text();
        var maas = document.getElementById("TxtGuncelleMaas").value;
        $.ajax({
            url: 'calisan.aspx/UpdatePersonel',
            type: "POST",
            data: "{idsi:'" + id + "',Adi:'" + ad + "', Soyadi:'" + soyad + "', Gorev:'" + gorev + "', Maasi:'" + maas + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert(response.d);
                GetCalisanlar();
                $("#idtutan").val("");
            }
        });
    }



</script>


