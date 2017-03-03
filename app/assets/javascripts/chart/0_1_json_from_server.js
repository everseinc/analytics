function getJsonFromServer(attr, id){
   var json_element = document.getElementById(id);
   var json = JSON.parse(json_element.getAttribute(attr));
   return json;
}
