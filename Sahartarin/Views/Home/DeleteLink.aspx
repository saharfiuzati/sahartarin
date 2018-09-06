<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Sahartarin.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete Confirmation: <%=Html.Encode(Model.Title) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2> 
        Delete Confirmation 
    </h2> 
 
    <div> 
        <p>Please confirm you want to cancel the Link titled:  
        <i> <%=Html.Encode(Model.Title) %>? </i> </p> 
    </div> 
     
    <% using (Html.BeginForm()) { %> 
 
        <input name="confirmButton" type="submit" value="Delete" />         
 
    <% } %> 

</asp:Content>
