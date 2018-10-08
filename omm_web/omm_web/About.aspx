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
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;About Us
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <div class="med-history">
        <div class="container">
            <div class="row align-items-end">                
                <div class="col-12 col-lg-12" align="center">
                    <h2>Who We Are</h2>
                    <p class="col-lg-8">
                        Welcome to your first step to a very prosperous partnership in healthcare. Welcome to OMM HEALTH
                        CARE PHILIPPINES CORPORATION...
                        <br/>
                        You have just stepped into the world of the one, if not the most, highly regarded distributor of Nipro
                        Brand Hemodialysis products in the Philippines.
                        <br/>
                        Established in 2010, OMM HEALTH CARE, have steadily provided top of the line products and world class
                        service to both Hemodialysis Centers and patients.
                        <br/>
                        OMM HEALTH CARE PHILIPPINES CORPORATION and its associates work tirelessly under the company's
                        guiding H.A.R.D. Core values (cool acronym isn’t it?) that have continuously made it a benchmark in
                        healthcare distribution.
                        <br/>
                        The company aims to lessen the burden of Hemodialysis centers, and patients undergoing treatment by
                        consistently providing reliable high-quality products and services at a competitive rate during their road
                        to recovery.
                        <br/>
                        OMM HEALTH CARE PHILIPPINES CORPORATION's unceasing dedication lies in its vision of having the
                        privilege of maintaining a nationwide partnership in renal care and treatment to give patients' their
                        much-deserved opportunity to focus and maximize high-quality life every day.
                        <br/>
                        Now that you know what OMM HEALTH CARE PHILIPPINES CORPORATION is all about...
                        <br/>
                        Welcome to your first step towards the right direction in Healthcare Distribution, and yes, the company
                        really does have H.A.R.D. Core values...
                    </p>
                </div>   
                <div class="col-12 col-lg-12 mt-5 mt-lg-0" align="center">
                    <br/><br/><br/><br/><br/><br/>
                    <%--<img class="responsive" src="Resources/img/core-img/about.jpg" alt="">--%>
                    <h4>H.A.R.D. CORE VALUES</h4>
                    <br/><br/>
                    <p class="col-lg-8">                        
                        <b><u>HIGH-QUALITY</u></b>
                        <br/>
                        Products and services offered by OMM Health Care Philippines Corp. are always top of the line and
                        world class which eases the burden for both patients and healthcare workers.
                        <br/><br/>
                        <b><u>AFFORDABILITY</u></b>
                        <br/>
                        OMM Health Care Philippines Corp. products and services are priced at cost-effective rates that
                        genuinely consider the value of renal care expenses.
                        <br/><br/>
                        <b><u>RELIABILITY AND DEDICATION</u></b>
                        <br/>
                        OMM Health Care Philippines Corp. is committed to bringing the best to our partners. The company is
                        known for its dedication to delivering what, when, how, and where it promises to deliver over and over
                        again.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <%--<div class="medical-team">
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
    </div>--%>
</asp:Content>
