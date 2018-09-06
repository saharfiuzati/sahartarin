<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	 <title>You Don't Own This Link</title> 
</asp:Content> 
 
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server"> 
    <h2>Error Accessing Link</h2> 
 
    <p>Sorry - but only the host of a Link can edit or delete it.</p> 

</asp:Content>
