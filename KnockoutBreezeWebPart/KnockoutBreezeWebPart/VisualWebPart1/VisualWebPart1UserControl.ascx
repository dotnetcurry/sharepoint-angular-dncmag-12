<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1UserControl.ascx.cs" Inherits="KnockoutBreezeWebPart.VisualWebPart1.VisualWebPart1UserControl" %>
<link href="/_layouts/15/Scripts/bootstrap.min.css" rel="stylesheet" />
<script src="/_layouts/15/Scripts/jquery-2.1.0.min.js"></script>
<script src="/_layouts/15/Scripts/knockout-3.1.0.js"></script>
<script src="/_layouts/15/Scripts/bootstrap.min.js"></script>
<script>
    var webSiteURL = "<%= SPContext.Current.Web.Url %>";
    $(function CustomersModel() {
        var self = this;
        self.Customers = ko.observableArray([]);
        $.ajax({
            method: 'GET',
            url: webSiteURL + "/_api/web/lists/getByTitle('Customers')/items?$select=CustomerID,Title,City,Country,ContactNo",
            headers: { "Accept": "application/json;odata=verbose" }
        }).success(function (d) {
            self.Customers = d.d.results;
            ko.applyBindings(self);
        })();
    });
</script>

<h1>WelCome To Knockout JS Web Part !!</h1>
<div class="row">
    <div class="span10">
        <table class="table table-condensed table-hover">
            <tr>
                <th>Customer ID</th>
                <th>Contact Name</th>
                <th>City</th>
                <th>Country</th>
                <th>Contact No</th>
            </tr>
            <tbody data-bind="foreach: Customers">
                <tr>
                    <td>
                        <p data-bind="text: CustomerID"></p>
                    </td>
                    <td>
                        <p data-bind="text: Title"></p>
                    </td>
                    <td>
                        <p data-bind="text: City"></p>
                    </td>
                    <td>
                        <p data-bind="text: Country"></p>
                    </td>
                    <td>
                        <p data-bind="text: ContactNo"></p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
