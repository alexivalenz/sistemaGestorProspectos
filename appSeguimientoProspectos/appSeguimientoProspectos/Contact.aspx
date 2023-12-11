<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="appSeguimientoProspectos.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblTitulo" runat="server" CssClass="fs-4 fw-bold"></asp:Label>
    <div class="mb-3">
        <label Class="form-label">Nombre(s)</label>
        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Primer apellido</label>
        <asp:TextBox ID="txtPrimerApe" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Segundo Apellido</label>
        <asp:TextBox ID="txtSegundoApe" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Calle</label>
        <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <div class="mb-3">
        <label Class="form-label">Número</label>
        <asp:TextBox ID="txtNumeroDom" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
    </div>
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
    <asp:LinkButton runat="server" PostBackUrl="~/Default.aspx" CssClass="btn btn-sm btn-warning">Volver al inicio</asp:LinkButton>
</asp:Content>
