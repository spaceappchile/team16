Ext.require("Ext.container.Viewport")
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
*/
Ext.define("wishmaker.view.Viewport", {
	extend: 'Ext.container.Viewport',
	alias: 'widget.viewport',
	layout: {
		type: 'border'
	},

	initComponent: function(){
		var listWish = Ext.widget('listWish');
		var listUser = Ext.widget('listUser');
		var listMeteor = Ext.widget('listMeteor', {
			region: 'center',
		    	margins: '5 5 5 1'
		});


		this.items = [ listMeteor];


		/*
		var centerPanel = Ext.widget('mainpanelmap', {
			region: 'center',
			margins: '5 5 5 1',
			flex: 3
		});
		*/

		//this.items = [ headPanel, leftPanel, centerPanel ];

		this.callParent(arguments);
	}

});
