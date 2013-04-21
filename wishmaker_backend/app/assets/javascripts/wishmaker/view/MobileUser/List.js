Ext.define('wishmaker.view.MobileUser.List', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.listMobileUser',
	store: 'MobileUsers',
	title: 'MobileUsers',

	initComponent: function() {

		this.columns = [
		{
			header: 'Id',
			dataIndex: 'id'
			// flex: 1
		}, 
		{
			header: 'Username',
			dataIndex: 'username'
			// flex: 1
		}, 
		{
			header: 'Passwod',
			dataIndex: 'passwod'
			// flex: 1
		}, 
		{
			header: 'Birthday',
			dataIndex: 'birthday'
			// flex: 1
		}, 
		{
			header: 'Platform',
			dataIndex: 'platform'
			// flex: 1
		}, 
		{
			header: 'Created_at',
			dataIndex: 'created_at'
			// flex: 1
		}, 
		{
			header: 'Updated_at',
			dataIndex: 'updated_at'
			// flex: 1
		}, 
		{
			header: 'The_geom',
			dataIndex: 'the_geom'
			// flex: 1
		} 
		]
	
		var rowEditing = Ext.create('Ext.grid.plugin.RowEditing');

		//this.plugins = [rowEditing];

		this.dockedItems = [{
			xtype: 'toolbar',
			items: [{
				itemId: 'add', 
				text: 'Add',
			},'-',
			{
				itemId: 'delete',
				text: 'Delete',
			}, '-',
			{
				itemId: 'edit',
				text: 'Edit'
			}
			]
		}];


		this.callParent(arguments);
	}  
});
