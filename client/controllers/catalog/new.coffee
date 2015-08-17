angular.module 'companier'
.controller 'CatalogNewController', [
  '$scope',
  '$state',
  'Random',
  'Catalog',
  'Company',
  'FileUploader',
  ($scope, $state, Random, Catalog, Company, FileUploader)->
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



]