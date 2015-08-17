angular.module 'companier'
.controller 'ItemsNewController', [
  '$scope',
  '$state',
  '$stateParams',
  'Catalog',
  'Item',
  'Random',
  'FileUploader',
  ($scope, $state, $stateParams, Catalog, Item, Random, FileUploader)->
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

    $scope.catalog = Catalog.get id: $stateParams.catalog_id, ()->
      if !$scope.catalog
        $state.go 'Item'
    $scope.item = new Item
      name: ''
      catalog_id: $stateParams.catalog_id
      group_id: ''
      description: ''
      images: []
    $scope.addImage = ()->
      if $scope.item.images.length < 10
        randomString = Random.getRandomString 12
        $scope.item.images.push
          name: ''
          hash: randomString
        createUploader randomString

    $scope.removeImage = (index)->
      delete $scope.images[$scope.item.images[index].hash]
      $scope.item.images.splice index, 1

    $scope.save = ()->
      for key of $scope.images
        image = $scope.images[key]
        if image.file
          image.uploader.uploadItem image.file
      $scope.item.$save ()->
        $state.go 'item', {}, reload: true


]