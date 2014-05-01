<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VisualWebPart1UserControl.ascx.cs" Inherits="AngularJSWebPart.VisualWebPart1.VisualWebPart1UserControl" %>
<link href="/_layouts/15/Scripts/bootstrap.min.css" rel="stylesheet"/>
<script src="/_layouts/15/Scripts/angular.min.js"></script>
<script src="/_layouts/15/Scripts/bootstrap.min.js"></script>
<script>
    var webSiteURL = "<%= SPContext.Current.Web.Url %>";
    var myAngApp = angular.module('SharePointAngApp', []);
    myAngApp.controller('spCustomerController', function ($scope, $http) {
        $http({
            method: 'GET',
            url: webSiteURL + "/_api/web/lists/getByTitle('Customers')/items?$select=CustomerID,Title,City,Country,ContactNo",
            headers: { "Accept": "application/json;odata=verbose" }
        }).success(function (d, s, h, c) {
            $scope.customers = d.d.results;
        });
    });
</script>

<h1>WelCome To Angular JS Web Part !!</h1>

<div ng-app="SharePointAngApp" class="row">
    <div ng-controller="spCustomerController" class="span10">
        <table class="table table-condensed table-hover">
            <tr>
                <th>Customer ID</th>
                <th>Contact Name</th>
                <th>City</th>
                <th>Country</th>
                <th>Contact No</th>
            </tr>
            <tr ng-repeat="customer in customers">
                <td>{{customer.CustomerID}}</td>
                <td>{{customer.Title}}</td>
                <td>{{customer.City}}</td>
                <td>{{customer.Country}}</td>
                <td>{{customer.ContactNo}}</td>
            </tr>
        </table>
    </div>
</div>
