<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="omm_web.Default" MasterPageFile="~/Site.master" ValidateRequest="false"%>

<asp:Content ID="headDefault" ContentPlaceHolderID="head" runat="server">   
    <title>Home</title>
</asp:Content>

<asp:Content ID="formHome" ContentPlaceHolderID="content" runat="server">
   
    <!--Video Modal-->
    <div class="modal fade" id="modalYT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body mb-0 p-0">
                    <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                        <iframe class="embed-responsive-item" id="playerID" src="https://www.youtube.com/embed/A3PDXmYoF5U" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="modal-footer justify-content-center flex-column flex-md-row">
                    <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>        

    <!--Banner Carousel-->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <asp:Repeater ID="rptrBanner" runat="server">
                <ItemTemplate>
                    <div class="single-hero-slide bg-img bg-overlay" style="background-image: url(<%# Eval("Image") %>);">
                        <div class="container h-100">
                            <div class="row h-100 align-items-center justify-content-end">
                                <div class="col-12 col-lg-7">
                                    <div class="hero-slides-content">
                                        <h3 data-animation="fadeInUp" data-delay="300ms"><%# Eval("Subtitle") %></h3>
                                        <h2 data-animation="fadeInUp" data-delay="500ms"><%# Eval("Title") %></h2>
                                        <p data-animation="fadeInUp" data-delay="700ms"><%# Eval("Description") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <!--News Carousel-->
    <div class="faith-blog-area" style="padding-top: 50px">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto">         
                        <h3>Latest News</h3>
                        <p>Donec quis metus ac arcu luctus accumsan. Nunc in justo tincidunt, sodales nunc id, finibus nibh.</p>
                    </div>
                </div>
            </div>
            <div class="row" style="padding-top: -10">
                <div class="news-slides owl-carousel"> 
                    <asp:Repeater ID="rptrNews" runat="server">
                        <ItemTemplate>
                            <div class="single-blog-area mb-100">
                                <div class="blog-thumbnail">
                                    <img src="<%# Eval("Image") %>" style="height: 240px;" alt="">
                                    <div class="post-date">
                                        <a href="#"><%# Eval("Date", "{0:MMM dd, yyyy}") %></a>
                                    </div>
                                </div>
                                <div class="blog-content" style="height: 320px;">
                                    <a href="#" class="blog-title"><%# Eval("Title") %></a>
                                    <p style="height: 150px;"><%# Eval("Description").ToString().Count()>200 ? Eval("Description").ToString().Substring(0,200) + "..." : Eval("Description") %></p>                                              
                                    <a href="<%# Eval("ID","Article.aspx?id={0}") %>" class="readmore-btn">Read More</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>               
                </div>
            </div>
        </div>
    </div>

    <!--Products Carousel-->
    <section class="donate-our-charities" style="background-color: white; padding-bottom: 100px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading text-center mx-auto">
                        <h3>Products</h3>
                        <p>Donec quis metus ac arcu luctus accumsan. Nunc in justo tincidunt, sodales nunc id, finibus nibh.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="donate-slides owl-carousel">
                        <asp:Repeater ID="rptrProducts" runat="server">
                            <ItemTemplate>
                                <div class="single-ministry mb-100">
                                    <asp:HiddenField runat="server" ID="hdnTitle" Value='<%# Eval("Title") %>' />
                                    <asp:HiddenField runat="server" ID="hdnImage" Value='<%# Eval("Image") %>' />
                                    <asp:HiddenField runat="server" ID="hdnDescription" Value='<%# Eval("Description") %>' />
                                    <img src="<%# Eval("Mini_Image") %>" alt="" style="width: 700px; height: 177px;">
                                    <div class="ministry-content" style="height:300px;">
                                        <h6><%# Eval("Title") %></h6>
                                        <p><%# Eval("Description").ToString().Count()>100 ? Eval("Description").ToString().Substring(0,100) + "..." : Eval("Description") %></p>
                                        <div class="ministry-btn">
                                            <a href="#" class="btn faith-btn" onclick="openModal(this);" id="btn_details" runat="server">View</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>                        
                    </div>
                </div>
            </div>
        </div>
    </section>    
    
</asp:Content>

