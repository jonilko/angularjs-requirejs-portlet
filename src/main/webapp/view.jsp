<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>

<portlet:defineObjects />
<liferay-theme:defineObjects />

<section id="todoapp" ng-controller="TodoController">
	<header id="header">
		<h1>todos</h1>
		<form id="todo-form" ng-submit="addTodo()">
			<input id="new-todo" placeholder="What needs to be done?" ng-model="newTodo" autofocus>
		</form>
	</header>

	<section id="main" ng-show="todos.length" ng-cloak>
		<input id="toggle-all" type="checkbox" ng-model="allChecked" ng-click="markAll(allChecked)">
		<label for="toggle-all">Mark all as complete</label>
		<ul id="todo-list">
			<li ng-repeat="todo in todos | filter:statusFilter track by $index" ng-class="{completed: todo.completed, editing: todo == editedTodo}">
				<div class="view">
					<input class="toggle" type="checkbox" ng-model="todo.completed">
					<label ng-dblclick="editTodo(todo)">{{todo.title}}</label>
					<button class="destroy" ng-click="removeTodo(todo)"></button>
				</div>
				<form ng-submit="doneEditing(todo)">
					<input class="edit" ng-trim="false" ng-model="todo.title" ng-blur="doneEditing(todo)" todo-focus="todo == editedTodo">
				</form>
			</li>
		</ul>
	</section>

	<footer id="footer1" ng-show="todos.length" ng-cloak>
		<span id="todo-count"><strong>{{remainingCount}}</strong>
			<ng-pluralize count="remainingCount" when="{ one: 'item left', other: 'items left' }"></ng-pluralize>
		</span>
		<ul id="filters">
			<li>
				<a ng-class="{selected: location.path() == '/<portlet:namespace/>'} " href="#/<portlet:namespace/>">All</a>
			</li>
			<li>
				<a ng-class="{selected: location.path() == '/<portlet:namespace/>active'}" href="#/<portlet:namespace/>active">Active</a>
			</li>
			<li>
				<a ng-class="{selected: location.path() == '/<portlet:namespace/>completed'}" href="#/<portlet:namespace/>completed">Completed</a>
			</li>
		</ul>

		<button class="button" id="clear-completed" ng-click="clearDoneTodos()" ng-show="remainingCount < todos.length">Clear completed ({{todos.length - remainingCount}})</button>
	</footer>
</section>

<footer id="info">
	<p>Double-click to edit a todo</p>
</footer>
