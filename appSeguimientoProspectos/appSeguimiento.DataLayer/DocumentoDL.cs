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
        public List<Documento> EnlistaDocumentos()
        {
            List<Documento> documentos = new List<Documento>();
            using (SqlConnection openConnection = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerDocsProspecto", openConnection);
                cmd.CommandType = CommandType.Text;
                try
                {
                    openConnection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            documentos.Add(new Documento
                            {
                                NombreDocumento = dr["nombreDocumento"].ToString(),
                                InfoDocumento = dr["Documento"].ToString()
                            });
                        }
                    }
                    return documentos;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }
    }
}
