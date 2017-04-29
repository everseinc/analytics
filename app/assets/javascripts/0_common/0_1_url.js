/**
 * URL management class
 */

function URL(url) {
	if (!(this instanceof URL)) {
		return new URL(url);
	}

	this.url;
	this.protocol;
	this.host;
	this.hostname;
	this.port;
	this.pathname;
	this.search;
	this.hash;

	this.__init__(url);
}



/**
 * [__init__ description]
 * @param  {String} url [description]
 */
URL.prototype.__init__ = function(url) {
	if (!url) return;

	this.set(url);
}



/**
 * [set description]
 * @param  {String} url [description]
 * @return {URL}        [description]
 */
URL.prototype.set = function(url) {
	this.url = url;

	this.parseURL();

	return this;
}



/**
 * [setCurrentPage description]
 * @return {URL} [description]
 */
URL.prototype.setCurrentPage = function() {
	return this.set(window.location.href);
}



/**
 * [parseURL description]
 * @return {URL} [description]
 */
URL.prototype.parseURL = function() {
	if (!this.url) return false;

	var a = document.createElement('a');
	a.href = this.url;

	this.protocol = a.protocol;
	this.host     = a.host;
	this.hostname = a.hostname;
	this.port     = a.port;
	this.pathname = a.pathname;
	this.search   = a.search;
	this.hash     = a.hash;
	this.params   = this._parseParams();

	return this;
}


/**
 * [_parseParams description]
 * @return {Object} [description]
 */
URL.prototype._parseParams = function() {
	if (!this.search) return [];

	var query = this.search.substring(1);
	var parameters = query.split('&');

	var result = new Object();
	parameters.map(function(parameter) {
		var element = parameter.split('=');
		var paramName = decodeURIComponent(element[0]);
		var paramValue = decodeURIComponent(element[1]);

 		result[paramName] = (isNaN(paramValue)) ? paramValue : +paramValue;
	});

	return result;
}






