vlocity.cardframework.registerModule.controller('containerTableCanvarController', ['$rootScope', '$scope', '$filter', function($rootScope, $scope, $filter, $route) {

            $scope.orderByField = 'CustomerType';
            
            $scope.setOrderBy = function(columnName) {
                $scope.orderByField = columnName;
            };
            
            $scope.selectAll = function(value){
                debugger;
                var inputs = document.querySelectorAll(".slds-checkbox input[type='checkbox']");
                for(var i = 0; i < inputs.length; i++) {
                    inputs[i].checked = value;
                }  
                
                if($scope.control) {
                   var filteredValues = $filter('filter')($scope.control.vlcSI[$scope.control.itemsKey], $scope.search);
                   angular.forEach(filteredValues,function(item,index){
                        item.vlcSelected = value;
                        $scope.onSelectItem($scope.control, item, index, $scope);
                   });
               } 
            }
            
            
        console.log($scope);

}]);