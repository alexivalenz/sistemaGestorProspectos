//importaciones por defecto
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
    public class ProspectoDL
    {
        public List<Prospecto> ObtenerInfoTodosProspectos()
        {
            List<Prospecto> prospectos = new List<Prospecto>();
            using (SqlConnection openConnection = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("EXEC sp_obtenerInfoTodosProspectos", openConnection);
                cmd.CommandType = CommandType.Text;
                try
                {
                    openConnection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read()){
                            prospectos.Add(new Prospecto { 
                                IdProspecto = Convert.ToInt32(dr["ID"].ToString()),
                                Nombre = dr["nombre"].ToString(),
                                PrimerApellido = dr["ape_paterno"].ToString(),
                                SegundoApellido = dr["ape_materno"].ToString(),
                                Calle = dr["calle"].ToString(),
                                NumeroDomicilio = Convert.ToInt32(dr["numero_domicilio"].ToString()),
                                Colonia = dr["colonia"].ToString(),
                                CodigoPostal = Convert.ToInt32(dr["codigo_postal"].ToString()),
                                Telefono = dr["telefono"].ToString(),
                                Rfc = dr["rfc"].ToString(),
                                Estatus = dr["estatus"].ToString(),
                                Observaciones = dr["observaciones"].ToString()
                            });
                        }
                    }
                    return prospectos;
                }catch (Exception ex)
                {
                    throw ex;
                }
            }
            
        }

        public Prospecto ObtenerInfoDetalle(int IdProspecto)
        {
            Prospecto prospectoConsultado = new Prospecto();
            using (SqlConnection openConnection = new SqlConnection(Conexion.cadena))
            {
                SqlCommand cmd = new SqlCommand("EXEC sp_obtenerInfoProspecto", openConnection);
                cmd.Parameters.AddWithValue("ID", IdProspecto);
                cmd.CommandType = CommandType.Text;
                try
                {
                    openConnection.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if(dr.Read())
                        {
                            prospectoConsultado.IdProspecto = Convert.ToInt32(dr["ID"]);
                            prospectoConsultado.Nombre = dr["nombre"].ToString();
                            prospectoConsultado.PrimerApellido = dr["ape_paterno"].ToString();
                            prospectoConsultado.SegundoApellido = dr["ape_materno"].ToString();
                            prospectoConsultado.Calle = dr["calle"].ToString();
                            prospectoConsultado.NumeroDomicilio = Convert.ToInt32(dr["numero_domicilio"].ToString());
                            prospectoConsultado.Colonia = dr["colonia"].ToString();
                            prospectoConsultado.CodigoPostal = Convert.ToInt32(dr["codigo_postal"].ToString());
                            prospectoConsultado.Telefono = dr["telefono"].ToString();
                            prospectoConsultado.Rfc = dr["rfc"].ToString();
                            prospectoConsultado.Estatus = dr["estatus"].ToString();
                            prospectoConsultado.Observaciones = dr["observaciones"].ToString();
                        }
                    }
                    return prospectoConsultado;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }
    }
}
