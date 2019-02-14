using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASP.Net.DB;
using System.Web.Services;

namespace ASP.Net
{
    public partial class isler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static SirketEntities2 entity = new SirketEntities2();

        [WebMethod]
        public static string IsleriKaydet(string meslek, string aciklama, string kontenjan)
        {
            if (string.IsNullOrEmpty(meslek))
            {
                return "Lütfen Meslek Alanını Doldurunuz";
            }
            else if (string.IsNullOrEmpty(aciklama))
            {
                return "Lütfen Açıklama Alanını Doldurunuz";
            }
            else if (string.IsNullOrEmpty(kontenjan))
            {
                return "Lütfen Kontenjan Alanını Doldurunuz";
            }
            try
            {
                Isler isler = new Isler();
                {
                    isler.Meslek = meslek;
                    isler.Aciklama = aciklama;
                    isler.KontenjanSayisi = Convert.ToInt32(kontenjan);
                }
                entity.Islers.Add(isler);
                entity.SaveChanges();
                return "1";
            }
            catch (Exception ex)
            {
                string message = (!string.IsNullOrEmpty(ex.Message) ? ("Message=" + ex.Message) : "") +
                        (ex.InnerException != null && !string.IsNullOrEmpty(ex.InnerException.Message) ? ex.InnerException.Message : "");
                return "0";
            }
        }
        protected void btnislerkaydet_Click(object sender, EventArgs e)
        {
        }
    }
}