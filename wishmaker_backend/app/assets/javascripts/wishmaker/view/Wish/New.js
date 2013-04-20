Ext.define('wishmaker.view.Wish.New', {
	extend: 'Ext.window.Window',
	alias: 'widget.newWish',

	tile: 'New Wish',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {

		var editForm = Ext.widget("formWish");
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
