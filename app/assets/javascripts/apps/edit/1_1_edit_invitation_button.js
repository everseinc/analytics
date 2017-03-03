var editInvitationButton = {
	element: document.getElementById('invite-customer-button'),
	toggleModal: function(e) {
		editInvitationModal.toggleModal(e);
	},
	onClick: function() {
		editInvitationModal.setTrigger(this.element);
		this.element.addEventListener('click', this.toggleModal, true);
	}
}

