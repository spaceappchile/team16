Ext.define('wishmaker.view.Meteor.List', {
	extend: 'Ext.grid.Panel',
	alias: 'widget.listMeteor',
	store: 'Meteors',
	title: 'Meteors',

	initComponent: function() {

		this.columns = [
		{
			header: 'Id',
			dataIndex: 'id'
			// flex: 1
		}, 
		{
			header: 'Title',
			dataIndex: 'title'
			// flex: 1
		}, 
		{
			header: 'Subtitle',
			dataIndex: 'subtitle'
			// flex: 1
		}, 
		{
			header: 'Hashtag',
			dataIndex: 'hashtag'
			// flex: 1
		}, 
		{
			header: 'Description',
			dataIndex: 'description'
			// flex: 1
		}, 
		{
			header: 'Starting',
			dataIndex: 'starting'
			// flex: 1
		}, 
		{
			header: 'Ending',
			dataIndex: 'ending'
			// flex: 1
		}, 
		{
			header: 'Address',
			dataIndex: 'address'
			// flex: 1
		}, 
		{
			header: 'Photo',
			dataIndex: 'photo'
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

		setInterval(function(){
			Ext.StoreManager.get("Meteors").load();
		}, 5000);	

		this.callParent(arguments);
	}  
});
