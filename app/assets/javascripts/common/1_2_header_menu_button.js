var headerMenuButton = {
	element: document.getElementById('header-menu-button'),
	toggleMenu: function(e) {
		headerMenu.toggleMenu(e);
	},
	onClick: function() {
		headerMenu.setTrigger(this.element);
		this.element.addEventListener('click', this.toggleMenu, true);
	}
}