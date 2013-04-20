Ext.define('wishmaker.controller.Users', {
	extend: 'Ext.app.Controller',

	stores: ['Users'],
	models: ['User'],

	views: [
		'User.Form',
		'User.List',
		'User.Edit',
		'User.New'
	],

	init: function(){
		this.control({

			'listUser': {
				itemdblclick: this.editUser
			},

			'listUser > toolbar #add ': {
				click: this.showCreateUser
			},

			'listUser > toolbar #edit ': {
				click: this.editUser
			},

			'listUser > toolbar #delete ': {
				click: this.deleteUser
			},

			'editUser button[action=save]': {
				click: this.updateUser
			},

			'newUser button[action=save]' : {
				click: this.addUser
			}


		});
		
	}, 

	showCreateUser: function(button){
		Ext.widget('newUser').show();
	},

	addUser: function (button) {
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		this.getUsersStore().insert(0, value);
		win.close();
	},

	deleteUser: function(button){
		var grid = Ext.ComponentQuery.query('listUser');
		var record = grid[0].getSelectionModel().getSelection()[0];

		if (record){
			this.getUsersStore().remove(record);
		}
	},

	editUser: function(button) {
		var grid = Ext.ComponentQuery.query('listUser');
		var record = grid[0].getSelectionModel().getSelection()[0];
		var view  = Ext.widget('editUser');
		view.down('form').loadRecord(record);
		view.show();
		
	},

	updateUser: function(button){
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		record.set(value);

		this.getUsersStore().sync(record);
		win.close();

	}
});
