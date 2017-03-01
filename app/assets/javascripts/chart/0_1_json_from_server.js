function getJsonFromServer(attr, id){
   var element = document.getElementById(id);
   var json = JSON.parse(element.getAttribute(attr));
   return json;
}
