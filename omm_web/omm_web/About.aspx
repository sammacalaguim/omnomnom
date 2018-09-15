<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="omm_web.WebForm3" %>
<asp:Content ID="hdrAbout" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Resources/css/about.css">
    <Title>About Us</title>
</asp:Content>
<asp:Content ID="contentAbout" ContentPlaceHolderID="content" runat="server">
    
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img" style="background-image: url(Resources/img/bg-img/bg-10.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h2>About Us</h2>
                        <p>Cras iaculis eleifend arcu, non cursus sem. Morbi viverra varius nisl, ac varius mauris interdum sit amet. Aenean ac fermentum neque.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <div class="med-history">
        <div class="container">
            <div class="row align-items-end">
                <div class="col-12 col-lg-6">
                    <h2>Who We Are</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus. Curabitur ut augue finibus, luctus tortor at, ornare erat. Nulla facilisi. Sed est risus, laoreet et quam non, viverra accumsan leo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus finibus. Curabitur ut augue finibus, luctus tortor at, ornare erat. </p>
                </div>
                <div class="col-12 col-lg-6 mt-5 mt-lg-0">
                    <img class="responsive" src="Resources/img/core-img/about.jpg" alt="">
                </div>
            </div>
        </div>
    </div>

    <div class="medical-team">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2>The Team</h2>
                </div>

                <div class="col-12 col-md-6 col-lg-3">
                    <div class="medical-team-wrap">
                        <img src="Resources/img/tm-img/team-1.jpg" alt="">
                        <h4 style="margin-top: 32px; font-size: 18px; font-weight: 600; color: #404040">Christinne Smith</h4>
                        <h5 style="margin-top: 12px; font-size: 14px; font-weight: 600; color: #828282">PHD Surgeon</h5>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-3 mt-5 mt-md-0">
                    <div class="medical-team-wrap">
                        <img src="Resources/img/tm-img/team-2.jpg" alt="">
                        <h4>Anna Gustav</h4>
                        <h5>PHD Surgeon</h5>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                    <div class="medical-team-wrap">
                        <img src="Resources/img/tm-img/team-3.jpg" alt="">
                        <h4>Phillip Williams</h4>
                        <h5>PHD Surgeon</h5>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                    <div class="medical-team-wrap">
                        <img src="Resources/img/tm-img/team-4.jpg" alt="">
                        <h4>Gina James</h4>
                        <h5>PHD Surgeon</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
