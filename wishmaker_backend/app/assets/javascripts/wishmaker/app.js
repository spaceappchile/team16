// Ext Application
Ext.application({
	name: 'wishmaker',
	appFolder: './wishmaker',
	models: ['Meteor', 'Wish', 'MobileUser', 'HeatMap'], // put here your models
	stores: ['Meteors', 'Wishes', 'MobileUsers'], // put here your data stores (in plural)
	requires : ['Ext.view.View'],
	controllers: ['Meteors', 'Wishes', 'MobileUsers', 'HeatMaps'], // put here yout app controllers (in plural)

	autoCreateViewport: true
});
