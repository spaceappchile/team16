Ext.define('wishmaker.model.Meteor', {
	extend: 'Ext.data.Model',
	fields:  [ 
	{
		name: 'id',
		type: 'integer'
		//defaultValue: ''
	}, 
	{
		name: 'title',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'subtitle',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'hashtag',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'description',
		type: 'text'
		//defaultValue: ''
	}, 
	{
		name: 'starting',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'ending',
		type: 'datetime'
		//defaultValue: ''
	}, 
	{
		name: 'address',
		type: 'string'
		//defaultValue: ''
	}, 
	{
		name: 'photo',
		type: 'string'
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
		url: '/meteors', // default model controller route convention
		format: 'json',

		reader: {
			type: 'json'
		}, 
		writer:{
			type: 'json'
	}
},
});
