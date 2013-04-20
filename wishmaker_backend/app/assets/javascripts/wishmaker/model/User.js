Ext.define('wishmaker.model.User', {
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
		name: 'password',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'birthday',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'sex',
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
	} 
	],
	
	proxy: {
		type: 'rest',
		url: '/users', // default model controller route convention
		format: 'json',

		reader: {
			type: 'json'
		}, 
		writer:{
			type: 'json'
	}
},
});
