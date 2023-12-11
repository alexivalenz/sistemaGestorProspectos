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
            }//else
            //{
              //  Response.Redirect("~/Default.aspx");
            //}
        }

        protected void BtnGuardarDocs_Click(object sender, EventArgs e)
        {
            Documento DocumentoCapturado = new Documento()
            {
                IdProspecto = 2,
                IdDocumento = 123345,
                NombreDocumento = fuDocs.FileName.ToString(),
                InfoDocumento = fuDocs.FileBytes
            };

            bool respuestaExitosa;
            try
            {
                respuestaExitosa = DocumentoDLObj.InsertarNuevo(DocumentoCapturado);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('¡Documento capturado de forma exitosa!')", true);
            }
            catch(Exception ex)
            {
                System.Console.Write(ex.Message);
            }
        }

        protected void btnGuardarDocs_Click1(object sender, EventArgs e)
        {
            Documento DocumentoCapturado = new Documento()
            {
                IdProspecto = 2,
                IdDocumento = 134234,
                NombreDocumento = fuDocs.FileName.ToString(),
                InfoDocumento = fuDocs.FileBytes
            };

            bool respuestaExitosa;
            try
            {
                respuestaExitosa = DocumentoDLObj.InsertarNuevo(DocumentoCapturado);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('¡Documento capturado de forma exitosa!')", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Ocurrió un error al guardar el archivo')", true);
            }
        }
    }
}