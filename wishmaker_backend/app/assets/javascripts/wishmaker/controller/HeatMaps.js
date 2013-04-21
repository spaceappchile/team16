Ext.define('wishmaker.controller.HeatMaps', {
	extend: 'Ext.app.Controller',

	stores: [],
	models: ['HeatMap'],

	views: [
		'HeatMap.Panel',
	],

	init: function(){
		this.control({
			'panelHeatMap': {
				afterrender: this.afterrenderPanel
			},

			'panelHeatMap > toolbar #select': {
				click: this.selectfeature
			},

			'panelHeatMap > toolbar #new': {
				click: this.newfeature
			},

			'panelHeatMap > toolbar #rotate': {
				click:  this.rotatefeature
			},
			'panelHeatMap > toolbar #move': {
				click:  this.movefeature
			},

			'panelHeatMap > toolbar #delete': {
				click:  this.deletefeature
			},

			'panelHeatMap > toolbar #layerCombo': {
				select:  this.layerselect
			},

			'panelHeatMap > toolbar #logout': {
				click:  this.logout
			},

			'#pan': {
				click: function(btn){
					wishmaker.model.HeatMap.activateSingleControl(null);
				}
			},
			'#undo': {
				click: function(btn){
					 wishmaker.model.HeatMap.activateSingleControl('undoredo');
					 wishmaker.model.HeatMap.getControl('undoredo').previousTrigger();
				}
			},
			'#redo': {
				click: function(btn){
					 wishmaker.model.HeatMap.activateSingleControl('undoredo');
					 wishmaker.model.HeatMap.getControl('undoredo').nextTrigger();
				}
			},
			'#boxin': {
				click: function(btn){
					wishmaker.model.HeatMap.activateSingleControl('boxin');
				}
			},
			'#boxout': {
				click: function(btn){
					wishmaker.model.HeatMap.activateSingleControl('boxout');
				}
			}

		});
	},

	afterrenderPanel: function(panel){
		var geographic = new OpenLayers.Projection("EPSG:4326");
		var mercator = new OpenLayers.Projection("EPSG:900913");

		var options = {
			projection: mercator,
			displayProjection: geographic
		};

		var map = new OpenLayers.Map(panel.body.dom, options);
		wishmaker.model.HeatMap.setMap(map);

		// open street HeatMap
		var mapnik  = new OpenLayers.Layer.OSM();

		wishmaker.model.HeatMap.addLayers({
			osm: mapnik
		});

		var wmsReports = new OpenLayers.Layer.WMS(
  			"Reports","/geoserver/wms/wishmaker",
  			{
  				layers:'reports',
  				transparent: true,
				format: 'image/png'
  			},{
				singleTile: true,
				ratio: 2,
  			 	isBaseLayer: false,
				yx : {'EPSG:900913' : true}

			}
  		);

		var wmsReportsHeatmap = new OpenLayers.Layer.WMS(
  			"Heatmap","/geoserver/wms/wishmaker",
  			{
  				layers:'reports_heatmap',
  				transparent: true,
				format: 'image/png'
  			},{
				singleTile: true,
				ratio: 2,
  			 	isBaseLayer: false,
				yx : {'EPSG:900913' : true}

			}
  		);
		
		wishmaker.model.HeatMap.addLayers({
			reports: wmsReports,
			reportsHeatmap: wmsReportsHeatmap
		});
		


		// Navigation Controls
		var layerSwitcher = new OpenLayers.Control.LayerSwitcher();
		var mousePosition = new OpenLayers.Control.MousePosition();
		var undoredo = new OpenLayers.Control.NavigationHistory();
		var boxin =  new OpenLayers.Control.ZoomBox({
				alwaysZoom:true
		});


		var boxout =  new OpenLayers.Control.ZoomBox({
			alwaysZoom : true, 
			out: true 
		});


		wishmaker.model.HeatMap.addControls({
			layerSwitcher: layerSwitcher,
			mousePosition: mousePosition,
			undoredo: undoredo,
			boxin: boxin,
			boxout: boxout
		});



		var lonlat = new OpenLayers.LonLat(-70.591961, -33.415156);
		var center =lonlat.transform(geographic, map.getProjectionObject());
		var initZoomLevel = 10

		map.setCenter(center, initZoomLevel);

		panel.on("resize", function(){
			map.updateSize()
		});


	},

	singleClick: function(){
		//nothing
	}


});
