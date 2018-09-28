﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="omm_web.AddProduct" %>
<asp:Content ID="contentAddProduct" ContentPlaceHolderID="content" runat="server">
    <div class="breadcumb-area bg-img" style="background-image: url(img/bg-img/bg-8.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12 col-md-6">
                    <div class="breadcumb-text">
                        <h2>Maintenance: Product</h2>
                        <p style="color: white;">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/Default.aspx" ForeColor="White">Home</asp:HyperLink>
                            &nbsp;/&nbsp;Maintenance&nbsp;/&nbsp;Product
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ftco-section contact-section">
        <div class="container">
            <div class="row block-9">
                <div class="col-md-9 pr-md-5">
                    <h5>Instructions</h5>
                    <u>Add Product:</u>
                    <p>To add a new product, just fill out the form on the right then click submit.<br/><i>Note:</i>&nbsp;&nbsp;&nbsp;
                        Before submitting the form, please make sure to fill out the required fields which is mark with <font color="red">*</font> symbol.
                        <br/><b>1.</b> For picture uploading, in case that there is no image applicable for the article, you may choose the provided default image (default-prod.jpg)
                        to avoid inconsistency on the layout.
                    </p>
                    <u>Edit Product:</u>
                    <p>To edit a product, first, you must download the latest <u>Data.xls</u> using the Download button below.
                        You may edit the product by finding your entry on the Products sheet on the excel file. After editing, you can upload it
                        by browsing the file you have edited (make sure that your file name is still Data.xls, otherwise, it might cause an error
                        or your update may not be read.). Then, click the Upload button.<br/><i>Note:</i>&nbsp;&nbsp;&nbsp;Please verify if your changes has taken effect
                        by checking it on the Products tab at the navigation above.
                    </p>
                    <u>Delete Product:</u>
                    <p>To delete a product, please refer to the edit product section.<br/><i>Note:</i>&nbsp;&nbsp;&nbsp;When deleting a data, please make sure
                        that there will be no space between the rows as it may cause error on the website.
                    </p>
                </div>
                
                <div class="col-md-6 pr-md-5">
                    <h3>Add New Product</h3>
                    <br />
                    <div class="form-group row">
                        <label for="fldTitle" class="col-sm-2 col-form-label">Title<font color="red">*</font></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="Title" runat="server" id="fldTitle">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fldSubtitle" class="col-sm-2 col-form-label">Subtitle</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" placeholder="Subtitle" runat="server" id="fldSubtitle">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="pictureFormControlFile" class="col-sm-2 col-form-label">Picture<font color="red">*</font></label>
                        <div class="col-sm-10">
                            <asp:FileUpload CssClass="form-control-file" ID="pictureFormControlFile" runat="server"></asp:FileUpload>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="minipictureFormControlFile" class="col-sm-2 col-form-label">Mini Picture<font color="red">*</font></label>
                        <div class="col-sm-10">
                            <asp:FileUpload CssClass="form-control-file" ID="minipictureFormControlFile" runat="server"></asp:FileUpload>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="fldDescription" class="col-sm-2 col-form-label">Description<font color="red">*</font></label>
                        <div class="col-sm-10">
                            <textarea name="" id="fldDescription" cols="30" rows="7" class="form-control" placeholder="Description" runat="server"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button runat="server" Text="Submit" CssClass="btn btn-primary py-3 px-5" id="btnSubmit" OnClick="btnSubmit_Click" OnClientClick="validateSubmit()"></asp:Button>
                    </div>
                </div>
                <div class="col-md-6 pr-md-5">   
                    <h3>Data File Modification</h3>
                    <br />
                    <div class="form-group">
                        <label for="dataUploadFormControlFile">Upload Data File</label>                        
                        <asp:FileUpload class="form-control-file" id="dataUploadFormControlFile" runat="server"></asp:FileUpload>
                        <br/>
                        <asp:Button CssClass="btn btn-primary col-md-3" id="dataUploadFormControlButton" runat="server" Text="Upload" OnClick="dataUploadFormControlButton_Click"></asp:Button>
                    </div>
                    <div class="form-group">
                        <label for="dataDownloadFormControlFile">Download Data File</label> 
                        <br/>
                        <asp:Button CssClass="btn btn-primary col-md-3" id="dataDownloadFormControlFile" runat="server" Text="Download" OnClick="dataDownloadFormControlFile_Click"></asp:Button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</asp:Content>
