# qb-beanmachine

Cool and Simple Beanmachine Job

[Github](https://github.com/Predator7158) 

[Join My Discord](https://discord.gg/nbMazBXaVa)

# Dependencies

[qb-core](https://github.com/qbcore-framework/qb-core) 

[qb-target](https://github.com/BerkieBb/qb-target) 

[qb-menu](https://github.com/qbcore-framework/qb-menu)

[qb-management](https://github.com/qbcore-framework/qb-management)

[Interior](https://unclejust.tebex.io/) 

# Insert into qb-core/shared/items.lua

```
	-- QB-BEANMACHINE
	--Drinks
	["bean-cafe"] 					 ={["name"] = "bean-cafe", 	    				["label"] = "Coffee", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "coffee.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coffee"},
	["bean-latte"] 					 ={["name"] = "bean-latte", 	    			["label"] = "Latte", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "latte.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Latte"},
	["bean-cappuccino"] 			 ={["name"] = "bean-cappuccino", 	    		["label"] = "Cappuccino", 				["weight"] = 1000, 		["type"] = "item", 			["image"] = "cappuccino.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cappuccino"},
	["bean-mocha"]                   ={["name"] = "bean-mocha", 	    			["label"] = "Mocha", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "mocha.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Mocha"},
	["bean-cmilkshake"]              ={["name"] = "bean-cmilkshake", 	    		["label"] = "Chocolate Milkshake", 		["weight"] = 1000, 		["type"] = "item", 			["image"] = "cmilkshake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chocolate Milkshake"},
	["bean-icetea"]              	 ={["name"] = "bean-icetea", 	    			["label"] = "Ice Tea", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "icetea.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Icetea"},
	--Foods
	["cookie"]              		 ={["name"] = "cookies", 	    				["label"] = "Cookie", 					["weight"] = 500, 		["type"] = "item", 			["image"] = "cookies.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cookies"},
	["donut"]              		 	 ={["name"] = "donut", 	    					["label"] = "Donut", 					["weight"] = 500, 		["type"] = "item", 			["image"] = "donut.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Donut"},
	["croissant"]              		 ={["name"] = "croissant", 	    				["label"] = "Croissant", 				["weight"] = 500, 		["type"] = "item", 			["image"] = "croissant.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Croissant"},
	["cupchocolate"]              	 ={["name"] = "cupchocolate", 	    			["label"] = "Chocolate Cupcake", 		["weight"] = 500, 		["type"] = "item", 			["image"] = "cupchocolate.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chocolate Cupcake"},					
	--Ingrediants
	["cocabeans"]              		 ={["name"] = "cocabeans", 	    				["label"] = "Coca Beans", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "cocabeans.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coca Beans"},
	["chocolate"]              		 ={["name"] = "chocolate", 	    				["label"] = "Chocolate", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "chocolate.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chocolate"},
	["whipcream"]              		 ={["name"] = "whipcream", 	    				["label"] = "Whipcream", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "whipcream.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Whipcream"},
	["milkbottle"]              	 ={["name"] = "milkbottle", 	    			["label"] = "Milk Bottle", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "milkbottle.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Milk Bottle"},	
	["teabag"]              	 	 ={["name"] = "teabag", 	    				["label"] = "Tea Bag", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "teabag.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Tea Bag"},		
	["sprinkles"]              	 	 ={["name"] = "sprinkles", 	    				["label"] = "Sprinkles", 				["weight"] = 100, 		["type"] = "item", 			["image"] = "sprinkles.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sprinkles"},		
```
# Insert into qb-core/shared/jobs.lua 

```
    ["beanmachine"] = {
		label = "Beanmachine",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 800
            },
			['1'] = {
                name = "Employee",
                payment = 1500
            },
			['2'] = {
                name = "Manager",
                payment = 3500
            },
			['3'] = {
                name = "CEO",
				isboss = true,
                payment = 5500
            },
        },
	},
```

# Don't Forget to add the images to inventory