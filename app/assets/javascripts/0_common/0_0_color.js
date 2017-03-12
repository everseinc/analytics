function Color(color) {
	if (!(this instanceof Color)) {
		return new Color(color);
	}
	this.color = color;
}

Color.prototype.setColor = function(type = "normal", index = null) {
	if (type == "normal" && !index) { throw new Error("id must be setted"); }

	if (type == "random") {
		index = Math.floor(Math.random() * this.colorList.length);
	}

	if (type = "priority") {
		index = this.priority[index];
	}

	this.color = this.colorList[this.colorNames()[index]];

	return this;
}

Color.prototype.lighten = function(t) {
	if (t < 0x00 || 0xFF < t) { throw new Error("must give transparency between 0x00 and 0xFF"); }
	transparency = t << 24;
	this.color = this.color - transparency;

	return this;
}

Color.prototype.priority = [0, 2, 5, 4, 3, 1, 6, 7];

Color.prototype.colorList = {
	material_red_400: 0xFFEF5350,
	material_purple_400: 0xFFAB47BC,
	material_indigo_400: 0xFF5C6BC0,
	material_blue_400: 0xFF42A5F5,
	material_green_500: 0xFF4CAF50,
	material_orange_500: 0xFFFF9800,
	material_yellow_400: 0xFFFFEE58,
	material_brown_400: 0XFF8D6E63,
}

Color.prototype.colorNames = function() {
	return Object.getOwnPropertyNames(this.colorList);
}