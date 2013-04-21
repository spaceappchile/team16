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
		var panelHeatMap = Ext.widget('panelHeatMap', {
			region: 'center',
			margins: '5 5 5 1',
			flex: 2.5
		});

		var listMobileUser = Ext.widget('listMobileUser', {
			region: 'south',
			margins: '5 5 5 1'
		});

		var listWish = Ext.widget('listWish', {
			region: 'east',
			margins: '5 5 5 1',
		    	flex: 1
		});

		var listMeteor = Ext.widget('listMeteor', {
			region: 'west',
		    	margins: '5 5 5 1',
		    	flex: 1
		});


		this.items = [ panelHeatMap, listMeteor];


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
