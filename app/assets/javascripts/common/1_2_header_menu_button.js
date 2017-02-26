var headerMenuButton = {
	element: document.getElementById('header-menu-button'),
	toggleMenu: function() {
		headerMenu.toggleMenu();
	},
	onClick: function() {
		this.element.addEventListener('click', this.toggleMenu, false);
	}
}