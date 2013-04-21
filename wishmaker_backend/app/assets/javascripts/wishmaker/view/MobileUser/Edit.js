Ext.define('wishmaker.view.MobileUser.Edit', {
	extend: 'Ext.window.Window',
	alias: 'widget.editMobileUser',

	tile: 'Edit MobileUser',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {
		var editForm = Ext.widget("formMobileUser");
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
