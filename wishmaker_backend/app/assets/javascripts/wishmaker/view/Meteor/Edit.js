Ext.define('wishmaker.view.Meteor.Edit', {
	extend: 'Ext.window.Window',
	alias: 'widget.editMeteor',

	tile: 'Edit Meteor',
	layout: 'fit',

	autoshow: true,

	initComponent: function() {
		var editForm = Ext.widget("formMeteor");
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
