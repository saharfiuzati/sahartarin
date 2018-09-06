<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Sahartarin.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditLink
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% Html.EnableClientValidation(); %>
<%: Html.ValidationSummary("Please correct the errors and try again.") %>
    <h2>EditLink</h2>
     <% using (Html.BeginForm())
         
       {%>
    <fieldset>
        <p>
            <label for="Title">
                Title:</label>
            <%= Html.TextBox("Title",Model.Title) %>
            <%= Html.ValidationMessage("Title", "*") %> 
        </p>
        <p>
            <label for="Description">
                Description:</label>
            <%= Html.TextBox("Description",Model.Description)%>
             <%= Html.ValidationMessage("Description", "*") %> 
        </p>
        <p>
            <label for="URL">
                URL:</label>
            <%= Html.TextBox("URL",Model.URL)%>
             <%= Html.ValidationMessage("URL", "*") %> 
        </p>
        <p>
            <label for="Category">
                Category:</label>
            <%= Html.DropDownList("CategoryID",ViewData["CategoryList"] as SelectList)%>

             <%= Html.ValidationMessage("Category", "*") %> 
        </p>
        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
    <% } %>
</asp:Content>
