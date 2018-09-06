<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Sahartarin.Models.Link>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Links
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Links</h2>
    <fieldset>
        <% foreach (var lnk in Model)
           {%>
        <li>Title:
           <%= Html.ActionLink(lnk.Title, "Details", new { id=lnk.ID }) %>
            <br />
            <br />
            <%= Html.Encode(lnk.Description.ToString()) %>
            
        </li>
        <br />
        <% Sahartarin.Models.UserRepository  us = new Sahartarin.Models.UserRepository();
           Sahartarin.Models.LinkRepository link=new Sahartarin.Models.LinkRepository();
            int userid = us.GetUserID(User.Identity.Name.ToString());
            if (link.IsHostedBy(userid,lnk)) { %> 
        <%= Html.ActionLink("Edit Link", "EditLink", new { id=lnk.ID }) %> | <%= Html.ActionLink("Delete Link", "DeleteLink", new { id=lnk.ID }) %>
        <% } %> 
        <%} %>
           
    </fieldset>
   
</asp:Content>
