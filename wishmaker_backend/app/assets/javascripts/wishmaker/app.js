// Ext Application
Ext.application({
	name: 'wishmaker',
	appFolder: './wishmaker',
	models: ['Meteor', 'User', 'Wish'], // put here your models
	stores: ['Meteors', 'Users', 'Wishes'], // put here your data stores (in plural)
	requires : ['Ext.view.View'],
	controllers: ['Meteors', 'Users', 'Wishes'], // put here yout app controllers (in plural)

	autoCreateViewport: true
});
