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
      for key of $scope.images
        image = $scope.images[key]
        if image.file
          image.uploader.uploadItem image.file
      $scope.catalog.$save ()->
        $state.go 'catalog', {}, reload: true

    $scope.addGroup = ()->
      $scope.catalog.groups.push
        name: ''
        id: Random.getRandomString()

    $scope.removeGroup = (index)->
      $scope.catalog.groups.splice index, 1
    $scope.images = {}
    createUploader = (string)->
      uploader = new FileUploader
        url: "/saveImage/#{string}"
      uploader.filters.push
        push: 'image'
        fn: (item)->
          extension = item.name.slice item.name.lastIndexOf('.') + 1
          -1 != 'jpg|png|jpeg|bmp|gif'.indexOf(extension)

      uploader.onAfterAddingFile = (item)->
        $scope.images[string].file = item
      $scope.images[string] =
        uploader: uploader
        file: null

    $scope.addItem = ()->
      randomString = Random.getRandomString 12
      createUploader randomString
      $scope.catalog.items.push
        group_id: ''
        name: ''
        description: ''
        image: randomString
    $scope.removeItem = (index)->
      delete $scope.images[$scope.catalog.items[index].image]
      $scope.catalog.items.splice index, 1


]