using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//importaciones para utilizar la capa Entidad y SQL
using appSeguimiento.EntityLayer;
using System.Data;
using System.Data.SqlClient;

namespace appSeguimiento.DataLayer
{
    public class DocumentoDL
    {
        public List<Documento> ObtenerInfoTodosProspectos(int IdProspecto)
        {
            List<Documento> documentosProspecto = new List<Documento>();
            using (SqlConnection openConnection = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerDocsProspecto", openConnection);
                cmd.Parameters.AddWithValue("@ID", IdProspecto);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    openConnection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            documentosProspecto.Add(new Documento
                            {
                                IdDocumento = Convert.ToInt32(dr["idDocumento"].ToString()),
                                IdProspecto = Convert.ToInt32(dr["idProspecto"].ToString()),
                                NombreDocumento = dr["NombreDocumento"].ToString(),
                                InfoDocumento = dr["Documento"].ToString()
                            });
                        }
                    }
                    return documentosProspecto;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }

        public bool AgregarNuevo(Documento documentoAgregar)
        {
            bool registroAgregado = false;

            using (SqlConnection openConnection = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_insertarDocumento", openConnection);
                cmd.Parameters.AddWithValue("@ID", documentoAgregar.IdDocumento);
                cmd.Parameters.AddWithValue("@nombre", documentoAgregar.IdProspecto);
                cmd.Parameters.AddWithValue("@ape_paterno", documentoAgregar.NombreDocumento);
                cmd.Parameters.AddWithValue("@ape_materno", documentoAgregar.InfoDocumento);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    openConnection.Open();
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    if (filasAfectadas > 0) registroAgregado = true;
                    return registroAgregado;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }
}
