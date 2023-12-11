<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="appSeguimientoProspectos.Contact" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="width: 60vw;">
                    <h3>Capturar nuevo prospecto</h3>
<p>Ingrese la información correspondiente en los siguientes campos.</p>
    </div>
            
    <div class="container mb-5 overflow-auto" style="width: 60vw; max-height: 60vh;">
  <div class="card-body">
        <div class="row">
            <div class="col mb-3">
                <label Class="form-label">Nombre(s)</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">Primer Apellido</label>
                <asp:TextBox ID="txtPrimerApe" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">Segundo Apellido</label>
                <asp:TextBox ID="txtSegundoApe" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label Class="form-label">Colonia</label>
                <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">Calle</label>
                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">Número</label>
                <asp:TextBox ID="txtNumeroDom" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label Class="form-label">Código postal</label>
                <asp:TextBox ID="txtCodigoPos" runat="server" CssClass="form-control" aria-label="Small" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col mb-3">
                <label Class="form-label">RFC</label>
                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
        </div>
        <div ID="ContCardSbmDocs" style="width: 55vw; height: 30vh;" class="card">
            <div class="card-header">
                Captura de documentos
            </div>
            <div class="card-body">
                <p class="card-text">Se deberá seleccionar un archivo a la vez. Los archivos que subas no deben de ser mayores a 4 mb.</p>
                <asp:FileUpload ID="fuDocs" runat="server" CssClass="custom-file-input"/>
                <br />
                <div class="col text-center">
                <asp:Button ID="btnGuardarDocs" OnClick="BtnGuardarDocs_Click" runat="server" Text="Agregar documento" CssClass="btn btn-primary regular-button" />
            </div>
                </div>
        </div>
        <div class="col text-center">
            <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx" CssClass="btn btn-warning regular-button mt-2">Volver al inicio</asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-success regular-button mt-2">Guardar</asp:LinkButton>
    	</div>	
  </div>
</div>
    
        <%-- 
    <div class="mb-3">
        <label Class="form-label">Colonia</label>
        <asp:TextBox ID="txtColonia" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Código postal</label>
        <asp:TextBox ID="txtCodigoPos" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Teléfono</label>
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">RFC</label>
        <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-sm btn-primary" OnClick="BtnEnviar_Click"/>
    --%>
</asp:Content>
