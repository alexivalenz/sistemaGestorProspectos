<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="appSeguimientoProspectos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div="row">
        <div class="col-12">
            <asp:Button runat="server" OnClick="Nuevo_click" CssClass="btn btn-sm btn-success" Text="Nuevo" />
        </div>
    </div>
    <div="row">
        <div class="col-12">
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
                
        </div>
    </div>
</asp:Content>
