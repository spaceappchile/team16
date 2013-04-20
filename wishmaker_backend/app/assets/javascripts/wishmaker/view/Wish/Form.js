Ext.define('wishmaker.view.Wish.Form', {
	extend: 'Ext.form.Panel',
	alias: 'widget.formWish',
	autoscroll: true,
	defaultType: 'textfield',


	initComponent: function() {

		this.items = [ 
		{
			name: 'id',
			xtype: 'numberfield',
			fieldLabel: 'id'
		} , 
		{
			name: 'user_id',
			xtype: 'numberfield',
			fieldLabel: 'user_id'
		} , 
		{
			name: 'meteor_id',
			xtype: 'numberfield',
			fieldLabel: 'meteor_id'
		} , 
		{
			name: 'description',
			xtype: '',
			fieldLabel: 'description'
		} , 
		{
			name: 'made',
			xtype: '',
			fieldLabel: 'made'
		} , 
		{
			name: 'created_at',
			xtype: 'datefield',
			fieldLabel: 'created_at'
		} , 
		{
			name: 'updated_at',
			xtype: 'datefield',
			fieldLabel: 'updated_at'
		}  
		];


		this.callParent(arguments);
	}
});
