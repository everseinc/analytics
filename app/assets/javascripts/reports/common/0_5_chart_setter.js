var initializeWith = {
	DEFAULT: "default",
	EMOTIONS: "emotions",
}


function chartSetter(canvases) {
	if (!(this instanceof chartSetter)) {
    return new chartSetter(canvases);
  }

	this.canvases = canvases;
	this.chart_renderers = [];
}



/**
 * functor for this chart_renderers
 * @param  {Function} f [description]
 * @return {Array}      [description]
 */
chartSetter.prototype.renderers = function(f) {
	return this.chart_renderers.map(f);
}



/**
 * new chartRenderer
 */
chartSetter.prototype.new = function() {
	this.chart_renderers = this.canvases.map(function(canvas) {
		return new chartRenderer(canvas.canvas);
	});

	return this;
}



/**
 * reload chartRenderer
 */
chartSetter.prototype.reload = function() {
	this.renderers(function(renderer) {
		renderer.reload();
	});
}



/**
 * initialize chartRenderer
 * @param  {String} with [description]
 */
chartSetter.prototype.initialize = function(_with) {
	if (_with == initializeWith.DEFAULT) {
		this.renderers(function(renderer) {
			renderer.setData();
		});
	} else if (_with == initializeWith.EMOTIONS) {
		this.renderers(function(renderer, i) {
			renderer.setEmotion(canvases[i].emotion_id).setData();
		});
	} else {
		throw new Error("chartSetter.initialize() : unknown `with` status");
	}
	
	this.reload();
}



/**
 * set span
 * @param {Date} start [description]
 * @param {Date} end   [description]
 */
chartSetter.prototype.setSpan = function(start, end) {
	filterStore.setters.span(start, end, function() {
		this.renderers(function(renderer) {
			renderer.setData();
		});
		this.reload();
	}.bind(this));
}



/**
 * set valid emotions
 * @param {Array} valid_emotions [description]
 */
chartSetter.prototype.setValidEmotions = function(valid_emotions) {
	filterStore.setters.base.valid_emotions(valid_emotions, function() {
		this.renderers(function(renderer) {
			renderer.setData();
		});
		this.reload();
	}.bind(this));		
}


