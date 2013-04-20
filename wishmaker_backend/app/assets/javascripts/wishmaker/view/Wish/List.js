Ext.define('wishmaker.view.Wish.List', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.listWish',
	store: 'Wishes',
	title: 'Wishes',

	initComponent: function() {

		this.columns = [
		{
			header: 'Id',
			dataIndex: 'id'
			// flex: 1
		}, 
		{
			header: 'User_id',
			dataIndex: 'user_id'
			// flex: 1
		}, 
		{
			header: 'Meteor_id',
			dataIndex: 'meteor_id'
			// flex: 1
		}, 
		{
			header: 'Description',
			dataIndex: 'description'
			// flex: 1
		}, 
		{
			header: 'Made',
			dataIndex: 'made'
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
