angular.module 'companier'
.factory 'Catalog', ['$resource', ($resource)->
  $resource '/catalog/:id', id: '@_id'
]