Number.prototype.getA = function() {
    return (this & 0xff000000) >>> 24;
};

Number.prototype.getR = function() {
    return (this & 0xff0000) >> 16;
};

Number.prototype.getG = function() {
    return (this & 0xff00) >> 8;
};

Number.prototype.getB = function() {
    return (this & 0xff);
};

Number.prototype.toCSSValueRGB = function() {
    return "rgb("+ this.getR() +","+ this.getG() +","+ this.getB() +")";
};

Number.prototype.toCSSValueRGBA = function() {
    return "rgba("+ this.getR() +","+ this.getG() +","+ this.getB() +","+ this.getA() / 255 +")";
};