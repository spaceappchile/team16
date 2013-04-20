Ext.define('wishmaker.view.Wish.Edit', {
	extend: 'Ext.window.Window',
	alias: 'widget.editWish',

	tile: 'Edit Wish',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {
		var editForm = Ext.widget("formWish");
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
