<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="appSeguimientoProspectos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%-- <div="row">
        <div class="col-12">
            <asp:Button runat="server" OnClick="Nuevo_click" CssClass="btn btn-sm btn-success" Text="Nuevo" />
        </div>
    </div>--%>
    
    <div class="row mx-md-n5w overflow-auto" style="width: 90vw; max-height: 75vh; background-color: rgba(0,0,255,0.1);">
        <asp:Repeater id="cardRep" runat="server">
            <ItemTemplate>
                <div class="col-sm-4 mb-1 mt-1">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title"><%#DataBinder.Eval(Container,"DataItem.Nombre") %> <%#DataBinder.Eval(Container,"DataItem.PrimerApellido") %> <%#DataBinder.Eval(Container,"DataItem.SegundoApellido") %></h5>
                        </div>
                        <div class="card-body">
                            <h6 class="card-subtitle mb-2">Folio: <%#DataBinder.Eval(Container,"DataItem.IdProspecto") %></h6>
                            <p class="card-text mb-2">Estatus del prospecto: <%#DataBinder.Eval(Container,"DataItem.Estatus") %></p>
                            <a href="About.aspx?idProspecto=<%#DataBinder.Eval(Container,"DataItem.IdProspecto") %>" class="btn btn-primary btn-sm">Más información</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <%--<div class="col px-md-5">
            <asp:GridView ID="GVProspectos" runat="server" CssClass="table table-bordered" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="PrimerApellido" HeaderText="Primer apellido" />
                    <asp:BoundField DataField="SegundoApellido" HeaderText="Segundo Apellido" />
                    <asp:BoundField DataField="Estatus" HeaderText="Estatus" />
                    <asp:BoundField DataField="Observaciones" HeaderText="Observaciones" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("IdProspecto")%>'
                                OnClick="MostrarProspecto_click" CssClass="btn btn-sm btn-primary"
                            >Mostrar</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>--%>
    </div>
</asp:Content>
