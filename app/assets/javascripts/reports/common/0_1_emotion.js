function Emotion(emotion){
  this.id = emotion.id,
  this.name = emotion.name
  this.color = ["rgba(229, 57, 53, 1)", "rgba(142, 36, 170, 1)", "rgba(30, 136, 229, 1)", "rgba(251, 141, 0, 1)", "rgba(67, 160, 71, 1)"][emotion.id - 1]
  this.backgroundColor = ["rgba(229, 57, 53, 0.3)", "rgba(142, 36, 170, 0.3)", "rgba(30, 136, 229, 0.3)", "rgba(251, 141, 0, 0.3)", "rgba(67, 160, 71, 0.3)"][emotion.id - 1]
}