angular.module 'companier'
.controller 'CategoryListController', [
  '$scope',
  'Category',
  ($scope, Category)->
    $scope.categories = []
    $scope.categories = Category.query()
]