angular.module 'companier'
.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise '/'

  $stateProvider
  .state
      name: 'main'
      url: '/'
  .state
      name: 'category'
      url: '/category'
      views:
        list:
          controller: 'CategoryListController'
          templateUrl: '/partials/category/list'
  .state
      name: 'category.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'CategoryViewController'
          templateUrl: '/partials/category/view'
  .state
      name: 'category.new'
      url: '/new'
      views:
        'data@':
          controller: 'CategoryNewController'
          templateUrl: '/partials/category/new'
  .state
      name: 'company'
      url: '/company'
      views:
        list:
          controller: 'CompanyListController'
          templateUrl: '/partials/company/list'
  .state
      name: 'company.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'CompanyViewController'
          templateUrl: '/partials/company/view'
  .state
      name: 'company.new'
      url: '/new'
      views:
        'data@':
          controller: 'CompanyNewController'
          templateUrl: '/partials/company/new'
  .state
      name: 'catalog'
      url: '/catalog'
      views:
        list:
          templateUrl: '/partials/catalog/list'
          controller: 'CatalogListController'
  .state
      name: 'catalog.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'CatalogViewController'
          templateUrl: '/partials/catalog/view'
  .state
      name: 'catalog.new'
      url: '/new'
      views:
        'data@':
          controller: 'CatalogNewController'
          templateUrl: '/partials/catalog/new'
  .state
      name: 'item'
      url: '/item'
      views:
        list:
          templateUrl: '/partials/item/list'
          controller: 'ItemsListController'
  .state
      name: 'item.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'ItemsViewController'
          templateUrl: '/partials/item/view'
  .state
      name: 'item.new'
      url: '/new/:catalog_id'
      views:
        'data@':
          controller: 'ItemsNewController'
          templateUrl: '/partials/item/new'

]