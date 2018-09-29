<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="omm_web.News" %>
<asp:Content ID="hdrNews" ContentPlaceHolderID="head" runat="server">  
    <title>News</title>
</asp:Content>

<asp:Content ID="contentNews" ContentPlaceHolderID="content" runat="server">
    <!--News Header-->
    <div class="breadcumb-area bg-img" style="background-image: url(Resources/img/bg-img/bgNews.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h5>What’s new</h5>
                        <h2>News</h2>
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;News
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--News List-->
    <div class="blog-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-16">
                    <div class="faith-blog-posts">
                        <div class="row">
                            <asp:Repeater ID="rptrNews" runat="server">
                                <ItemTemplate>
                                    <div class="col-12 col-lg-4">
                                        <div class="single-blog-area mb-100">
                                            <div class="blog-thumbnail">
                                                <img src="<%# Eval("Image") %>" alt=""  style="height: 240px;">
                                                <div class="post-date">
                                                    <a href="#"><%# Eval("Date", "{0:MMM dd, yyyy}") %></a>
                                                </div>
                                            </div>
                                            <div class="blog-content" style="height: 370px;">
                                                <a href="#" class="blog-title"><%# Eval("Title") %></a>
                                                <p><%#  Eval("Title") %></h6>
                                                <p style="height: 150px;"><%# Eval("Description").ToString().Count()>200 ? Eval("Description").ToString().Substring(0,200) + "..." : Eval("Description") %></p>                                              
                                                <a href="<%# Eval("ID","Article.aspx?id={0}") %>" class="readmore-btn">Read More</a>
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
                        <li><ul class="pagination">
                            <asp:DataList ID="RepeaterPaging" runat="server" OnItemCommand="RepeaterPaging_ItemCommand" OnItemDataBound="RepeaterPaging_ItemDataBound" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <li class="page-item" style="margin-right: 5px;">
                                        <asp:LinkButton ID="Pagingbtn" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage" Text='<%# Eval("PageText") %> ' CssClass="page-link"></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:DataList>
                        </ul></li>
                            <%--<li class="next" runat="server" id="lnknxt"><asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next</asp:LinkButton></li>--%>
                            </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
