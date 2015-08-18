angular.module 'companier'
.controller 'CatalogViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Random',
  'Catalog',
  'Company',
  'FileUploader',
  ($scope, $state, $stateParams, Random, Catalog, Company)->
    $scope.companies = Company.query()

    $scope.catalog = Catalog.get id: $stateParams.id
    $scope.save = ()->
      $scope.catalog.$save ()->
        $state.go 'catalog', {}, reload: true

    $scope.addGroup = ()->
      $scope.catalog.groups.push
        name: ''
        id: Random.getRandomString()

    $scope.removeGroup = (index)->
      $scope.catalog.groups.splice index, 1

    $scope.delete = ()->
      $scope.catalog.$delete ()->
        $state.go 'catalog', {}, reload: true
]
