function Dimensions(dimensions){
  this.dimensions = dimensions.map(function(dimension){
    return new Dimension(dimension);
  });
}
