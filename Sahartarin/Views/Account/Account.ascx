<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Sahartarin.Models.User>" %>

                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Country) %>
                </div>
                <%: Html.DropDownList("Country", ViewData["CountryList"] as SelectList)%>

                 <div class="editor-label">
                    <%: Html.LabelFor(m => m.WebSite) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.WebSite) %>
                    <%: Html.ValidationMessageFor(m => m.WebSite) %>
                </div>