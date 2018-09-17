<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="omm_web.Products" %>
<asp:Content ID="hdrProducts" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Resources/style.css"/>
    <title>Products</title>
</asp:Content>

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
                                <img src="<%# Eval("Mini_Image") %>" alt="">
                                <div class="ministry-content">
                                    <h6><%# Eval("Title") %></h6>
                                    <p><%# Eval("Description").ToString().Count()>200 ? Eval("Description").ToString().Substring(0,200) + "..." : Eval("Description") %></p>
                                    <div class="ministry-btn">
                                        <%--<asp:LinkButton runat="server" ID="btnProducts" class="btn faith-btn" Text="See More" CommandArgument='<%# Eval("Title") %>' CommandName="lnkProducts" UseSubmitBehavior="false">
                                        </asp:LinkButton>--%>
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

    <!--Product Modal-->
    <%--<div class="modal fade" id="modalQuickView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-5">
                            <img class="d-block w-100" src="<%=image%>"" alt="First slide">
                        </div>
                        <div class="col-lg-7">
                            <button type="button" class="close" style="float: right" data-dismiss="modal">&times;</button>
                            <h2 class="h2-responsive product-name">
                                <strong> <%=title%></strong>
                            </h2>
                            <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                                <h5 class="mb-0">Description 
                                </h5>
                                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                                    <div class="card-body">
                                        <p><%=description%></p>
                                        <a href="Contact.aspx?title=<%=title%>" class="btn btn-md btn-primary">Inquire</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
