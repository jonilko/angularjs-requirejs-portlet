/*global require*/
'use strict';

require.config({
	paths : {
		angular : '/angularjs-requirejs-portlet/js/angular.min',
		app : '/angularjs-requirejs-portlet/js/app',
		controllers : '/angularjs-requirejs-portlet/js/controllers',
		directives : '/angularjs-requirejs-portlet/js/directives',
		services : '/angularjs-requirejs-portlet/js/services'
	},
	shim : {
		angular : {
			exports : 'angular'
		}
	}
});

require([ 'angular', 'app', 'controllers/todoMvc', 'directives/todoFocus' ], function(angular, app) {
	Liferay.Portlet.ready(function(portletInstanceId, node) {
		/*
		 * This function gets called after each and every portlet on the page is
		 * loaded.
		 * 
		 * portletId: the current portlet's id node: the Alloy Node object of
		 * the current portlet
		 */

		var portletId = portletInstanceId.replace(/[_]INSTANCE[_].+/g, "");

		if (portletId === 'angularjsrequirejsportlet_WAR_angularjsrequirejsportlet') {
			app.value('portletInstanceId', portletInstanceId);
			angular.bootstrap(node.getDOMNode(), [ 'todoMvc' ]);
		}
	});
});