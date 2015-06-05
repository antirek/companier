angular.module 'companier'
.controller 'CompanyNewController', [
  '$scope',
  '$state',
  'Company',
  'Category',
  ($scope, $state, Company, Category)->
    $scope.categories = Category.query()
    $scope.company = new Company
      filials: []
      category: []
    $scope.save = ()->
      $scope.company.$save ()->
        $state.go 'company', {}, reload: true

    $scope.addFilial = ()->
      $scope.company.filials.push
        address: ''
        phone: ''
    $scope.removeFilial = (index)->
      $scope.company.filials.splice index, 1
]