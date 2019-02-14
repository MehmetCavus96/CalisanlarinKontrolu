using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP.Net.DB;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.IO;

namespace ASP.Net
{
    public partial class calisan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//kaydedilmiş meslekleri dropdownliste aktarıyor
            {
                ddlCalisanGorev.DataSource = entity.Islers.ToList();
                ddlCalisanGorev.DataTextField = "Meslek";
                ddlCalisanGorev.DataValueField = "id";
                ddlCalisanGorev.DataBind();

                ddlGuncelleMeslek.DataSource = entity.Islers.ToList();
                ddlGuncelleMeslek.DataTextField = "Meslek";
                ddlGuncelleMeslek.DataValueField = "id";
                ddlGuncelleMeslek.DataBind();
            }
        }

        static SirketEntities2 entity = new SirketEntities2();

        [WebMethod]
        public static List<Calisanlar> GetCalisanlar()//çalisanları ana sayfaya listeliyor
        {
            try
            {
                return entity.Calisanlars.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static string DeletePersonel(int idsi)//çalisanları Siliyor
        {

            try
            {
                var sil = entity.Calisanlars.FirstOrDefault(s => s.Id == idsi);
                if (sil != null)
                {
                    entity.Calisanlars.Remove(sil);
                    entity.SaveChanges();

                }
                return "Silme İşlemi Başarı İle Gerçekleştirildi.";
            }


            catch (Exception)
            {
                return "Silme İşlemi Gerçekleştirilemedi.";

            }
        }

        public static string kontrol(string Adi, string Soyadi, string Maasi)//Boşluk Olup Olmadığını Kontrol Ediyor
        {
            if (string.IsNullOrEmpty(Adi))
            {
                return "Lütfen Adınızı Doldurunuz";
            }
            else if (string.IsNullOrEmpty(Soyadi))
            {
                return "Lütfen Soyadini Doldurunuz";
            }
            else if (string.IsNullOrEmpty(Maasi))
            {
                return "Lütfen Maasi Doldurunuz";
            }
            return "BoşlukYok";
        } 

        [WebMethod]
        public static bool kontenjan(string Gorev)//kontenjan Sayisini Kontrol Ediyor
        {
            var gorevadi = entity.Calisanlars.Where(t => t.Gorevi == Gorev);
            var gorevlisayisi = gorevadi.Count();

            var isadi = entity.Islers.Where(c => c.Meslek == Gorev).First();
            var kontenjan = isadi.KontenjanSayisi;

            if (gorevlisayisi >= kontenjan)
            {
                return false;

            }
            else
            {
                return true;
            }
            
        } 

        [WebMethod]
        public static string SavePersonel(string Adi, string Soyadi, string Gorev, string Maasi)//çalisanları kaydediyor
        {
            try
            {
                Calisanlar calisan = new Calisanlar();
                Isler isler = new Isler();

                if (kontenjan(Gorev)==false)
                {
                    return "Kontenjan Sayisini Aştınız";

                }
                else
                {
                    if (kontrol(Adi, Soyadi, Maasi) == "BoşlukYok")
                    {
                        calisan.Ad = Adi;
                        calisan.Soyad = Soyadi;
                        calisan.Gorevi = Gorev;
                        calisan.Maas = Convert.ToInt32(Maasi);
                        calisan.KayitTarihi = DateTime.Now;

                        entity.Calisanlars.Add(calisan);
                        entity.SaveChanges();
                        return "Kaydetme İşlemi Başarı İle Gerçekleşti.";

                    }
                    return "Boşlukları Doldurunuz";
                }
            }
            catch (Exception ex)
            {
                string message = (!string.IsNullOrEmpty(ex.Message) ? ("Message=" + ex.Message) : "") +
                        (ex.InnerException != null && !string.IsNullOrEmpty(ex.InnerException.Message) ? ex.InnerException.Message : "");
                return "Kaydetme Gerçekleştirilemedi.";

            }
        }

        [WebMethod]
        public static string UpdatePersonel(int idsi, string Adi, string Soyadi, string Gorev, string Maasi)//çalisanları güncelliyor
        {
            try
            {
                Calisanlar calisan = new Calisanlar();
                Isler isler = new Isler();

                if (kontenjan(Gorev) == false)
                {
                    return "Kontenjan Sayisini Aştınız";

                }
                if (kontrol(Adi, Soyadi, Maasi) == "BoşlukYok")
                {
                    var guncellenicek_kisi = entity.Calisanlars.Find(idsi);
                    if (guncellenicek_kisi != null)
                    {
                        guncellenicek_kisi.Ad = Adi;
                        guncellenicek_kisi.Soyad = Soyadi;
                        guncellenicek_kisi.Gorevi = Gorev;
                        guncellenicek_kisi.Maas = Convert.ToInt32(Maasi);
                        guncellenicek_kisi.KayitTarihi = DateTime.Now;
                        entity.SaveChanges();

                    }

                    return "Güncelleme İşlemi Başarı İle Gerçekleşti.";
                }
                return "Boşlukları Doldurunuz";

            }
            catch (Exception ex)
            {

                return "Güncelleme Gerçekleştirilemedi.";

            }
        }

    }

}
