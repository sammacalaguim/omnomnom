<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="omm_web.Article" %>
<asp:Content ID="hdrNewsInfo" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentNewsInfo" ContentPlaceHolderID="content" runat="server">
    <!--Article Header-->
    <div class="breadcumb-area bg-img" style="background-image: url(Resources/img/bg-img/bgNews.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h2>Article</h2>
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;
                            <asp:HyperLink ID="lnkNews" runat="server" NavigateUrl="~/News.aspx" ForeColor="White">News</asp:HyperLink>
                            &nbsp;/&nbsp;Article
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Article Content-->
    <div class="container">
        <div align="center" style="margin-top: 100px; margin-bottom: 30px;">
            <h4><%=title%></h4>
            <p><%=date%></p>
            <img style="height: auto; width: 600px; margin-top: 25px; margin-bottom: 50px;" src="<%=image_path%>" />
        </div>
        <table border="0" style="margin-bottom:100px;">
            <tbody>
                <tr>
                    <td>
                        <p><%=description%></p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
