Ext.define('wishmaker.model.Wish', {
	extend: 'Ext.data.Model',
	fields:  [ 
	{
		name: 'id',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'user_id',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'meteor_id',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'description',
		type: 'text'
		//defaultValue: ''
	}, 
	{
		name: 'made',
		type: 'boolean'
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
		url: '/wishes', // default model controller route convention
		format: 'json',

		reader: {
			type: 'json'
		}, 
		writer:{
			type: 'json'
	}
},
});
