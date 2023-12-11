using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using appSeguimiento.EntityLayer;
using appSeguimiento.BussinessLayer;
using System.Globalization;

namespace appSeguimientoProspectos
{
    public partial class Contact : Page
    {
        private static int IdProspecto = 0;
        ProspectoBL ProspectoBLObj = new ProspectoBL();
        DocumentoBL DocumentoDLObj = new DocumentoBL();    

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["idProspecto"] != null)
                {
                    IdProspecto = Convert.ToInt32(Request.QueryString["idProspecto"].ToString());
                }
            }else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            Prospecto ProspectoCapturado = new Prospecto()
            {
                IdProspecto = IdProspecto,
                Nombre = txtNombre.Text,
                PrimerApellido = txtPrimerApe.Text,
                SegundoApellido = txtSegundoApe.Text,
                Calle = txtCalle.Text,
                NumeroDomicilio = Convert.ToInt32(txtNumeroDom.Text),
                Colonia = txtColonia.Text,
                CodigoPostal = Convert.ToInt32(txtCodigoPos.Text),
                Telefono = txtTelefono.Text,
                Rfc = txtRfc.Text
            };

            bool respuestaExitosa;

            respuestaExitosa = ProspectoBLObj.InsertarProspecto(ProspectoCapturado);

            if (respuestaExitosa)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('¡Prospecto capturado de forma exitosa!')", true);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se pudo realizar la operación deseada')", true);
            }
        }

        protected void BtnGuardarDoc_Click(object sender, EventArgs e)
        {
            Documento DocumentoCapturado = new Documento()
            {
                IdProspecto = 1,
                IdDocumento = 1
            };

            bool respuestaExitosa;

            respuestaExitosa = DocumentoDLObj.InsertarNuevo(DocumentoCapturado);

            if (respuestaExitosa)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('¡Documento capturado de forma exitosa!')", true);
                //Response.Redirect("~/Default.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('No se pudo realizar la operación deseada')", true);
            }
        }
    }
}