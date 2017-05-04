
/**
 * check the object is type of Array
 * @param  {[type]}  obj [description]
 * @return {Boolean}     [description]
 */
function isArray(obj) {
	return Object.prototype.toString.call(obj) === '[object Array]';
}