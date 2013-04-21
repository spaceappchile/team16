Ext.define('wishmaker.controller.MobileUsers', {
	extend: 'Ext.app.Controller',

	stores: ['MobileUsers'],
	models: ['MobileUser'],

	views: [
		'MobileUser.Form',
		'MobileUser.List',
		'MobileUser.Edit',
		'MobileUser.New'
	],

	init: function(){
		this.control({

			'listMobileUser': {
				itemdblclick: this.editMobileUser
			},

			'listMobileUser > toolbar #add ': {
				click: this.showCreateMobileUser
			},

			'listMobileUser > toolbar #edit ': {
				click: this.editMobileUser
			},

			'listMobileUser > toolbar #delete ': {
				click: this.deleteMobileUser
			},

			'editMobileUser button[action=save]': {
				click: this.updateMobileUser
			},

			'newMobileUser button[action=save]' : {
				click: this.addMobileUser
			}


		});
		
	}, 

	showCreateMobileUser: function(button){
		Ext.widget('newMobileUser').show();
	},

	addMobileUser: function (button) {
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		this.getMobileUsersStore().insert(0, value);
		win.close();
	},

	deleteMobileUser: function(button){
		var grid = Ext.ComponentQuery.query('listMobileUser');
		var record = grid[0].getSelectionModel().getSelection()[0];

		if (record){
			this.getMobileUsersStore().remove(record);
		}
	},

	editMobileUser: function(button) {
		var grid = Ext.ComponentQuery.query('listMobileUser');
		var record = grid[0].getSelectionModel().getSelection()[0];
		var view  = Ext.widget('editMobileUser');
		view.down('form').loadRecord(record);
		view.show();
		
	},

	updateMobileUser: function(button){
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		record.set(value);

		this.getMobileUsersStore().sync(record);
		win.close();

	}
});
