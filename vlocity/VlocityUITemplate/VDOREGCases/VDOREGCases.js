vlocity.cardframework.registerModule.controller('siController_logae', ['$rootScope', '$scope', '$filter', function($rootScope, $scope, $filter, $route) {

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


}]);