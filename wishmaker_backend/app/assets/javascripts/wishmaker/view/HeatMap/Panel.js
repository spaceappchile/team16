Ext.require("Ext.panel.Panel");

Ext.define("wishmaker.view.HeatMap.Panel", {
  extend: 'Ext.panel.Panel',
  alias: 'widget.panelHeatMap',
  width: 100,
  height: 100, 

  initComponent: function(){
    this.callParent(arguments);
  }

});
