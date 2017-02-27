var headerCustomerMenuButton = {
	element: document.getElementById('header-customer-menu-button'),
	toggleMenu: function(e) {
		headerCustomerMenu.toggleMenu(e);
	},
	onClick: function() {
		headerCustomerMenu.setTrigger(this.element);
		this.element.addEventListener('click', this.toggleMenu, true);
	}
}