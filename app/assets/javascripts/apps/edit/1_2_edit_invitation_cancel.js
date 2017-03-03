var editInvitationCancel = {
	element: document.getElementById('invite-cancel-button'),
	hideModal: function(e) {
		editInvitationModal.hideModal(e);
	},
	onClick: function() {
		this.element.addEventListener('click', this.hideModal, true);
	}
}