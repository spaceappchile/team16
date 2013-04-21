Ext.define('wishmaker.view.Meteor.Form', {
	extend: 'Ext.form.Panel',
	alias: 'widget.formMeteor',
	autoscroll: true,
	defaultType: 'textfield',


	initComponent: function() {

		this.items = [ 
/*		{
			name: 'id',
			xtype: 'numberfield',
			fieldLabel: 'id'
		} , 
*/
		{
			name: 'title',
			xtype: 'textfield',
			fieldLabel: 'title'
		} , 
		{
			name: 'subtitle',
			xtype: 'textfield',
			fieldLabel: 'subtitle'
		} , 
		{
			name: 'hashtag',
			xtype: 'textfield',
			fieldLabel: 'hashtag'
		} , 
		{
			name: 'description',
			xtype: 'htmleditor',
			fieldLabel: 'description'
		} , 
		{
			name: 'starting',
			xtype: 'datefield',
			fieldLabel: 'starting'
		} , 
		{
			name: 'ending',
			xtype: 'datefield',
			fieldLabel: 'ending'
		} , 
		{
			name: 'address',
			xtype: 'textfield',
			fieldLabel: 'address'
		} , 
		{
			name: 'photo',
			xtype: 'textfield',
			fieldLabel: 'photo'
		} 
/*,		{
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
		}  */ 
		];


		this.callParent(arguments);
	}
});
