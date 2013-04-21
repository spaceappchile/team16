Ext.define('wishmaker.view.MobileUser.New', {
	extend: 'Ext.window.Window',
	alias: 'widget.newMobileUser',

	tile: 'New MobileUser',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {

		var editForm = Ext.widget("formMobileUser");
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
