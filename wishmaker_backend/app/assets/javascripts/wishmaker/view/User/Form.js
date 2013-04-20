Ext.define('wishmaker.view.User.Form', {
	extend: 'Ext.form.Panel',
	alias: 'widget.formUser',
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
			name: 'username',
			xtype: 'textfield',
			fieldLabel: 'username'
		} , 
		{
			name: 'password',
			xtype: 'textfield',
			fieldLabel: 'password'
		} , 
		{
			name: 'birthday',
			xtype: 'datefield',
			fieldLabel: 'birthday'
		} , 
		{
			name: 'sex',
			xtype: 'numberfield',
			fieldLabel: 'sex'
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
