Ext.define('wishmaker.view.Meteor.New', {
	extend: 'Ext.window.Window',
	alias: 'widget.newMeteor',

	tile: 'New Meteor',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {

		var editForm = Ext.widget("formMeteor");
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
