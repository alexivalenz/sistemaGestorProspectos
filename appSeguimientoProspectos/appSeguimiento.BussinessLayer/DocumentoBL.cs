using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using appSeguimiento.DataLayer;
using appSeguimiento.EntityLayer;

namespace appSeguimiento.BussinessLayer
{
    public class DocumentoBL
    {
        DocumentoDL DocumentoDLObj = new DocumentoDL();

        public List<Documento> ObtenerDocumentosProspecto(int IdProspecto)
        {
            try
            {
                return DocumentoDLObj.ObtenerInfoTodosProspectos(IdProspecto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool InsertarNuevo(Documento documentoCapturado)
        {
            try
            {
                if (documentoCapturado.NombreDocumento.Length < 0 || documentoCapturado.InfoDocumento.Length < 0)
                    throw new OperationCanceledException("Debe de asignarse un nombre al documento y cargarlo");

                return DocumentoDLObj.AgregarNuevo(documentoCapturado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
