<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Sahartarin.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Link Deleted 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <h2>Link Deleted</h2> 
 
    <div> 
        <p>Your link was successfully deleted.</p> 
    </div> 
    <div> 
        <p><a href="/home/showcategory">Click for other links</a></p> 
    </div> 

</asp:Content>
