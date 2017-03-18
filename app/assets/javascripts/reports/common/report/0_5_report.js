function getJsonFromServer(attr, id){
   var json_element = document.getElementById(id);
   var json = JSON.parse(json_element.getAttribute(attr));
   return json;
}

var report = {
  emo_details: new EmoDetails(getJsonFromServer("data-json", "json_emo_details")),
  emotions: new Emotions(getJsonFromServer("data-json", "json_emotions")),
  dim_stores: new DimStores(getJsonFromServer("data-json", "json_dim_stores")),
  emo_tip_assets: new EmoTipAssets(),
}