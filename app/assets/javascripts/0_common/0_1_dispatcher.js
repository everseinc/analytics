function Dispatcher() {
	this.func = null;
}

Dispatcher.prototype.dispatch = function(arg) {
	this.func(arg);
}

Dispatcher.prototype.register = function(f) {
	this.func = f;
}