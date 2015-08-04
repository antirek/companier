angular.module 'companier'
.controller 'CatalogListController', [
  '$scope',
  'Catalog',
  ($scope, Catalog)->
    $scope.catalogs = []
    $scope.catalogs = Catalog.query()
]