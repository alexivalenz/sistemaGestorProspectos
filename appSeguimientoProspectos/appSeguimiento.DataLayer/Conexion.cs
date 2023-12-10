//importaciones por defecto
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace appSeguimiento.DataLayer
{
    public class Conexion
    {
        public static string cadena = ConfigurationManager.ConnectionStrings["cadenaConexionSQL"].ToString();
    }
}
