Ext.define('wishmaker.view.User.New', {
	extend: 'Ext.window.Window',
	alias: 'widget.newUser',

	tile: 'New User',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {

		var editForm = Ext.widget("formUser");
		this.items = [ editForm ];

		this.buttons = [
		{
			text: 'Create',
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
