angular.module 'companier'
.controller 'CategoryViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Category',
  ($scope, $state, $stateParams, Category)->
    $scope.category = Category.get id: $stateParams.id
    $scope.save = ()->
      $scope.category.$save ()->
        $state.go 'category', {}, reload: true
    $scope.delete = ()->
      $scope.category.$delete ()->
        $state.go 'category', {}, reload: true
]