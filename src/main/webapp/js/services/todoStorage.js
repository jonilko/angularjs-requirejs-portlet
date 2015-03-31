/*global define*/
'use strict';

/**
 * Services that persists and retrieves TODOs from localStorage.
 */

define([ 'app' ], function(app) {
	app.factory('todoStorage', function() {
		return {
			get : function(portletId) {
				return JSON.parse(localStorage.getItem(portletId) || '[]');
			},

			put : function(todos, portletId) {
				localStorage.setItem(portletId, JSON.stringify(todos));
			}
		};
	});
});