var headerMenu = {
	element: document.getElementById('header-menu'),
	toggleMenu: function() {
		this.element.style.display =  (this.element.style.display == 'none') ? 'block' : 'none';
	}
}