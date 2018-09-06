<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Sahartarin.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    SetLink
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <script type="text/javascript" src="../../Content/javascript/jquery-1.2.3.js">
</script>
    <h2>
        SetLink</h2>
    <% using (Html.BeginForm())
       {%>
    <fieldset>
        <p>
            <label for="Title">
                Title:</label>
            <%= Html.TextBox("Title") %>
        </p>
        <p>
            <label for="Description">
                Description:</label>
            <%= Html.TextBox("Description")%>
        </p>
        <p>
            <label for="URL">
                URL:</label>
            <%= Html.TextBox("URL")%>
         
        </p>
        <p>
            <label for="Category">
                Category:</label>
            <%= Html.DropDownList("CategoryID",ViewData["CategoryList"] as SelectList)%>
       </p>
       <%: Html.Partial("TagCloud") %> 
           <script type="text/javascript">

               $("#Submit").click(function () {
                   $.post(<%= Url.Action("SetLink") %>, $("form").serialize(), insertCallback);
               });

               function insertCallback(result) {
                   if (result == "success") {
                       alert("link added!");
                   } else {
                       alert("Could not add link!");
                   }
               }
</script>

        <p>
            <input type="Submit" id="Submit" value="Submit"/> 
            
     </p>
    </fieldset>
    <% } %>
   

</asp:Content>
