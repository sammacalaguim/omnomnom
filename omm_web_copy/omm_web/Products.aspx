<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="omm_web.Products" ValidateRequest="false"%>
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
                <div class="col-12 col-lg-16">
                    <div class="faith-blog-posts">
                        <div class="row">
                            <asp:Repeater ID="rptrProducts" runat="server">
                                <ItemTemplate>
                                    <div class="col-12 col-sm-6 col-lg-4">
                                        <div class="single-ministry mb-100">
                                            <asp:HiddenField runat="server" ID="hdnTitle" Value='<%# Eval("Title") %>' />
                                            <asp:HiddenField runat="server" ID="hdnImage" Value='<%# Eval("Image") %>' />                                            
                                            <asp:HiddenField runat="server" ID="hdnDescription" Value='<%# Eval("Subtitle") + "<br/><br/>" + Eval("Description").ToString().Replace("\n", "<br/>") %>' />
                                            <img src="<%# Eval("Image") %>" alt="" style="height: 250px; width: 100%; overflow: hidden; object-fit: cover">
                                            <div class="ministry-content" style="height: 300px;">
                                                <h6><%# Eval("Title") %></h6>
                                                <p><%# Eval("Subtitle").ToString().Count()>200 ? Eval("Subtitle").ToString().Substring(0,200) + "..." : Eval("Subtitle") %></p>
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
                </div>

                 <!-- Pagination Area -->
                <div class="pagination-area">
                    <nav aria-label="Page navigation">
                        <ul class="pager">
                            <%--<li class="previous" runat="server" id="lnkprv"><asp:LinkButton ID="lnkPrevious" runat="server" OnClick="lnkPrevious_Click">Previous</asp:LinkButton></li>--%>
                            <li>
                                <ul class="pagination">
                                    <asp:DataList ID="RepeaterPaging" runat="server" OnItemCommand="RepeaterPaging_ItemCommand" OnItemDataBound="RepeaterPaging_ItemDataBound" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <li class="page-item" style="margin-right: 5px;">
                                                <asp:LinkButton ID="Pagingbtn" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage" Text='<%# Eval("PageText") %> ' CssClass="page-link"></asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </ul>
                            </li>
                            <%--<li class="next" runat="server" id="lnknxt"><asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next</asp:LinkButton></li>--%>
                        </ul>
                    </nav>
                </div>
                <br/><br/><br/><br/>
            </div>
        </div>
    </section>
</asp:Content>
