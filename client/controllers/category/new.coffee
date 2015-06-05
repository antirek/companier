angular.module 'companier'
.controller 'CategoryNewController', [
  '$scope',
  '$state',
  'Category',
  ($scope, $state, Category)->
    $scope.category = new Category()
    $scope.save = ()->
      $scope.category.$save ()->
        $state.go 'category', {}, reload: true


]