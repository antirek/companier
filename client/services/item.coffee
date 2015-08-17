angular.module 'companier'
.factory 'Item', ['$resource', ($resource)->
  $resource '/item/:id', id: '@_id'
]