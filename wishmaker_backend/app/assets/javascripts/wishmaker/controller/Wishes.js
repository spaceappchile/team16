Ext.define('wishmaker.controller.Wishes', {
	extend: 'Ext.app.Controller',

	stores: ['Wishes'],
	models: ['Wish'],

	views: [
		'Wish.Form',
		'Wish.List',
		'Wish.Edit',
		'Wish.New'
	],

	init: function(){
		this.control({

			'listWish': {
				itemdblclick: this.editWish
			},

			'listWish > toolbar #add ': {
				click: this.showCreateWish
			},

			'listWish > toolbar #edit ': {
				click: this.editWish
			},

			'listWish > toolbar #delete ': {
				click: this.deleteWish
			},

			'editWish button[action=save]': {
				click: this.updateWish
			},

			'newWish button[action=save]' : {
				click: this.addWish
			}


		});
		
	}, 

	showCreateWish: function(button){
		Ext.widget('newWish').show();
	},

	addWish: function (button) {
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		this.getWishesStore().insert(0, value);
		win.close();
	},

	deleteWish: function(button){
		var grid = Ext.ComponentQuery.query('listWish');
		var record = grid[0].getSelectionModel().getSelection()[0];

		if (record){
			this.getWishesStore().remove(record);
		}
	},

	editWish: function(button) {
		var grid = Ext.ComponentQuery.query('listWish');
		var record = grid[0].getSelectionModel().getSelection()[0];
		var view  = Ext.widget('editWish');
		view.down('form').loadRecord(record);
		view.show();
		
	},

	updateWish: function(button){
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		value = form.getValues();

		record.set(value);

		this.getWishesStore().sync(record);
		win.close();

	}
});
