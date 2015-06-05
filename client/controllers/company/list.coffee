angular.module 'companier'
.controller 'CompanyListController', [
  '$scope',
  'Company',
  ($scope, Company)->
    $scope.companies = []
    $scope.companies = Company.query()
]