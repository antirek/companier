angular.module 'companier'
.controller 'CompanyViewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Company',
  'Category',
  'FileUploader',
  ($scope, $state, $stateParams, Company, Category, FileUploader)->
    $scope.categories = Category.query()
    $scope.company = Company.get id: $stateParams.id
    $scope.save = ()->
      if $scope.lastFile
        $scope.uploader.uploadItem $scope.lastFile
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

    $scope.uploader = new FileUploader
      url: "/saveImage/#{$stateParams.id}"

    $scope.uploader.filters.push
      push: 'image'
      fn: (item)->
        extension = item.name.slice item.name.lastIndexOf('.') + 1
        -1 != 'jpg|png|jpeg|bmp|gif'.indexOf(extension)

    $scope.uploader.onAfterAddingFile = (item)->
      $scope.lastFile = item
]