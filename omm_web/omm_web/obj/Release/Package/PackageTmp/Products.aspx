<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="omm_web.Products" %>
<asp:Content ID="contentProducts" ContentPlaceHolderID="content" runat="server">
    <!--Products Header-->
    <div class="breadcumb-area bg-img" style="background-image: url(Resources/img/bg-img/prod2.png);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h2>Products</h2>
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;Products
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Products List-->
    <section class="ministries-area section-padding-100-0">
        <div class="container">
            <div class="row">                                
                <asp:Repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-lg-4">
                            <div class="single-ministry mb-100">
                                <asp:HiddenField runat="server" ID="hdnTitle" Value='<%# Eval("Title") %>'/>
                                <asp:HiddenField runat="server" ID="hdnImage" Value='<%# Eval("Image") %>'/>
                                <asp:HiddenField runat="server" ID="hdnDescription" Value='<%# Eval("Description") %>'/>
                                <img src="<%# Eval("Mini_Image") %>" alt="" style="height:250px; width: 100%;">
                                <div class="ministry-content" style="height:300px;">
                                    <h6><%# Eval("Title") %></h6>
                                    <p><%# Eval("Description").ToString().Count()>200 ? Eval("Description").ToString().Substring(0,200) + "..." : Eval("Description") %></p>
                                    <div class="ministry-btn">
                                        <a href="#" class="btn faith-btn" onclick="openModal(this);" id="btn_details" runat="server">View</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
</asp:Content>
