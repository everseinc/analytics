function Emotion(emotion){
  this.id = emotion.id,
  this.name = emotion.name
}

Emotion.prototype.color = function() {
	return Color().setColor("priority", this.id).color.toCSSValueRGBA();
}

Emotion.prototype.backgroundColor = function() {
	return Color().setColor("priority", this.id).lighten(0x88).color.toCSSValueRGBA();
}