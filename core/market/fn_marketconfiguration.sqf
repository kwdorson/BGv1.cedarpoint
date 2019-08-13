/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],

////////////MAIN CONFIG

life_market_resources = [
	
	// Default Ä°sler
	
	["oil_processed", 900, 0, 950, 3, 1, 
		[ 
			["diamond_cut",1], 
			["iron_refined",1],
			["copper_refined",1],
			["gold_refined",1],
			["glass",1] 
		] 
	],
	
	["diamond_cut", 1000, 0, 1200, 5, 2, 
		[ 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["gold_refined",1],
			["salt_refined",1],
			["glass",1] 
		] 
	],
	
	["copper_refined", 680, 0, 710, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["gold_refined",1],
			["glass",1] 
		] 
	],
	
	["iron_refined", 970, 0, 985, 3, 1,  
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["copper_refined",1],
			["gold_refined",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["goldbar", 55000, 0, 56000, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["glass",1]
		] 
	],
	
	["tobacco_processed", 900, 0, 490, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["glass",1]
		] 
	],
	
	["sugar_processed", 280, 0, 360, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["tobacco_processed",1],
			["glass",1]
		] 
	],
	
	["rice_processed", 350, 0, 380, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["tobacco_processed",1],
			["glass",1]
		] 
	],
	
	["beer_processed", 1200, 0, 1500, 2, 1, 
		[ 
			["diamond_cut",1], 
			["oil_processed",1],
			["iron_refined",1],
			["copper_refined",1],
			["tobacco_processed",1],
			["glass",1]
		] 
	],
	
	["marijuana", 380, 0, 400, 10, 7,   
		[ 
			["cocaine_processed",1],
			["heroin_processed",1]
		] 
	],

	["cocaine_processed", 1300, 0, 1380, 15, 10,   
		[ 
			["marijuana",1], 
			["heroin_processed",1]
		] 
	],
	
	["LSD", 975, 0, 980, 15, 10,   
		[ 
			["cocaine_processed",1], 
			["heroin_processed",1]
		] 
	],
		
	["heroin_processed", 500, 0, 3, 15, 10,   
		[ 
			["cocaine_processed",1],
			["marijuana",1], 
			["LSD",1],			
			["cocaine_processed",1]
		] 
	],
	
	["ecstacy", 6000, 0, 6200, 15, 10,   
		[ 
			["cocaine_processed",1],
			["marijuana",1], 
			["LSD",1], 			
			["heroin_processed",1]
		] 
	]
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

////////////SYNC PRICES WITH SERVER IF EMPTY
//if(isNil("life_market_prices")) then
//{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Market Prices Generated!";
//};