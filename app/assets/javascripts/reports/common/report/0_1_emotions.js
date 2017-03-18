function Emotions(emotions){
  this.emotions = emotions.map(function(emotion){
    return new Emotion(emotion);
  });
}

Emotions.prototype.functor = function(func){
  return this.emotions.map(function(emotion){
    return func(emotion);
  });
}

Emotions.prototype.getEmotionsByName = function(names) {
	return this.emotions.filter(function(emotion, index) {
		return names.indexOf(emotion.name) >= 0;
	});
}

Emotions.prototype.names = function() {
	return this.emotions.map(function(emotion) {
		return emotion.name;
	});
}