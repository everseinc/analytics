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