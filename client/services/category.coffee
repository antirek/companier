angular.module 'companier'
.factory 'Category', ['$resource', ($resource)->
  $resource '/category/:id', id: '@_id'
]