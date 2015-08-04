angular.module 'companier'
.controller 'CatalogNewController', [
  '$scope',
  '$state',
  'Random',
  'Catalog',
  'Company',
  ($scope, $state, Random, Catalog, Company)->
    $scope.companies = Company.query()
    $scope.catalog = new Catalog
      items: []
      groups: []
    $scope.save = ()->
      $scope.catalog.$save ()->
        $state.go 'catalog', {}, reload: true

    $scope.addGroup = ()->
      $scope.catalog.groups.push
        name: ''
        id: Random.getRandomString()
    $scope.removeGroup = (index)->
      $scope.catalog.groups.splice index, 1

    $scope.addItem = ()->
      $scope.catalog.items.push
        group_id: ''
        name: ''
        description: ''
        image: ''

    $scope.removeItem = (index)->
      $scope.catalog.items.splice index, 1


]