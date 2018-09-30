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
                    <div class="form-group row">
                        <label for="fldName" class="col-sm-3 col-form-label">Name<font color="red">*</font></label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" ID="fldName" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:RequiredFieldValidator ID="rfvName"
                                runat="server" ControlToValidate="fldName"
                                ErrorMessage="!" ForeColor="Red" Font-Bold="true" ValidationGroup='valGroupEmail'>
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fldEmail" class="col-sm-3 col-form-label">Email<font color="red">*</font></label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" ID="fldEmail" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:RequiredFieldValidator ID="rfvEmail"
                                runat="server" ControlToValidate="fldEmail"
                                ErrorMessage="!" ForeColor="Red" Font-Bold="true" ValidationGroup='valGroupEmail'>
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fldSubject" class="col-sm-3 col-form-label">Subject<font color="red">*</font></label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" ID="fldSubject" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:RequiredFieldValidator ID="rfvSubject"
                                runat="server" ControlToValidate="fldSubject"
                                ErrorMessage="!" ForeColor="Red" Font-Bold="true" ValidationGroup='valGroupEmail'>
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fldMessage" class="col-sm-3 col-form-label">Message<font color="red">*</font></label>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" ID="fldMessage" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:RequiredFieldValidator ID="rfvMessage"
                                runat="server" ControlToValidate="fldMessage"
                                ErrorMessage="!" ForeColor="Red" Font-Bold="true" ValidationGroup='valGroupEmail'>
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button OnClick="btnSubmit_Click" ValidationGroup='valGroupEmail' runat="server" Text="Send Message" CssClass="btn btn-primary py-3 px-5"></asp:Button>
                    </div>
                </div>
                <div class="col-md-6">
                    <h5>Find Us</h5>
                    <br />
                    <br />
                    <div class="mapouter">
                        <div class="gmap_canvas">
                            <iframe width="470" height="400" id="gmap_canvas" src="https://maps.google.com/maps?q=69%20Sct.%20Tobias%20St%2C%20Diliman%2C%20Quezon%20City%2C%201103%20Metro%20Manila&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                            <a href="https://www.crocothemes.net">crocothemes.net</a>
                        </div>
                        <style>
                            .mapouter {
                                text-align: right;
                                height: 400px;
                                width: 470px;
                            }

                            .gmap_canvas {
                                overflow: hidden;
                                background: none !important;
                                height: 400px;
                                width: 470px;
                            }
                        </style>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
