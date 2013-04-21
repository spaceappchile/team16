Ext.define('wishmaker.view.MobileUser.Form', {
	extend: 'Ext.form.Panel',
	alias: 'widget.formMobileUser',
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
			name: 'passwod',
			xtype: 'textfield',
			fieldLabel: 'passwod'
		} , 
		{
			name: 'birthday',
			xtype: 'datefield',
			fieldLabel: 'birthday'
		} , 
		{
			name: 'platform',
			xtype: 'numberfield',
			fieldLabel: 'platform'
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
		} , 
		{
			name: 'the_geom',
			xtype: '',
			fieldLabel: 'the_geom'
		}  
		];


		this.callParent(arguments);
	}
});
