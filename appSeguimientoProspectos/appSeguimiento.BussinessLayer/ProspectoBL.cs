using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using appSeguimiento.DataLayer;
using appSeguimiento.EntityLayer;

namespace appSeguimiento.BussinessLayer
{
    public class ProspectoBL
    {
        ProspectoDL ProspectoDL = new ProspectoDL();

        public List<Prospecto> obtenerTodosProspectos()
        {
            try
            {
                return ProspectoDL.ObtenerInfoTodosProspectos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Prospecto ObtenerProspecto(int idProspecto)
        {
            try
            {
                return ProspectoDL.ObtenerInfoDetalle(idProspecto);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool InsertarProspecto(Prospecto prospectoCapturado)
        {
            try
            {
                if (prospectoCapturado.Nombre.Length < 0 || prospectoCapturado.PrimerApellido.Length < 0 || prospectoCapturado.SegundoApellido.Length < 0)
                    throw new OperationCanceledException("Los campos relacionados al nombre del prospecto son campos obligatorios");
                
                return ProspectoDL.AgregarNuevo(prospectoCapturado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool ActualizarEstatus(Prospecto prospectoCapturado)
        {
            try
            {
                var busquedaProspecto = ProspectoDL.ObtenerInfoDetalle(prospectoCapturado.IdProspecto);

                if (busquedaProspecto.IdProspecto == 0)
                    throw new OperationCanceledException("No hay ningún registro relacionado con el prospecto que busca.");

                return ProspectoDL.EditarEstatus(prospectoCapturado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
