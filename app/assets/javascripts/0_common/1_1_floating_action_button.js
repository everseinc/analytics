/**
 * detect floating action buttons and apply js automatically
 * @return {[type]} [description]
 */
(function() {
	var parent = document.getElementsByClassName("fab-button--parent")[0];
	var children = Array.prototype.slice.call(document.getElementsByClassName("fab-button--children"));
	var fields = Array.prototype.slice.call(document.getElementsByClassName("fab-button--children-contents"));

	if (parent && children.length > 0) {
		var controllerButton = new floatingActionButton(parent, children, fields);
	}
}());