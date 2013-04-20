Ext.define('wishmaker.store.Meteors', {
	extend: 'Ext.data.Store',
	model: 'wishmaker.model.Meteor',
	autoLoad: true,
	autoSync: true

/*
proxy: {
        type: 'rest',
        url: '/subcategories',
				
        reader: {
            type: 'json'
        }, 
        writer:{
            type: 'json'
        }
    },	
	// Relation
	belongsTo: {
		model: 'APP.model.Subcategory',
		name: 'subcategories'
	},
	
	hasMany: {
		model: 'APP.model.Media',
		name: 'photos'
	}
*/
});
