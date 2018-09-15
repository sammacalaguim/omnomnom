<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="omm_web.Contact" %>

<asp:Content ID="hdrContact" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us</title>
</asp:Content>
<asp:Content ID="contentContact" ContentPlaceHolderID="content" runat="server">
    <!--Contact Us Header-->
    <div class="breadcumb-area bg-img" style="background-image: url(Resources/img/bg-img/bg-9.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h2>Contact Us</h2>
                        <p>Cras iaculis eleifend arcu, non cursus sem. Morbi viverra varius nisl, ac varius mauris interdum sit amet. Aenean ac fermentum neque.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ftco-section contact-section" style="padding: 7em 0;">
        <div class="container">
            <div class="row block-9">
                <div class="col-md-6 pr-md-5">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Your Name">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Your Email" >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Subject" value="<%=subject%>">
                    </div>
                    <div class="form-group">
                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                    </div>
                </div>
                <div class="col-md-6" id="map"></div>
            </div>
        </div>
    </div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="Resources/js/google-map/google-map.js"></script>

</asp:Content>
