(function() {
	var cell_triggers = document.getElementsByClassName('report_side_nav_group');
	var cell_contents = document.getElementsByClassName('report_side_nav_contents');
	var cells = Array.prototype.forEach.call(cell_triggers, function(val, index) {
	  accordion = new AccordionCell(cell_triggers[index], cell_contents[index]);
	  accordion.setLength();
	  accordion.enable();
	});
}());