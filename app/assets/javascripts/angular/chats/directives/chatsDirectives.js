var chatsModule = angular.module('chatsModule');

chatsModule.directive('ngEnter', function() {
return function(scope, element, attrs) {
    element.bind("keydown keypress", function(event) {
      if(event.which === 13) {
				if (scope.$root.$$phase != '$apply' && scope.$root.$$phase != '$digest') {
	        scope.$apply(function(){
	          scope.$eval(attrs.ngEnter, {'event': event});
	        });
	        event.preventDefault();
				}
      }
    });
  };
});

chatsModule.directive('ngNickname', function() {
	return {
		restrict: 'A',
		require: '^ngModel',
		replace: true,
		scope: {
			thisId: '@thisId',
			lastId: '@lastId',
			message: '='
		},
		template: '<div class="{{ nicknameClass }}"><strong class="nickname">{{ message.user.nickname }} </strong>said:</div>',
		link: function(scope, elem, attrs) {
			console.log(scope.thisId + ' and ' + scope.lastId + attrs.index);
			if (scope.thisId == scope.lastId){
				console.log('ids are the same');
				scope.nicknameClass="ng-hide";
			}
			else {
				scope.nicknameClass="";
			}
		}
	}
});

chatsModule.directive('xngFocus', function(){
	return function(scope, element, attrs) {
		scope.$watch(attrs.xngFocus,
			function (newValue) {
				newValue && element.focus();
			}, true);
		};
});