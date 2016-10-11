using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SSRS_WebViewer.SSRS_WebService;

namespace SSRS_WebViewer
{
    public partial class _Default : System.Web.UI.Page
    {
        ReportingService2005 rs = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                rs = new ReportingService2005();
                rs.Credentials = System.Net.CredentialCache.DefaultCredentials;

                CatalogItem[] listItems = rs.ListChildren("/Pro_SSRS/Chapter_6", false);

                foreach (CatalogItem thisItem in listItems)
                {
                    if (thisItem.Type == ItemTypeEnum.Report)
                    {
                        ReportListing.Items.Add(thisItem.Name);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void RenderReport_Click(object sender, EventArgs e)
        {
            ReportViewerWeb.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Remote;
            ReportViewerWeb.ServerReport.ReportServerUrl = new Uri(@"http://localhost/reportserver/");
            ReportViewerWeb.ServerReport.ReportPath = "/Pro_SSRS/Chapter_6/" + ReportListing.SelectedItem.Value;
            ReportViewerWeb.ServerReport.Refresh();
        }
    }
}
