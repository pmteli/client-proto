# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name:"Chicago' }, { name:"Copenhagen' }])
#   Mayor.create(name:"Emanuel", city: cities.first)

EcmCatalog.create(title:"Install Low Energy Lighting",
                  description:"Lighting Retrofit",
                  ecm_text:"Compact fluorescent lamps (CFLs) use about one-third the energy of incandescent lamps and last about ten times as long. Modern fluorescents tube lighting can save about
 one quarter when compared to their older vintage equivalents.",
                  clicks: 40,
                  completed: 25,
                  rejected:15)
EcmCatalog.create(title:"Install Refrigeration Controls",
                  description:"Refrigeration Controls",
                  ecm_text:"Older commercial refrigeration usually will not be as efficient as newer models. An electrician may be able to help you by installing controls that will reduce electric consumption and increase the life of the equipment.",
                  clicks: 80,
                  completed: 40,
                  rejected:40)
EcmCatalog.create(title:"Use refrigeration with night blinds or covers",
                  description:"Grocer Cases",
                  ecm_text:"Open displays are very inefficient. Curtains over refrigerated areas prevent 80 to 90% of air leakage and can reduce refrigeration running costs by 50%.",
                  clicks: 20,
                  completed: 2,
                  rejected:18)
EcmCatalog.create(title:"Check refrigeration seals",
                  description:"Leaky refrigeration",
                  ecm_text:"Leaky seals will make your refrigerator run longer, increasing your electric bills. Replacing worn seals will close up any leaks and cut your bills.",
                  clicks: 30,
                  completed: 10,
                  rejected:20)
EcmCatalog.create(title:"High Efficiency Pre-wash Spray",
                  description:"Use High Efficiency Pre-wash Sprays",
                  ecm_text:"Pre-wash sprays can account for up to 1/3 of water used in commercial kitchens. Replacing  pre-wash spray valves with high efficiency valves will reduce the hot water your kitchen consumes.",
                  clicks: 50,
                  completed: 10,
                  rejected:40)
EcmCatalog.create(title:"Use High Efficiency Refrigeration Lighting",
                  description:"Refrigeration Lighting",
                  ecm_text:"LED lighting for refrigeration can save as much as 85% over some older fluorescent bulbs. LED lights also have a much longer lifetime, which will reduce your maintenance costs.",
                  clicks: 70,
                  completed: 15,
                  rejected:55)
EcmCatalog.create(title:"Use Efficient Dishwashers",
                  description:"Dishwasher",
                  ecm_text:"Energy use is proportional to hot water use, so go for dishwashing units that use the least amount of water each wash and have standby water temperature for the rinse cycle.",
                  clicks: 25,
                  completed: 5,
                  rejected:20)
EcmCatalog.create(title:"Set Control Timers on Non-Perishable Refrigeration",
                  description:"Control Timers on non-perishables",
                  ecm_text:"Non-perishables like beer and sodas are typically refrigerated around the clock. You can cut your refrigeration needs by using timers to turn the cooler off out of hours, then cool them back down in the run up to opening.",
                  clicks: 90,
                  completed: 30,
                  rejected:60)
EcmCatalog.create(title:"Clean the back of your refrigerator",
                  description:"Clean and maintain refrigeration",
                  ecm_text:"Dust build up on the coils behind your refrigerator will hinder heat transfer and reduce the efficiency. Cleaning and maintaining refrigeration equipment is a quick and easy savings opportunity.",
                  clicks: 50,
                  completed: 10,
                  rejected:40)
EcmCatalog.create(title:"Check the efficiency of new catering equipment",
                  description:"Check the efficiency of new catering equipment",
                  ecm_text:"The energy rating should be prominently displayed. If you are using an electric hob, choose induction over the standard type - they are up to 50% more efficient 1.",
                  clicks: 42,
                  completed: 4,
                  rejected:38)
EcmCatalog.create(title:"Check your refrigerator temperature",
                  description:"Check your refrigerator temperature",
                  ecm_text:"This will depend on what you're cooling. It must be cool enough to provide proper food safety and quality, but don't set it too low - every 1o C  you cool things down lower than required  will result in 2% additional energy cost.",
                  clicks: 19,
                  completed: 3,
                  rejected:16)
EcmCatalog.create(title:"Install a Programmable Thermostat",
                  description:"Programmable Thermostats/ Unoccupied setback",
                  ecm_text:"Replace existing thermostats with seven-day programmable thermostats. This is a surprisingly easy fix that will allow you to schedule when your heating and cooling should turn on and off.",
                  clicks: 64,
                  completed: 8,
                  rejected:56)
EcmCatalog.create(title:"Use Energy Efficient Air Conditioners",
                  description:"EE Air Conditioning",
                  ecm_text:"Energy Efficient air conditioners use about 15% less electricity than standard models. The energy efficient models also typically include additional temperature and timer controls.",
                  clicks: 35,
                  completed: 5,
                  rejected:30)
EcmCatalog.create(title:"Choose the Right Temperature",
                  description:"Choose the right temperature",
                  ecm_text:"When setting your thermostats, make sure you select a temperature that keeps your occupants comfortable but doesn't over condition the space. Most people set their thermostats at 74 F(23 C) during the summer and 68 F (20 C) during the winter.",
                  clicks: 76,
                  completed: 20,
                  rejected:56)
EcmCatalog.create(title:"Use Energy Efficient Motors",
                  description:"EE Motors",
                  ecm_text:"When buying or replacing electric motors, consider nominal efficiency. Motors that run for long hours can cost more in annual energy use than their initial cost, meaning even small increases in efficiency are worthwhile.",
                  clicks: 35,
                  completed: 5,
                  rejected:30)
EcmCatalog.create(title:"Fit a Variable Speed Drive",
                  description:"Variable Speed Drives",
                  ecm_text:"Constant speeds fans run continuously whether needed or not. Variable speed drives can match the speed of fans to the current demand cutting consumption during milder periods.",
                  clicks: 64,
                  completed: 8,
                  rejected:56)
EcmCatalog.create(title:"Use Free Cooling",
                  description:"Free Cooling (don't use AC when not needed)",
                  ecm_text:"Turn off air conditioning when outdoor weather conditions are comfortable. Opening windows or circulating more outdoor air may be able to provide you with free cooling.",
                  clicks: 19,
                  completed: 3,
                  rejected:16)
EcmCatalog.create(title:"Install a high efficiency condensing boiler",
                  description:"High Efficiency Gas Hot Water Boiler",
                  ecm_text:"If you use a boiler, consider installing a high efficiency condensing boiler. These convert gas to heat with over 90% efficiency. Older boilers may be operating at less than 55% efficiency.",
                  clicks: 35,
                  completed: 5,
                  rejected:30)
EcmCatalog.create(title:"Repair leaks in compressed air systems",
                  description:"Check compressed air control/leaks",
                  ecm_text:"Leaks in compressed air systems will increase compressor cycling and energy use. Sealing these leaks will cut down on compressor use.",
                  clicks: 19,
                  completed: 3,
                  rejected:16)
EcmCatalog.create(title:"Reduce compressed air pressure",
                  description:"Reduce compressed air pressure",
                  ecm_text:"Reducing pressure in compressed air systems by 10% can save 5% in energy. In practice, pressure can be reduced incrementally to make sure that there are no adverse effects on valves or actuators.",
                  clicks: 86,
                  completed: 10,
                  rejected:76)
EcmCatalog.create(title:"Turn off unused compressed air",
                  description:"Switch off unused legs of compressed air",
                  ecm_text:"Switch off any unused legs in the compressed air system. This will reduce the risk of leaks in unused branches of the system.",
                  clicks: 12,
                  completed: 5,
                  rejected:7)
EcmCatalog.create(title:"Check and maintain your compressed air equipment",
                  description:"Check and maintain equipment",
                  ecm_text:"Properly maintaining your compressed air system will keep it running as efficiently as possible. Change oil filters, air filters and check condensate drains and drive belts regularly.",
                  clicks: 8,
                  completed: 5,
                  rejected:3)
EcmCatalog.create(title:"Recover waste heat in compressed air systems",
                  description:"Recover heat",
                  ecm_text:"A vast majority of energy used in compressed air systems is wasted as heat. Up to 90% of this heat can be recovered for space or water heating.",
                  clicks: 85,
                  completed: 10,
                  rejected:75)
EcmCatalog.create(title:"Install Ventilation Controls",
                  description:"Ventilation Controls",
                  ecm_text:"The purpose of ventilation systems is to remove emissions created by industrial machinery. By only operating these systems when equipment is running, a great deal of fan energy can be saved.",
                  clicks: 65,
                  completed: 10,
                  rejected:55)
EcmCatalog.create(title:"Install Low Energy Lighting",
                  description:"Lighting Retrofit",
                  ecm_text:"Compact fluorescent lamps (CFLs) use about one-third the energy of incandescent lamps and last about ten times as long. Modern fluorescents tube lighting can save about one quarter when compared to their older vintage equivalents.",
                  clicks: 97,
                  completed: 8,
                  rejected:89)
EcmCatalog.create(title:"Install occupancy sensors to shut off lights",
                  description:"Occupancy Sensors for Lights",
                  ecm_text:"Timing and proximity sensors help you to avoid lighting areas that are unoccupied. This simple installation typically pays for itself in a short period of time.",
                  clicks: 15,
                  completed: 3,
                  rejected:12)
EcmCatalog.create(title:"Leverage Daylighting",
                  description:"Leverage Day lighting",
                  ecm_text:"Daylight is freely available but often overlooked. Opening blinds, using daylight controls and taking advantage of natural light can offset electric lights with zero operational costs.",
                  clicks: 14,
                  completed: 4,
                  rejected:10)
EcmCatalog.create(title:"Install Time Clocks on Indoor Lighting",
                  description:"Time Clocks for Indoor Lighting",
                  ecm_text:"Lights are often left on after an area is unoccupied. Time clocks in areas where occupancy follows a common schedule will turn off lights during unoccupied hours.",
                  clicks: 50,
                  completed: 10,
                  rejected:40)
EcmCatalog.create(title:"Install photocells on exterior lighting",
                  description:"Photocell Controls for Outdoor Lighting",
                  ecm_text:"Use sensors on outdoor lighting to turn on lights only when the sun has set. Photocells will automatically turn on your exterior lights between dusk and dawn based on light levels.",
                  clicks: 15,
                  completed: 3,
                  rejected:12)
EcmCatalog.create(title:"Install energy efficient Exit signs",
                  description:"LED Exit Signs",
                  ecm_text:"Exit signs must be lit 24/7 making them a prime candidate for replacement. High efficiency models will meet safety requirements while cutting your electric bill.",
                  clicks: 14,
                  completed: 4,
                  rejected:10)
EcmCatalog.create(title:"Fit LED spotlights",
                  description:"LED Directional Lighting",
                  ecm_text:"Traditional tungsten halogen lamps are attractive but inefficient. Newer LED bulb are an alternative that use less than a quarter of the energy with the same light quality.",
                  clicks: 97,
                  completed: 8,
                  rejected:89)
EcmCatalog.create(title:"Install high efficiency Exterior Lighting",
                  description:"Exterior Lighting",
                  ecm_text:"Many buildings currently use older high-pressure sodium (HPS) or metal halide (MH) lamps for exterior lighting. LED or induction fixtures typically use half the energy of these older lights.",
                  clicks: 50,
                  completed: 10,
                  rejected:40)
EcmCatalog.create(title:"Local lighting",
                  description:"Local lighting",
                  ecm_text:"Use local strip lighting in areas where high visibility work is needed for work over equipment like grading machines. Choose units with electronic starters and thinner, high efficiency tubes.",
                  clicks: 15,
                  completed: 3,
                  rejected:12)
EcmCatalog.create(title:"Replace your Air Filters",
                  description:"Replace Filters",
                  ecm_text:"Air filters are typically replaced every 2-3 months. A dirty filter will hinder air flow and make systems work harder to heat or cool the space, wasting energy.",
                  clicks: 50,
                  completed: 10,
                  rejected:40)
EcmCatalog.create(title:"Keep an eye on your energy usage",
                  description:"Behavioural",
                  ecm_text:"Energy use tends to drift up over time. Keep track of your energy use to make sure you're not using more than you need.",
                  clicks: 15,
                  completed: 3,
                  rejected:12)
EcmCatalog.create(title:"Insulate and seal cellars",
                  description:"Insulate and seal cellars",
                  ecm_text:"A substantial amount of heat loss occurs through leaky cellars. By sealing and insulating this heat can be retained in occupied spaces.",
                  clicks: 32,
                  completed: 6,
                  rejected:28)
EcmCatalog.create(title:"Clean ducts and fans",
                  description:"Clean fans and ducts",
                  ecm_text:"Dust and debris can build up over time, making fans work harder to move air. Cleaning ducts and fans will reduce pressure in the system, making it run more efficiently.",
                  clicks: 13,
                  completed: 4,
                  rejected:9)
EcmCatalog.create(title:"Adjust your computer power settings",
                  description:"Computer Power Management Software",
                  ecm_text:"Default power settings may not be the most efficient way to run your computer. Change settings so that your computers will enter sleep mode during periods of inactivity.",
                  clicks: 9,
                  completed: 9,
                  rejected:0)
EcmCatalog.create(title:"Curtail standby loads",
                  description:"Phantom Load"" Power Strip",
                  ecm_text:"Many plugged in devices consume electricity even when they are not in use. Smart power strips will reduce the power consumed by task lighting,, computer accessories, fans, space heaters, and other miscellaneous plug loads.",
                  clicks: 4,
                  completed: 4,
                  rejected:0)
EcmCatalog.create(title:"Fit vending machines with occupancy sensors",
                  description:"Vending Machine Controls",
                  ecm_text:"Vending machines keep their lights and refrigeration even when no customers are around. Controls use motion sensors to power down vending machines when no one is around, and power up the machine when a person approaches.",
                  clicks: 32,
                  completed: 6,
                  rejected:28)
EcmCatalog.create(title:"Fit Self Closing Doors",
                  description:"Automatic doors",
                  ecm_text:"Use doors that close by themselves, whether automatic or spring hinged. This will keep cold out in the winter and the heat out in the summer.",
                  clicks: 13,
                  completed: 4,
                  rejected:9)
EcmCatalog.create(title:"Install Reflective Window Film",
                  description:"Reflective Window Film",
                  ecm_text:"Windows provide great natural light but also increase heat gain. Installing reflective window film will keep occupants more comfortable and cooling bills down while still allowing in natural light.",
                  clicks: 6,
                  completed: 6,
                  rejected:0)
EcmCatalog.create(title:"Use ceiling and cavity insulation.",
                  description:"Insulation",
                  ecm_text:"Poor insulation will cause drafts and make your heating and cooling systems work harder to keep you comfortable. Install insulation to keep warm air in the winter and warm air out in the summer.",
                  clicks: 32,
                  completed: 6,
                  rejected:28)
EcmCatalog.create(title:"If you''re not using equipment, switch off",
                  description:"Switch off equipment",
                  ecm_text:"It''s common to find factory equipment ""free wheeling"" between useful operation times. Encourage workers to switch equipment off if it's not being used immediately - especially at breaks and lunch times.",
                  clicks: 8,
                  completed: 8,
                  rejected:0)
EcmCatalog.create(title:"Smarter water heating",
                  description:"Smarter water heating",
                  ecm_text:"In agriculture and farming, most water heating systems are electrical. Make sure your water is heated on a cheap night rate tariff - also that all water containers, lids and pipes are well insulated.",
                  clicks: 2,
                  completed: 2,
                  rejected:0)








Action.create(code:"EONACT1",
              title:"Submit your own meter read",
              description:"Submit your own meter read",
              priority: 1,
              clicks: 12)
Action.create(code:"EONACT2",
              title:"Request a Smart Meter",
              description:"Request a Smart Meter",
              priority: 2,
              clicks: 25)
Action.create(code:"EONACT3",
              title:"Request Phone Audit",
              description:"Request Phone Audit",
              priority: 3,
              clicks: 79)
Action.create(code:"EONACT4",
              title:"Request a Business Energy Monitor",
              description:"Request a Business Energy Monitor",
              priority: 4,
              clicks: 32)
Action.create(code:"EONACT5",
              title:"Read a Case Study",
              description:"Read a Case Study",
              priority: 5,
              clicks: 76)
Action.create(code:"EONACT6",
              title:"Research products",
              description:"Research products",
              priority: 6,
              clicks: 23)
Action.create(code:"EONACT7",
              title:"Get a Staff Toolkit",
              description:"Get a Staff Toolkit",
              priority: 7,
              clicks: 12)




