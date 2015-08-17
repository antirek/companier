angular.module 'companier'
.controller 'ItemsListController', [
  '$scope',
  '$state',
  'Catalog',
  'Item',
  ($scope, $state, Catalog, Item)->
    $scope.catalogs = []
    $scope.catalogs = Catalog.query()
    $scope.selected_catalog = ''
    $scope.items = []
    $scope.updateItems = ()->
      $scope.items = Item.query
        $filter:
          catalog_id: $scope.selected_catalog
      $state.go 'item'

]