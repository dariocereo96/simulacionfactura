using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppWeb
{
    public partial class ReporteProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ServiceReference1.WebService1SoapClient servicio = new ServiceReference1.WebService1SoapClient();
                var list = servicio.ListarProductos();

                ReportViewer1.ProcessingMode = ProcessingMode.Local;
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("Report2.rdlc");

                // Habilitar imágenes externas
                ReportViewer1.LocalReport.EnableExternalImages = true;

                ReportDataSource dataSource = new ReportDataSource("DataSet1", list);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(dataSource);
                ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}