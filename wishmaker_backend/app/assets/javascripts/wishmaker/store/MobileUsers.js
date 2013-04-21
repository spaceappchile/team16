Ext.define('wishmaker.store.MobileUsers', {
	extend: 'Ext.data.Store',
	model: 'wishmaker.model.MobileUser',
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
