<html ng-app="myApp">

  <head>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.js"></script>
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular.min.js"></script>
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-animate.min.js"></script>
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.5/angular-resource.min.js"></script>
    <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.14.3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.css">
    
    <script type='text/javascript' src="https://rawgit.com/long2know/angular-directives-general/master/src/multiselect.js"></script>
    <style>
    multiselect {
  display: block;
}

multiselect > .btn-group {
  min-width: 180px;
}

multiselect .btn {
  width: 100%;
  background-color: #FFF;
}

multiselect .btn.has-error {
  border: 1px solid #a94442 !important;
  color: #db524b;
}

multiselect .dropdown-menu {
  max-height: 300px;
  min-width: 200px;
  overflow-y: auto;
}

multiselect .dropdown-menu .filter > input {
  width: 99%;
}

multiselect .dropdown-menu .filter .glyphicon {
  cursor: pointer;
  pointer-events: all;
}

multiselect .dropdown-menu {
  width: 100%;
  box-sizing: border-box;
  padding: 2px;
}

multiselect > .btn-group > button {
  padding-right: 20px;
}

multiselect > .btn-group > button > .caret {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 4px solid black;
  right: 5px;
  top: 45%;
  position: absolute;
}

multiselect .dropdown-menu > li > a {
  padding: 3px 10px;
  cursor: pointer;
}

multiselect .dropdown-menu > li > a i {
  margin-right: 4px;
}

    
    </style>
  </head>
  <body ng-controller="testCtr">
    
    <multiselect class='input-xlarge multiselect' ng-model='myColor' header='Select Color' options='row.firstName for row in ccResource' multiple='true' required enable-filter='true' filter-placeholder='Filter stuff..'></multiselect>
    <button class="btn save-cat" ng-click="test();">MultiSelect in Modal</button>  
    <br>
    <br>
    
    <div class="selectRow" style="width:500px">
        <!-- Using data-placeholder below to set place holder value versus putting in configuration -->
        <select id="multipleSelectExample" data-placeholder="Select an option" multiple style="width:500px">
          <option ng-repeat="row in ccResource"
										value="{{row.resourceId}}">{{row.firstName}}
										{{row.lastName}}</option>
        </select>
  </div>
  <script>
  var myApp = angular.module('myApp', [ 'long2know','ui.bootstrap']);

  myApp.controller('testCtr', function($scope, $uibModal, $http){
     $scope.test = function(){
        $scope.colors = [
        {name:'black'},
        {name:'white'},
        {name:'red'},
        {name:'blue'},
        {name:'purple'},
        {name:'pink'},
        {name:'brown'},
        {name:'yellow'}
      ];
        $http
		.get(
				'http://localhost:8080/projectMatrix/getCcResource')
		.then(function(response) {
			$scope.ccResource = response.data;
		});

      $uibModal.open({
          template: "<multiselect class='input-xlarge multiselect' ng-model='myColor' header='Select Color' options='row.firstName for row in ccResource' multiple='true' required enable-filter='true' filter-placeholder='Filter stuff..'></multiselect>",
          controller: 'newCtrl',
          resolve: {
            colors: function() {
              return $scope.colors;
            }
          }
        });
       }
  });
          
  myApp.controller('newCtrl', function($scope, colors){ 
    $scope.colors = colors;
  });

  $(document).ready(
      function () {
          $("#multipleSelectExample").select2();
      }
  );

  </script>
  </body>
  
  
</html>

