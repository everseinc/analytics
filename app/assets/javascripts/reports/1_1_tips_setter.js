var tipsSetter = {
	new: function(emo_tip_assets) {
		this.tips_renderer = new TipsRenderer(emo_tip_assets);
		this.reload();
	},
	reload: function() {
		this.tips_renderer.reload();
	},
	setDimensions: function(dim_ids) {
		this.tips_renderer.setDimensions(dim_ids);
		this.reload();
	},
	setSpan: function(started_at, ended_at){
		this.tips_renderer.setSpan(started_at, ended_at);
		this.reload();
	}
};