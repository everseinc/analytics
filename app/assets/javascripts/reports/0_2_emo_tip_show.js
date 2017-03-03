function EmoTipShow(score, name){
  this.name = null,
  this.score = score
}

EmoTipShow.prototype.tipShow = function(){
  document.getElementById("tip-" + this.name + "-value").value(this.score);
}



EmoTipShow.prototype.getNames = function(){
  var tip_elements = document.getElementsByClassName("report_tip_title");
  var names = [];
  var tip_length = tip_elements.length;
  for (var i = 0; i < tip_length; i++) {
    names.push(tip_elements[i].innerHTML);
  }
  return names;
}