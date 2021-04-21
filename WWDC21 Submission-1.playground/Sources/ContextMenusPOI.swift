// ContextMenusPOI.swift

// I didn't really want to have ContextMenus.swift have even more content in it, so I split it into here. JSON Would have been nicer, but unfortunatly I was running out of time and this worked well enough.

// Imports
import UIKit
import SceneKit
import ARKit
import PlaygroundSupport

public func returnPOIContext(num: String, query: String) -> contextQuery {
    var queryAnswer: contextQuery = contextQuery(title: "<NULL>", desc: "<NULL>", tableData: [])
    switch num {
    
    
    
    
    case "0":
        switch query {
            case "NYC": 
                queryAnswer.title = "New York City"
                queryAnswer.desc = "As extreme weather conditions and sea levels continue to rise, Hurricane like flooding across NYC could go from once every 500 years, to twice a decade according to new studies."
                queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"NYCFlooding.jpg")!), contextCell(cellText: "While this image thankfully was just a test against flooding, flooding of the subway systems HAS happened before, and is predicted to happen in increasing frequency, however the fact that testing was needed is a worrying sign.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"NYCFlooding2.jpg")!), contextCell(cellText: "Not just the Big Apple, but all around the world are these conditions going from extremly rare, to commonplace.", cellImage: UIImage(named:"blank.png")!)] 
        case "ALG": 
            queryAnswer.title = "Allergies and Heat"
            queryAnswer.desc = "Shown is the midwest. As temperatures rise, the amount of people with heat cramps, heat exaustion and HYPERthermia (too much heat) as well as heatstrokes will drastically increase. Days that are unusually hot hamper the bodies ability to regulate temperature."
            queryAnswer.tableData = [contextCell(cellText: "Dangerous diseases are also on the rise, with increased heat meaning deadly mosquitos once only found in Texas were suddenly found in California, all the way up to San Fransisco. These mosquitos carrying Malaria Dengue Fever and Chikungunya could spread as far as Chicago in the coming decades.", cellImage: UIImage(named:"blank.png")!)] 
        case "FS": 
            queryAnswer.title = "Food Shortages"
            queryAnswer.desc = "While this will be covered more in the next slides, food shortages are still a real problem, caused by unbearable heat destroying plants, and forcing less hours of work."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"FoodShortages.jpg")!), contextCell(cellText: "Already, food prices have risen on average 2.6% a year due to climate change, with extreme weather events having a greater effect on food, new equipment forces up prices, as does a lack of supply.", cellImage: UIImage(named:"blank.png")!)] 
        case "WQ": 
            queryAnswer.title = "Water Quality"
            queryAnswer.desc = "Shown is a mountainous area of Washington, where springs lie. Intense storms and heavy precipitation can result in the contamination of water resources."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"UrbanRunoff.jpg")!), contextCell(cellText: "In rural areas, runoff transports animal waste, pesticides and chemical fertilizer, and can enter drinking or recreational waters. Polluted drinking water can cause diarrhea, Legionnaires’ disease, and cholera; it can also cause eye, ear and skin infections. In some low-lying coastal areas, sea level rise could enable saltwater to enter groundwater drinking water supplies. ", cellImage: UIImage(named:"blank.png")!)] 
        case "LON": 
            queryAnswer.title = "Transport"
            queryAnswer.desc = "Shown is London, a transport hub, with more heat, it may become too hot for planes to fly, as well as land on potentially flooded airports. Turbulence will increase too, as winds grow stronger."
            queryAnswer.tableData = [contextCell(cellText: "Recreational travel could be upended as climate change impacts many popular destinations. Sea level rise, storm surge and erosion are affecting Waikiki Beach in Hawaii, Miami Beach in Florida, and Copacabana in Rio de Janeiro.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"plane.jpg")!)] 
        default:
            queryAnswer.title = "Unknown POI Found!"
            queryAnswer.desc = "An Error was Encountered!!!"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
}
        
        
        
        
        
    case "1":
        switch query {
        case "GBR": 
            queryAnswer.title = "The Great Barrier Reef"
            queryAnswer.desc = "Located off the coast of Austrialia, the Great Barrier reef is one of the single most stunning parts of our Earth, however due to multiple threats facing it due to climate change, this beautiful structure is corroding"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"bleachedCoral.jpg")!), contextCell(cellText: "Since the late 18th century, the earth’s oceans have absorbed about 30% of the additional carbon dioxide that human activities have injected into the atmosphere. This extra CO2 in the oceans has changed their chemistry, a process known as ocean acidification, decreasing oceans pH levels. ", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "These combined pressures make the world’s coral reefs much more vulnerable to poor health and irreplaceable damage, with the survival of the Reef for generations to come looking bleak.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"coral.jpg")!), contextCell(cellText: "Rising sea temperatures mean the Reef is at greater risk of heat stress and mass coral bleaching, decreasing the capacity for corals to build skeletons—which act as key habitats for the Reef's irreplaceable marine life. Higher sea levels impact many areas of overall ocean health including coastal erosion, the size of storm surges and protected shallow waters for marine organisms..", cellImage: UIImage(named:"blank.png")!)] 
        case "PLI": 
            queryAnswer.title = "Glacial Retreat"
            queryAnswer.desc = "Glaciers are monoliths, growing and shrinking each year as they grind the ground beneath them, slow moving crawlers, the worms of the earth. However ever since 1850 these have been shrinking faster and faster."
            queryAnswer.tableData = [contextCell(cellText: "Glaciers retreat when they melt more at the head than snowfall received at the rear. Ever since 1850 increasing temperatures and less rainfall have accelerated this process, releasing much of the worlds freshwater and contributing to sea level rise.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named: "galacierGraph.jpg")!), contextCell(cellText: "", cellImage: UIImage(named: "glaciers.jpg")!)] 
        case "ARI": 
            queryAnswer.title = "Arctic Ice"
            queryAnswer.desc = "The Arctic is covered in ice almost all year round, yet it is projected that by 2050 there will be no ice at all during the summer, spelling higher sealevels and a less stable climate."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"polarbear.jpg")!), contextCell(cellText: "Arctic Sea ice in 2020 was the second lowest on record, third is 2019, with the first being 2012, over time sea ice is shrinking, and habitats and jets like the polar stream are destroyed.", cellImage: UIImage(named:"blank.png")!)] 
        case "SFC": 
            queryAnswer.title = "Shellfish and Coral"
            queryAnswer.desc = "Shellfish and Corals as seen in the Great Barrier Reef are again along with many other wildlife forms being destroyed, as the ocean acts as a sink for CO2 we release into the atmosphere and heats up"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"shellfish.jpg")!)] 
        case "WTD": 
            queryAnswer.title = "Wetland Destruction"
            queryAnswer.desc = "Shown is the wetlands in the Gulf of Mexico, a homeland for hundreds of plants and animals, which is rapidly declining. "
            queryAnswer.tableData = [contextCell(cellText: "Wetlands destruction has increased flood and drought damage, nutrient runoff and water pollution, and shoreline erosion, and triggered a decline in wildlife populations.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"wetland.jpg")!)] 
        default:
            queryAnswer.title = "Unknown POI Found!"
            queryAnswer.desc = "An Error was Encountered!!!"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
        }
        
        
        
        
        
    case "2":
        switch query {
        case "ALK": 
            queryAnswer.title = "Alaska"
            queryAnswer.desc = "Alaska is a barometer for the rest of the world, and temperatures in the area have steadily risen alarmingly since 1980"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"alaskatemp.jpg")!), contextCell(cellText: "While Alaska has temperatures from the high 80's to the low -50's on average temperature is rising, as is the rest of the world. Alarming.", cellImage: UIImage(named:"blank.png")!)] 
        case "LKS": 
            queryAnswer.title = "Lake Superior"
            queryAnswer.desc = "An Icon of the United States, the famed Great Lakes, touted as extremly climate resistant however with climates increasing as they are, not even a lake noted as a stronghold against climate change can survive long."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"superiorHarbor.jpg")!), contextCell(cellText: "Lake Superior is not just warming; it’s warming faster than its surroundings. Climate change is affecting Lake Superior in some volatile ways. Its surface temperature has been going up, but with wild fluctuations. The average wind speeds have been increasing 5 percent each decade since 1980. And Superior has been pounded by three 500-year to one 1,000-year storm events in the past eight years.", cellImage: UIImage(named:"blank.png")!)] 
        case "ANE": 
            queryAnswer.title = "Animal Extinction"
            queryAnswer.desc = "Wild animals face new challenges for survival because of climate change. More frequent and intense drought, storms, heat waves, rising sea levels, melting glaciers and warming oceans can directly harm animals, destroy the places they live, and wreak havoc."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"pandasad.jpg")!), contextCell(cellText: "It is estimated that almost 1/3 of all animals and 1/2 of all plants will die out from the Earth due to climate change, the Sixth Great Extinction. With their habitats at threat and environment changing its not hard to see why. Seeing a large chunk of our biodiversity go up in smoke - litearlly - is extremly worrying.", cellImage: UIImage(named:"blank.png")!)] 
        case "GWS": 
            queryAnswer.title = "Leaded Gasoline"
            queryAnswer.desc = "A Triumph rather than a failure of humanity, is the abandonment of Leaded Gasoline, one reason you see the words Unleaded everywhere, is due to the harm leaded gasoline caused our society in the 60's and 70's"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"leaded.jpg")!), contextCell(cellText: "Lead destroyed Catalytic Converters, and released into the atmosphere leading to widespread lead poisioning. Through the efforts of Clair Patterson, also the first person to measure the age of the Earth accuratly, leaded gasoline was eventually entirely phased out, leading to a better environment, however there is still much work to do with other poisons.", cellImage: UIImage(named:"blank.png")!)] 
        case "OZD": 
            queryAnswer.title = "Ozone Depletion"
            queryAnswer.desc = "Shown is Antarctica, an area where the ozone layer protecting us from harmful UV Rays is weakest. As Cloroflourocarbons eat away at the atmosphere, these barriers slowly collapse and give way to harmful UV Rays decimating the atmosphere."
            queryAnswer.tableData = [contextCell(cellText: "Ozone layer depletion increases the amount of UVB that reaches the Earth's surface. Laboratory and epidemiological studies demonstrate that UVB causes non-melanoma skin cancer and plays a major role in malignant melanoma development.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"ozoneDepletion.jpg")!)] 
        default:
            queryAnswer.title = "Unknown POI Found!"
            queryAnswer.desc = "An Error was Encountered!!!"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
        }
        
        
        
        
        
    case "3":
        switch query {
        case "HUR": 
            queryAnswer.title = "Hurricanes"
            queryAnswer.desc = "Although scientists are uncertain whether climate change will lead to an increase in the number of hurricanes, there is more confidence that warmer ocean temperatures and higher sea levels are expected to intensify their intensity and impacts."
            queryAnswer.tableData = [ contextCell(cellText: "Warmer sea surface temperatures could intensify tropical storm wind speeds, potentially delivering more damage if they make landfall. Based on complex modeling, NOAA has suggested that an increase in Category 4 and 5 hurricanes is likely, with hurricane wind speeds increasing by up to 10 percent.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"hurricane.jpg")!), contextCell(cellText: "Areas affected by hurricanes are shifting poleward. This is likely associated with expanding tropics due to higher global average temperatures. The changing patterns of tropical storms (a shift northward in the Atlantic) could put much more property and human lives at risk.", cellImage: UIImage(named:"blank.png")!)] 
        case "LIS": 
            queryAnswer.title = "Lightning Strikes"
            queryAnswer.desc = "As CO2 increases and the land surface warms, stronger updrafts are more likely to produce lightning. In a climate with double the amount of CO2, we may see fewer lightning storms overall, but 25% stronger storms, with a 5% increase in lightning. It's Treason Then."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"totallyrelavant.jpg")!)] 
        case "POJ": 
            queryAnswer.title = "Polar Jets"
            queryAnswer.desc = "In winter, the polar regions are warmer. Scientists have observed that unusually warm temperatures in the polar regions tend to destabilize the jet stream. Because of global warming, the poles are warmer, so there is less of a temperature difference north and south of the jet stream."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"polarjets.jpg")!), contextCell(cellText: "This can cause extreme conditions. The UK has just experienced its  sunniest and fifth driest spring on record, an extraordinary about-turn after the wettest February on record just months earlier.∂", cellImage: UIImage(named:"blank.png")!)] 
        case "HWD": 
            queryAnswer.title = "Heat Waves"
            queryAnswer.desc = "Shown is South Africa, a place where extended heat waves have caused mass suffering. As seen from the Polar Jets point, these are only going to get worse in the coming years."
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"heatwavez.jpg")!), contextCell(cellText: "By midcentury, if greenhouse gas emissions are not significantly curtailed, the coldest and warmest daily temperatures are expected to increase by at least 5 degrees F in most areas by mid-century rising to 10 degrees F by late century. A recent study projects that the annual number of days with a heat index above 100 degrees F will double, and days with a heat index above 105 degrees F will triple, nationwide, when compared to the end of the 20th century.", cellImage: UIImage(named:"blank.png")!)] 
        case "FLD": 
            queryAnswer.title = "Flooding"
            queryAnswer.desc = "Shown is Bangladesh, a hotbed of flooding. With rising sealevels and extreme weather, it's not hard to see why this phenomenon is becoming more commonplace."
            queryAnswer.tableData = [contextCell(cellText: "Floods are made more likely by the more extreme weather patterns caused by long-term global climate change. Extreme floods can be triggered by intense precipitation, longer duration, close repetition of precipitations or a combination of these.", cellImage: UIImage(named:"blank.png")!), contextCell(cellText: "", cellImage: UIImage(named:"floods.jpg")!)] 
        default:
            queryAnswer.title = "Unknown POI Found!"
            queryAnswer.desc = "An Error was Encountered!!!"
            queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
        }
    
    default:
        queryAnswer.title = "Unknown POI Found!"
        queryAnswer.desc = "An Error was Encountered!!!"
        queryAnswer.tableData = [contextCell(cellText: "", cellImage: UIImage(named:"blank.png")!)]
}
    
    
    return queryAnswer
}

// If you truly read this code - I'm sorry, it's normally not like this :c
