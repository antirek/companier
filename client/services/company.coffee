angular.module 'companier'
.factory 'Company', ['$resource', ($resource)->
  $resource '/company/:id', id: '@_id'
]