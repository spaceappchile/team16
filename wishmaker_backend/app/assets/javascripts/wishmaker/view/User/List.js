Ext.define('wishmaker.view.User.List', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.listUser',
	store: 'Users',
	title: 'Users',

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
			header: 'Password',
			dataIndex: 'password'
			// flex: 1
		}, 
		{
			header: 'Birthday',
			dataIndex: 'birthday'
			// flex: 1
		}, 
		{
			header: 'Sex',
			dataIndex: 'sex'
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
