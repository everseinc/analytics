Date.prototype.default = function() {
	return this.getMonth() + 1
    + "/" + this.getDate()
    + " " + this.getHours()
    + ":" + this.getMinutes()
    + ":" + this.getSeconds();
}