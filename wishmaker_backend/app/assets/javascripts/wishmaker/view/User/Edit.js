Ext.define('wishmaker.view.User.Edit', {
	extend: 'Ext.window.Window',
	alias: 'widget.editUser',

	tile: 'Edit User',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {
		var editForm = Ext.widget("formUser");
		this.items = [ editForm ];

		this.buttons = [
		{
			text: 'Update',
			action: 'save'
		},
		{
			text: 'Cancel',
			scope: this,
			handler: this.close
		}
		];

		this.callParent(arguments);
	}
	
});
