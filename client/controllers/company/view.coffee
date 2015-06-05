angular.module 'companier'
.controller 'CompanyViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Company',
  'Category',
  ($scope, $state, $stateParams, Company, Category)->
    $scope.categories = Category.query()
    $scope.company = Company.get id: $stateParams.id
    $scope.save = ()->
      $scope.company.$save ()->
        $state.go 'company', {}, reload: true

    $scope.addFilial = ()->
      $scope.company.filials.push
        address: ''
        phone: ''

    $scope.removeFilial = (index)->
      $scope.company.filials.splice index, 1

    $scope.delete = ()->
      $scope.company.$delete ()->
        $state.go 'category', {}, reload: true
]