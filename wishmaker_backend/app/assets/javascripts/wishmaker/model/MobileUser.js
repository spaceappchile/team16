Ext.define('wishmaker.model.MobileUser', {
	extend: 'Ext.data.Model',
	fields:  [ 
	{
		name: 'id',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'username',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'passwod',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'birthday',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'platform',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'created_at',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'updated_at',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'the_geom',
		type: 'spatial'
		//defaultValue: ''
	} 
	],
	
	proxy: {
		type: 'rest',
		url: '/mobile_users', // default model controller route convention
		format: 'json',

		reader: {
			type: 'json'
		}, 
		writer:{
			type: 'json'
	}
},
});
