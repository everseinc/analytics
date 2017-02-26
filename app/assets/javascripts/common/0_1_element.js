Element.prototype.hasClass = function(className){
    var classArray = this.className.split(' ');
    return classArray.indexOf(className) >= 0;
}
Element.prototype.addClass = function(className){
    if(!this.hasClass(className)){
        var classArray = this.className.split(' ');
        classArray.push(className);
        this.className = classArray.join(' ');
    }
    return this;
}
Element.prototype.removeClass = function(className){
    var classArray = this.className.split(' ');
    var index = classArray.indexOf(className);
    if(index >= 0){
        classArray.splice(index, 1);
        this.className = classArray.join(' ');
    }
    return this;
}
Element.prototype.toggleClass = function(className){
  this.hasClass(className) ? this.removeClass(className) : this.addClass(className);
} 