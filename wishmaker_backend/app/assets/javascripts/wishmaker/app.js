// Ext Application
Ext.application({
	name: 'wishmaker',
	appFolder: './wishmaker',
	models: ['Meteor', 'Wish', 'MobileUser'], // put here your models
	stores: ['Meteors', 'Wishes', 'MobileUsers'], // put here your data stores (in plural)
	requires : ['Ext.view.View'],
	controllers: ['Meteors', 'Wishes', 'MobileUsers'], // put here yout app controllers (in plural)

	autoCreateViewport: true
});
