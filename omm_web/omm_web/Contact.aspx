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
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;Contact Us
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ftco-section contact-section" style="padding: 7em 0;">
        <div class="container">
            <div class="row block-9">
                <div class="col-md-6 pr-md-5">
                    <h5>Send your inquiries to us</h5>
                    <br />
                    <br />
                    <div class="form-group">
                        <input type="text" runat="server" id="fldName" class="form-control" placeholder="Your Name">
                    </div>
                    <div class="form-group">
                        <input type="text" runat="server" id="fldEmail" class="form-control" placeholder="Your Email">
                    </div>
                    <div class="form-group">
                        <input type="text" runat="server" id="fldSubject" class="form-control" placeholder="Subject">
                    </div>
                    <div class="form-group">
                        <textarea name="" runat="server" id="fldMessage" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                    </div>
                    <div class="form-group">
                        <asp:Button OnClick="btnSubmit_Click" runat="server" Text="Send Message" CssClass="btn btn-primary py-3 px-5"></asp:Button>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5>Find Us</h5>
                    <br />
                    <br />
                    <div style='overflow: hidden; height: 400px; width: 470px;'>
                        <div id='gmap_canvas' style='height: 400px; width: 470px;'></div>
                        <div>
                            <small><a href="https://embedgooglemaps.com/fr/">embedgooglemaps FR</a></small>
                        </div>
                        <div>
                            <small><a href="http://www.stedentrippers.nl/berlijn.html">stedentrippers NL</a></small>
                        </div>
                        <style>
                            #gmap_canvas img {
                                max-width: none !important;
                                background: none !important
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="Resources/js/google-map/google-map.js"></script>
    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script>

    <script type='text/javascript'>
        function init_map() {
            var myOptions = {
                zoom: 14,
                center: new google.maps.LatLng(14.6354804, 121.03107090000003), mapTypeId: google.maps.MapTypeId.ROADMAP
            }; map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
            marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(14.6354804, 121.03107090000003) });
            infowindow = new google.maps.InfoWindow({ content: '<strong>OMM Healthcare Philippine Corporation</strong><br>Cedar Executive Building 2, 26 Timog Avenue, Quezon City, Metro Manila<br>' });
            google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); }); infowindow.open(map, marker);
        } google.maps.event.addDomListener(window, 'load', init_map);

    </script>

</asp:Content>
