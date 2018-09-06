<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Sahartarin.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>
    <fieldset>
        <legend>Fields</legend>
        <p>
            LinkID:
            <%= Html.Encode(Model.ID) %>
        </p>
        <p>
            Title:
            <%= Html.ActionLink(Model.Title,Model.URL) %>
        </p>
        <p>
            Descrption:
            <%= Html.Encode(Model.Description) %>
        </p>
        <p>
            By:
            <%= Html.Encode(Model.User.UserName) %>
        </p>
         <p> 
            EventDate: 
            <%= Html.Encode(String.Format("{0:g}", Model.SendingTime)) %> 
        </p> 
         <p> 
            Tags: 
            <%= Html.Encode(Model.Tag_Link) %> 
        </p> 
        <p>
            people that voted:
            <%= Html.Encode(Model.Votes) %>
        </p>
    </fieldset>
</asp:Content>
