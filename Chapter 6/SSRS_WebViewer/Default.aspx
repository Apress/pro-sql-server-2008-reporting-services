<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SSRS_WebViewer._Default" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>SSRS Web Viewer</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ReportListing" runat="server">
        </asp:DropDownList>
        <asp:Button ID="RenderReport" runat="server" Text="Render" 
            onclick="RenderReport_Click" />
        <hr />        
        <rsweb:ReportViewer ID="ReportViewerWeb" runat="server" Width="1120px" 
            Height="700px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1">

        </rsweb:ReportViewer>
    </div>
</form>
</body>
