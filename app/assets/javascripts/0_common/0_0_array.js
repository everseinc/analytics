Array.prototype.first = function() {
	return this[0];
}

Array.prototype.flatMap = function (f, self) {
  self = self || this;
  return this.reduce(function (ys, x) {
    return ys.concat(f.call(self, x));
  }, []);
}