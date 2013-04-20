Ext.define('wishmaker.controller.Meteors', {
	extend: 'Ext.app.Controller',

	stores: ['Meteors'],
	models: ['Meteor'],

	views: [
		'Meteor.Form',
		'Meteor.List',
		'Meteor.Edit',
		'Meteor.New'
	],

	init: function(){
		this.control({

			'listMeteor': {
				itemdblclick: this.editMeteor
			},

			'listMeteor > toolbar #add ': {
				click: this.showCreateMeteor
			},

			'listMeteor > toolbar #edit ': {
				click: this.editMeteor
			},

			'listMeteor > toolbar #delete ': {
				click: this.deleteMeteor
			},

			'editMeteor button[action=save]': {
				click: this.updateMeteor
			},

			'newMeteor button[action=save]' : {
				click: this.addMeteor
			}


		});
		
	}, 

	showCreateMeteor: function(button){
		Ext.widget('newMeteor').show();
	},

	addMeteor: function (button) {
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		this.getMeteorsStore().insert(0, value);
		win.close();
	},

	deleteMeteor: function(button){
		var grid = Ext.ComponentQuery.query('listMeteor');
		var record = grid[0].getSelectionModel().getSelection()[0];

		if (record){
			this.getMeteorsStore().remove(record);
		}
	},

	editMeteor: function(button) {
		var grid = Ext.ComponentQuery.query('listMeteor');
		var record = grid[0].getSelectionModel().getSelection()[0];
		var view  = Ext.widget('editMeteor');
		view.down('form').loadRecord(record);
		view.show();
		
	},

	updateMeteor: function(button){
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		record.set(value);

		this.getMeteorsStore().sync(record);
		win.close();

	}
});
