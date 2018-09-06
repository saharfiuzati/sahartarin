<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Sahartarin.Models.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowCategory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ShowCategory</h2>
     <fieldset>
     
    <ul>
    Name:
        <%foreach (var cat in Model) {%> 
        <li>
            
            <%= Html.ActionLink(cat.CategoryName, "Links", new { id = cat.ID })%>
        </li>
       <%} %>
    </ul>
    </fieldset>
</asp:Content>
