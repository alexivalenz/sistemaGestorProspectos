using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace appSeguimiento.EntityLayer
{
    public class Prospecto
    {
        public int IdProspecto { get; set; }
        public string Nombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Calle { get; set; }
        public int NumeroDomicilio { get; set; }
        public string Colonia { get; set; }
        public int CodigoPostal { get; set; }
        public string Telefono { get; set; }
        public string Rfc { get; set; }
        public string Estatus { get; set; }
        public Documento[] Documentos { get; set; }
        public string Observaciones { get; set; }
    }
}
