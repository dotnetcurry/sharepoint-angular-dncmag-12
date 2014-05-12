var webSiteURL = "<%= SPContext.Current.Web.Url %>";

myAngApp.controller('spCustomerController', function ($scope, $http) {
	$http({
		method: 'GET',
		url: webSiteURL + "/_api/web/lists/getByTitle('Customers')/items?$select=CustomerID,Title,City,Country,ContactNo",
		headers: { "Accept": "application/json;odata=verbose" }
	}).success(function (d, s, h, c) {
		$scope.customers = d.d.results;
	});
});