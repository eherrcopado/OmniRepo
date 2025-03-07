vlocity.cardframework.registerModule.controller('siController_oz4r5', ['$rootScope', '$scope', '$filter', function($rootScope, $scope, $filter, $route) {

            // Wraps functions in an error catcher to return a default value
            // Errors happen a lot when the selectable item does not yet have data
            function trier(x, defvalue) {
                return function () {
                    try {
                        return x();
                    } catch (e) {
                        // console.log(e);
                    }
                    return defvalue;
                }
            }

            $scope.showList = trier(function() {
                try {
                    if ($scope.control.vlcSI[$scope.control.itemsKey].length >= 0) {
                        return true;
                    }
                } catch (e) {
                    // Nothing
                }
                return false;
            },false);

            $scope.orderByField = '';	// Replace with a column name if you wish a default sorting
            
            $scope.setOrderBy = function(columnName) {
               if ($scope.orderByField === columnName) {
                   $scope.orderByField = "-" + columnName;
               } else if ($scope.orderByField == "-"+columnName) {
                   $scope.orderByField = ""
               } else {
                   $scope.orderByField = columnName;
               }
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
            

}]);

baseCtrl.prototype.$scope.doSelectAll = function(ctrl,ths) {
  for (let i=0;i<ctrl.vlcSI.recSet.length;i++) {
    ctrl.vlcSI.recSet[i]['vlcSelected'] = false;
    baseCtrl.prototype.$scope.onSelectItem(ctrl, ctrl.vlcSI.recSet[i], i, ths, true);
  }
}

baseCtrl.prototype.$scope.doDeselectAll = function(ctrl,ths) {
  for (let i=0;i<ctrl.vlcSI.recSet.length;i++) {
    ctrl.vlcSI.recSet[i]['vlcSelected'] = true;
    baseCtrl.prototype.$scope.onSelectItem(ctrl, ctrl.vlcSI.recSet[i], i, ths, true);
  }
}