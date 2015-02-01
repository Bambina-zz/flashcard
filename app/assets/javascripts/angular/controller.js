(function(){
	var app = angular.module('flashcard-controllers', []);

	app.controller('SessionController', function(){
		this.session = {};
	});

	app.controller('UserController', function(){
		this.user = {};
	});

	app.controller('PasswordResetController', function(){
		this.reset_user = {};
	});

	app.directive("compareTo", function(){
		return {
			require: "ngModel",
			scope: {
				otherModelValue: "=compareTo"
			},

			link: function(scope, element, attributes, ngModel) {
				ngModel.$validators.compareTo = function(modelValue) {
					if(ngModel.$error.required){
						return true;
					} else {
						if(scope.otherModelValue) {
							return modelValue == scope.otherModelValue;
						};
					};
				};
				scope.$watch("otherModelValue", function() {
					ngModel.$validate();
				});
			}
		};
	});

	//this is for login and password reset
	app.directive("isExisting", ['$http', function($http){
		return {
			require: "ngModel",

			link: function(scope, element, attributes, ngModel) {
				scope.$watch(attributes.ngModel, function(modelValue) {
					if(ngModel.$error.required || ngModel.$error.email){
						ngModel.$setValidity('isExisting', true);
					} else {
						if(modelValue){
							$http.post('/users/confirm_user.json', {
								email: modelValue
							}).success(function(data) {
								if(data.result == 'unique'){
									ngModel.$setValidity('isExisting', false);
								} else {
									ngModel.$setValidity('isExisting', true);
								}
							}).error(function(data) {
								ngModel.$setValidity('isExisting', true);
							});
						};
					};
				});
			}
		};
	}]);

	//this is for creating a new user
	app.directive("isDuplicate", ['$http', function($http){
		return {
			require: "ngModel",

			link: function(scope, element, attributes, ngModel) {
				scope.$watch(attributes.ngModel, function(modelValue) {
					if(ngModel.$error.required || ngModel.$error.email){
						ngModel.$setValidity('isDuplicate', true);
					} else {
						if(modelValue){
							$http.post('/users/confirm_user.json', {
								email: modelValue
							}).success(function(data) {
								if(data.result == 'existing'){
									ngModel.$setValidity('isDuplicate', false);
								} else {
									ngModel.$setValidity('isDuplicate', true);
								}
							}).error(function(data) {
								ngModel.$setValidity('isDuplicate', true);
							});
						};
					};

				});
			}
		};
	}]);

})();
