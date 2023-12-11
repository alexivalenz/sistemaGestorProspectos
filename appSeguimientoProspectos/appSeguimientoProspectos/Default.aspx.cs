using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using appSeguimiento.EntityLayer;
using appSeguimiento.BussinessLayer;

namespace appSeguimientoProspectos
{
    public partial class _Default : Page
    {
        ProspectoBL ProspectoObj = new ProspectoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            MostrarTodosProspectos();
        }

        private void MostrarTodosProspectos()
        {
            List<Prospecto> lista = ProspectoObj.obtenerTodosProspectos();

        cardRep.DataSource = lista;
        cardRep.DataBind();
            //GVProspectos.DataSource = lista;
            //GVProspectos.DataBind();
        }

        protected void Nuevo_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact.aspx?idProspecto=0");
        }

        protected void MostrarProspecto_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string idProspectoMostrar = btn.CommandArgument;

            Response.Redirect($"~/About.aspx?idProspecto={idProspectoMostrar}");
        }
    }
}