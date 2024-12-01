
Components sourcing
- https://www.digikey.com/
- https://www.mouser.com/
- https://www.rs-online.com/

A shematic is to communicate information quickly, clearly, with low chance of misunderstanding.

At high speed the current ( EM Field) always takes the path of least impedance.

Impedance is the resistance to the flow of an alternating current in an circuit (AC).

We approximate the effects of electric fields with voltage differences and their interaction with conductors using capacitors.

We approximate the effects of magnetic fields with current and their interaction with conductors, inductors and resistors.

At high speed its about electron flow. Its about electro-magnetic waves.
Not about the conductor but the field that goes around the conductor.

## components distributors
- EBV (AVNet)

## PCB manufacturer
- PCBWay
- JLCPCB
- Seeed Studio
- PCBShopper


REDEXPERT WURTH https://redexpert.we-online.com/redexpert/#/module/15/productdata/=760308111/type/asc

CCI EUROLAM
https://www.ccieurolam.com/fr/basematerial/haute-frequence

Jean-Claude Roth
jcroth@ccieurolam.com
0472780194
0607398754

Witekio -- NXP partner in France
https://www.witekio.com/news-and-events/get-ready-new-i-mx-8-microprocessors/

DESIGN HOUSE
https://www.ryosan.co.jp/eng/what/base02.html
https://en.wikipedia.org/wiki/SEG_Plaza
https://www.olimex.com/wiki/Main_Page
https://www.olimex.com/forum/index.php

https://www.eevblog.com/wiki/index.php?title=Electronics_Design_Services

Commercial Support and Engineering Services | NXP

https://cif.fr/fr/
https://lcsc.com/

https://flylin.co/
http://www.txcube.eu/


ALTIUM Yeah the time to buy is usually April-Jun
their renewal prices become far more aggressive in the Spring.
It is best to negotiate with Altium near their year end, as they can be very aggressive at getting you to sign up.

https://sensepeek.com/

https://hotelelconsultants.net/hott/techtips/pcb-stack-up-1/


API GET PARTS
PN=SN74S74N
# https://www.mouser.fr/api-hub/
MOUSER_BASE_URL=https://api.mouser.com
MOUSER_API_KEY=d141f44e-ddaf-4b56-9d36-cce8a83df739

# https://octopart.com/api/home
OCTOPART_BASE_URL=https://octopart.com
OCTOPART_API_KEY=EXAMPLE_KEY #5a5a43c27ffda189f7b5

# https://partner.element14.com/docs/Product_Search_API_REST__Description
all:
	make mouser
	make octo
mouser:
	@http --body --pretty none \
	POST $(MOUSER_BASE_URL)/api/v1/search/partnumber \
	apiKey==d141f44e-ddaf-4b56-9d36-cce8a83df739 \
	SearchByPartRequest:='{ "mouserPartNumber": "$(PN)" }' \
	| jq '.SearchResults.Parts[] | { \
			mpn: .ManufacturerPartNumber, \
			mopn: .MouserPartNumber, \
			status: .LifecycleStatus, \
			mnf: .Manufacturer, \
			desc: .Description, \
			img: .ImagePath, \
			cat: .Category, \
			rohs: .ROHSStatus, \
			url: .ProductDetailUrl, \
			datasheet: .DataSheetUrl, \
			avail: .Availability, \
			fstock: .FactoryStock, \
			lead: .LeadTime, \
			altpkg: .AlternatePackagings, \
			replc: .SuggestedReplacement, \
			moq: .Min, \
			multi: .Mult, \
			reel: .Reeling, \
			attr: .ProductAttributes, \
			price: .PriceBreaks \
		}'
octo:
	curl -G ${OCTOPART_BASE_URL}/api/v3/parts/match \
    -d queries="[{\"mpn\":\"${PN}\"}]" \
    -d apikey=${OCTOPART_API_KEY} \
	| jq '.results[0].items[] | { \
			mpn: .mpn, \
			mnf: .manufacturer.name \
	}'


## Autorouter

Autorouter
Auto routers come in handy when you have complex boards with not much routing space, on non-critical parts of your layout. Non-critical parts of a board might include low frequency or static control signals to components like LED displays, switches and relays to name a few. Advanced autorouters do come with tools to let you specify exactly how you want electrically important tracks laid out. But by the time you have told it in excruciating detail what to do with every track, you could have layed it out yourself!
Never use an auto router to do your complete board, it will be a mess. But if you let it loose on a very specific non-critical area of your board, you can get some excellent results, sometimes indistinguishable from manual routing. You can even auto route a single connection, and this is sometimes handy when you are having trouble finding routing space in the final phase of your layout
Unless you are very experienced at PCB design, simply stay away from auto routers. This cannot be stressed enough. Real designers donâ€™t auto route!

## Formula
```
SPEED OF LIGHT IN VACUUM = 299 792 458 meter per second
lambda = speed of light / frequency
```

## PCB DESIGNS INSPIRATION
http://www.gendreaumicrosystems.com/pcb-examples.htm
https://www.nxp.com/design/designs:REFDSGNHOME#/
https://github.com/OLIMEX/OLINUXINO

Reducing SWaP - Size, Weight and Power

## Design Plan
do  the  critical  analog  routing  first,  highspeed/precision ADC and DAC stuff and power supply traces for high power signals.  Then thecritical digital routing like RAM, Flash, USB etcetera.  After that the non critical stuff and thepower supply at last.  Of course, this is what I do and not what you have to do.  I sometimesroute in a different order if I see that it would make the PCB easier to route

## RF
https://www.everythingrf.com/

FIND ANSWERS
https://forums.autodesk.com/t5/fusion-360-electronics/bd-p/6071
https://forums.autodesk.com/t5/eagle-forum/bd-p/3500
https://help.autodesk.com/view/fusion360/ENU/?guid=ECD-REFERENCE
https://community.nxp.com/
https://www.eevblog.com/forum/
http://dangerousprototypes.com/forum/
https://www.reddit.com/r/electronics/
https://www.reddit.com/r/ECE/
https://www.reddit.com/r/AskElectronics/
https://electronics.stackexchange.com/
https://forum.allaboutcircuits.com/
https://www.pcblibraries.com/forum/

DESIGN RULE CHECK 
https://www.pcbway.com/pcb_prototype/PCB_Design_Rule_Check.html

CAPABILITIES AND TOLERANCES (Fab. Tol Â±0.10mm compensation value)
https://www.pcbway.com/pcb_prototype/PCB_Manufacturing_tolerances.html
Quick-Turn https://www.pcbway.com/capabilities.html
Prototype https://www.pcbway.com/pcb_prototype/Pinted_Circuit_Board_Prototype.html
Advanced https://www.pcbway.com/advanced-pcb-capabilities.html
High-Tg https://www.pcbway.com/pcb_prototype/High_TG_PCBs_High_Temperature_PCB_fr4_Material.html
https://www.eurocircuits.com/pcb-design-guidelines-classification/
https://github.com/sparkfun/SparkFun_Eagle_Settings
Fabrication (Manufacturing) Tolerance: 
Ask your manufacturer if they over-size the land features. 
If they do, tell them that you already compensated for that in your CAD library. 
The IPC-7351 fabrication tolerance is 0.05mm.

0.5mm-pitch FCPBGA package âœ… (pcbway)  https://www.pcbway.com/pcb_prototype/PCB_BGA.html
			minimum BGA technology size (ball size)
				0.3mm -- 300micron / 0.2mm -- 200micron
			minimum BGA distance to circuit line
				0.2mm -- 200micron

optimize stitching vias
For all currents on a circuit board above 1 MHz, the return current is always flowing directly underneath the signal path. This is one of the most important principles in SI, PI and EMI.
the most important principle in SI/PI and EMI, that the return current will flow in the path of lowest resistance below about 10 kHz. But above about 10 kHz, the return current will begin to redistribute in the return path to be adjacent to the signal conductor. In this specific geometry, by 1 MHz, 99% of the return current is flowing adjacent to the signal conductor. The precise frequency where most of the return current is flowing adjacent to the signal path will vary depending on the specific geometry, but this is a good rule of thumb to keep in mind.
Even though alternative current paths are provided, the current will not take these paths but always take the path of lowest loop inductance. Like Maryâ€™s little lamb, above 10 kHz, wherever the signal current goes, the return current is sure to follow.
https://www.signalintegrityjournal.com/articles/1771-a-simple-demonstration-of-where-return-current-flows

reducing loop areas with optimizing current return paths for traces

# cost effective HDI for SI, PI, EMC !!!!
https://www.youtube.com/watch?v=TI5FfG0JSes

HIGH SPEED RULES FERANEC https://www.youtube.com/watch?v=BlHLmQ2HO1w

https://www.venture-mfg.com/capabilities/pcb-materials/

https://www.protoexpress.com/blog/pcb-substrates-knowing-dielectric-materials-properties/

## Storage / eMMC
Toshiba TSB3234X68354TWNA1 flash memory	
## OpenOCD flasher driver eMMC	https://github.com/nguyenvuhung/lauterbach_doc/blob/master/flash-arm_20160310121328_all_files/imx6quad-emmc.cmm\n\n21:09 PaulFertser: mauz555: well yes, but for flasher driver you'll likely want to have some RAM helper for speedup anyway.\n\n21:09 PaulFertser: mauz555: and if you can get running something from RAM you can run SPL
â“ SSD http://kcall.co.uk/ssd/index.html	
ðŸ›’ https://diskprices.com/?locale=fr	
Flash eMMC\n## Load u-boot from RAM	
https://www.amazon.com/gp/product/B009D79VH4/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B009D79VH4&linkCode=as2&tag=exploiteers-20&linkId=W2PVDONCERGTZM4H	
## Hacked SD Reader	https://320volt.com/en/32-gb-emmc-bellege-sd-kart-baglantisi/\n\nhttps://www.exploitee.rs/index.php/Exploitee.rs_Low_Voltage_e-MMC_Adapter\n\nhttps://shop.exploitee.rs/shop/low-voltage-emmc-adapter\n\nhttps://www.amazon.com/gp/product/B009D79VH4/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B009D79VH4&linkCode=as2&tag=exploiteers-20&linkId=W2PVDONCERGTZM4H
## add usb and use imx-usb-loader	https://bootlin.com/blog/factory-flashing-with-u-boot-and-fastboot-on-freescale-i-mx6/
# eMMC -- **SDINBDG4-16G-I1**	
## eMMC PROGRAMMER	RT809H \n\nhttp://www.ifix.net.cn/en/\n\nhttps://www.youtube.com/watch?v=DudjyIcumBo\n\nhttp://easy-jtag.com/easyjtag-acessories/\n\nhttps://www.youtube.com/watch?v=ny82c3wLOFo&feature=youtu.be\n\nhttps://www.youtube.com/watch?v=05tvBlLrPFw&feature=youtu.be\n\nhttps://forensicstore.com/product/up828-programmer/\n\nhttps://multi-com.eu/,details,id_pr,22160,key,up-828p-programmer,smenu,forensic_tools.html\n\nhttps://www.aliexpress.com/item/32270666224.html?spm=a2g0o.productlist.0.0.434949c4v0iGoo&algo_pvid=ba37451a-4a09-4900-a375-63d5f1e048b1&algo_expid=ba37451a-4a09-4900-a375-63d5f1e048b1-0&btsid=0be3743615877202380584897ef410&ws_ab_test=searchweb0_0,searchweb201602_,searchweb201603_
# Storage	


### SOC

ðŸ‡¨ðŸ‡³ Hisilicon Kirin\nhttp://www.hisilicon.com/en/Products/ProductList/Kirin	
ðŸ‡¨ðŸ‡³ Allwinner A13/A64	https://linux-sunxi.org/Main_Page\n\nhttps://m.1688.com/offer/569817146990.html?ptow=113d26e7c9a\n\nhttps://detail.1688.com/offer/558515823426.html\n\nhttps://www.minimachines.net/actu/bootlin-allwinner-67837\n\nhttps://www.alibaba.com/trade/search?fsb=y&IndexArea=product_en&CatId=&SearchText=allwinner+a64+chip&viewtype=&tab=\n\nhttps://linux-sunxi.org/Allwinner_SoC_Family\n\nhttps://datasheet.lcsc.com/szlcsc/1810010217_Allwinner-Tech-A13_C80524.pdf
ðŸ›’ https://www.96boards.org/	
ðŸ‡ºðŸ‡¸ Amlogic\nS905X: https://www.amlogic.com/#Products/196/index.html	
ðŸ›’ https://en.wikipedia.org/wiki/List_of_system-on-a-chip_suppliers	
ðŸ›’ https://elinux.org/Board_and_Chip_Vendors	
ðŸ›’ sbcfinder.com	
ðŸ‡ªðŸ‡º NXP i.MX 8MQuad	https://www.mouser.fr/Semiconductors/Embedded-Processors-Controllers/Processors-Application-Specialized/iMX-8M-Series/_/N-86p6v?P=1y98c82Z1yztjjk&Keyword=nxp+imx8m&Ns=Pricing%7c0&FS=True\n\nMIMX8MQ6DVAJZAB\nhttps://www.mouser.fr/ProductDetail/NXP-Semiconductors/MIMX8MQ6DVAJZAB?qs=sGAEpiMZZMu0J0Wcc3HWIhG9ph%252BpHUB57k2jLioVI783u0fA4p2jUw%3D%3D\n\nhttps://www.nxp.com/design/documentation:DOCUMENTATION#/\n\nhttps://community.nxp.com/community/imx\n\nhttps://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i.mx-applications-processors/i.mx-8-processors/i.mx-8m-family-armcortex-a53-cortex-m4-audio-voice-video:i.MX8M?tab=Documentation_Tab
ðŸ›’ https://www.board-db.org/	
ðŸŽ¨ GPU: https://en.wikipedia.org/wiki/Mali_(GPU)	https://linux-hardware.org/index.php?view=computers&type=System+on+chip\n\nhttps://www.reddit.com/r/pine64/comments/aw9q5r/why_did_pine64_chose_to_use_allwinners_soc_for/

### POWER

System-Side Gas Gauge	https://www.ti.com/power-management/battery-management/fuel-gauges/products.html#p1152=Single%20Cell&p338=Li-Ion/Li-Polymer&p199=I2C&p1960=System&o4=1&sort=p1960;desc
DESIGN FOR A11 TX COIL 5W-15W -- 760308111	
## Battery Pack	"4.35V Higher Voltage\n\nhttps://www.gsmarena.com/\nEnergy Density\n\nPouch Type LiPo -- Li+/ liHV ( higer voltage)\n\nhttps://www.bestgobattery.com/pouch-cells.html\n\nhttps://electronics.stackexchange.com/questions/244732/why-are-3-8v-lithium-ion-batteries-used-in-mobile-devices-rather-than-3-6v-or-3\n\nMoto G Power				 (5000 mAh)\niPhone 11 Pro Max	15.04 Wh (3969 mAh at 3.78 V) \niPhone X battery	10.35 Wh (2716 mAh at 3.81 V)\niPhone SE 2020		6.96  Wh (1821 mAh at 3.8 V)\n\nhttps://www.pdbattery.com/iphone-7-plus-battery-replacement.html\niPhone 7 Plus       11.02Wh  (2900mAh at 3.8 V)\n\nUltra-thin LiPo\nhttps://www.alibaba.com/products/4.35v_battery.html?IndexArea=product_en&sortType=TRALV\n\nhttps://www.pdbattery.com/lithium-polymer-battery\nhttp://www.minamoto.com/\nhttp://www.honcell.com/products/plist/id/33.html\nhttps://www.bzbattery.com/\nhttps://www.grepow.com/page/high-voltage-battery.html\nhttps://www.lipolbattery.com/LiPo-Battery-3.8V.html#:~:text=The%20high%20voltage%203.8V,power%20in%20the%20limited%20space.\nhttps://www.powerstream.com/thin-lithium-ion.htm\nhttps://www.alibaba.com/showroom/ultra-thin-battery.html\nhttps://www.pdbattery.com/ultra-thin-battery.html\nhttp://www.benzoenergy.com/small-lipo-battery/super-thin-battery.html\nhttps://www.lithium-polymer-battery.net/ultra-thin-lithium-polymer-battery/\nhttps://www.dnkpower.com/ultra-thin-battery/\nhttps://www.batteryspace.com/ultra-thin-wearable-batteries.aspx\n\nhttps://www.prnewswire.com/news-releases/top-20-lithium-ion-battery-manufacturing-companies-2018-visiongain-report-884311614.html\nhttps://www.imarcgroup.com/top-lithium-ion-battery-manufacturers\nhttps://www.aheadintel.com/leading-companies-lithium-ion-battery-market/\nhttps://uenergyhub.com/world-battery-companies/\nhttps://seekingalpha.com/article/4289626-look-top-5-lithium-ion-battery-manufacturers-in-2019\n\nNokia li-ion Battery:\nPKCELL: http://www.pkcell.net/?p=1073#more\nultra thin battery\nOn Mesure Battery: https://www.lipolbattery.com/Novel-LiPo-Battery.html\nhttp://crsengineering.altervista.org/eng/pi/pi_GPIO_poweroff_eng.html\nhttps://shop.pimoroni.com/products/adafruit-micro-lipo-usb-liion-lipoly-charger-v1\nhttps://shop.pimoroni.com/products/lipo-battery-pack?variant=20429082183\nhttps://shop.pimoroni.com/products/lipo-shim#show-accessories"
Coils	Coils\n\nhttps://www.we-online.com/web/fr/electronic_components/news_pbs/blog_pbcm/blog_detail-worldofelectronics_100415.php\n\nhttps://www.we-online.de/katalog/en/WE-WPCC-RECEIVER\n\nhttps://redexpert.we-online.com/redexpert/#/module/71015/productdata/=760308103211/comp/asc/Ir/gte:1.5A/heightmax/lte:1mm\n\nNFC + WPC\nhttps://www.we-online.de/katalog/en/WE-WPCC_COMBINATION_COILS/\n\nhttps://www.we-online.de/web/de/electronic_components/produkte_pb/demoboards/wireless_power/mix_and_match/mixandmatch.php\nhttps://www.youtube.com/watch?v=liaEV14zs0Q\nhttps://www.ifixit.com/Teardown/iPhone+8+Teardown/97481\n\nReceiver \nhttps://www.we-online.de/katalog/en/WE-WPCC-RECEIVER/?m=n&sp=http%3A%2F%2Fwww.we-online.de%2Fweb%2Fen%2Felectronic_components%2Fsearchpage_PBS.php%3Fsearch%3D760308102207#760308102207\n\nTransmitter\nhttps://www.we-online.de/katalog/en/WE-WPCC-TRANSMITTER/?_ga=1.36516128.1096983208.1476877057&m=n&sp=http%3A%2F%2Fwww.we-online.com%2Fweb%2Fen%2Fwuerth_elektronik%2Fsearchpage.php%3Fsearch%3D760308110#760308110
Power Consumption & Efficiency	https://powerefficiency.com/\n\nWireless Charging by default\n\nhttps://wisebatt.com/\n\nhttps://batteryuniversity.com/\n\nhttps://learn.sparkfun.com/tutorials/what-is-a-battery\n\nhttps://learn.sparkfun.com/tutorials/battery-technologies\n\nhttp://batteryuniversity.com/learn/article/when_was_the_battery_invented\n\nLiPo Battery\n\nhttps://www.amazon.com/usb-lipo-charger/s?page=1&rh=i%3Aaps%2Ck%3Ausb%20lipo%20charger\n\nhttps://hobbyking.com/en_us/turnigy-2200mah-3s-25c-lipo-pack.html?___store=en_us\n\nhttp://www.hackvana.com/store/index.php?main_page=index&cPath=18_19\n\nBoost Converter\n\nhttps://en.wikipedia.org/wiki/Boost_converter\n\nhttps://hackaday.com/2018/07/08/ultra-low-power-energy-harvesting-battery-charger/\n\nPMIC\n\nhttps://www.cnx-software.com/2018/07/12/banana-pi-bpi-m2-plus-v1-2-board-power-management-unit-pmu/\n\nPad de recharge sans fil solaire ou cable\n\nhttps://www.ebay.com/itm/Lithium-Battery-Power-Supply-Expansion-Board-with-Switch-for-Raspberry-Pi-3-1pc/112852764562?epid=553828467&hash=item1a468c8792:g:eyYAAOSwuIRannTO\n\nhttps://averagemaker.com/2016/06/lipo-batteries.html
**Power and Battery**\n\nLasts up to 2 hours longer than iPhone 7\n\n**Talk time (wireless):** Up to 21 hours\n\n**Internet use:** Up to 12 hours\n\n**Video playback (wireless):** Up to 13 hours\n\n**Audio playback (wireless):** Up to 60 hours\n\n**Fast-charge capable:**\n\n- Up to 50% charge 30 minutes\n- Built-in rechargeable lithium-ion battery\n- Wireless charging (works with Qi-certified chargers)\n- Charging via USB to computer system or power adapter	
## wireless power receiver and battery charger	"https://www.mouser.fr/Search/Refine?Keyword=121372014&FS=True&Ntk=P_MarCom\nhttps://www.mouser.fr/Semiconductors/Power-Management-ICs/_/N-wnwh\nhttps://octopart.com/search?q=wireless+powerÂ¤cy=EUR&specs=1&category_id=4305\n\nIntegrated Circuits\n\niPhoneX wireless charging controller: BCM59355\nhttps://www.broadcom.com/products/Wireless-Charging/Wireless-Charging-Solutions/BCM59350\n\nhttps://www.ti.com/tool/TIDA-00318\nhttps://www.ti.com/tool/TIDA-00712\nhttps://www.ti.com/tool/TIDA-00668\nhttps://www.ti.com/tool/TIDA-00881\nhttps://www.ti.com/tool/PMP11311\n\nSTMicro\n\n	https://www.st.com/en/power-management/wireless-charger-ics.html\n	\n	STWLC68 - Qi-compliant inductive wireless power receiver for 5W applications\n		https://www.st.com/content/st_com/en/products/power-management/wireless-charger-ics/stwlc68.html\n		\n	STWBC-EP (STEVAL-ISB044V1) Qi MP-A10 15 W wireless charger TX evaluation kit based on STWBC-EP \n		www.st.com/content/st_com/en/products/evaluation-tools/solution-evaluation-tools/psu-and-converter-solution-eval-boards/steval-isb044v1.html\n\nTI \n\n\n\nNXP\n\nhttps://www.nxp.com/products/power-management/wireless-power:WIRCHA_ICS\n	\nMWPR1516 - 15 Watt Wireless Charging Receiver ICs\nhttps://www.nxp.com/products/power-management/wireless-power/15-watt-wireless-charging-receiver-ics:MWPR1516\n\n\nWPC 1.2 Qi-compliant Charger\nhttps://www.nxp.com/products/power-management/wireless-power/nxq1txh5-wpc-1-2-qi-compliant-wireless-charger-demo-board:NXQ1TXH5DB1401\n\nMP-A11 Fixed Frequency Transmitter 22 watts capability Reference Design\nhttps://www.nxp.com/design/designs/mp-a11-fixed-frequency-transmitter-22-watts-capability-reference-design:WCT-15W1CFFPD\n\n\nSemTech \n\nhttps://www.semtech.com/products/wireless-charging\nhttps://octopart.com/search?q=wireless+power&currency=EUR&specs=1&category_id=4305&manufacturer_id=578\n\nRohm \n\nhttps://www.rohm.com/wireless_power\nhttps://octopart.com/search?q=wireless+power&currency=EUR&specs=1&category_id=4305&manufacturer_id=574\nBD57011AGWL-E2\nBD57015GWL-E2\nBD57016GWL-E2\nBD57020MWV-E2\n\n\nMicrochip\n\nhttps://www.microchip.com/design-centers/intelligent-power/applications/wireless-power\n\nMaxim Integrated\n\nhttps://octopart.com/search?q=wireless+power&currency=EUR&specs=1&category_id=4305&manufacturer_id=244\n\nRenesas (IDT) \n\n	https://www.renesas.com/eu/en/products/power-management/pmic/ics-for-wireless-charging-system.html\n	https://www.idt.com/us/en/products/power-power-management/wireless-power\n\nAnalog Device  \n\nhttps://www.analog.com/en/products/power-management/battery-management/wireless-power-transfer.html"
Magnetic Shield	https://www.mouser.fr/Passive-Components/EMI-Filters-EMI-Suppression/EMI-Kits/_/N-92on3?Keyword=magnetic+shield&FS=True\n\nhttps://www.mouser.fr/Passive-Components/EMI-Filters-EMI-Suppression/EMI-Gaskets-Sheets-Absorbers-Shielding/_/N-bkrm8?Keyword=magnetic+shield&FS=True
http://www.pkcell.net/?p=1067	
PROTECTION	"If the battery discharge below a certain limit\nthere is a high probability that it will fail\n\nsame for overcharging\n\nfully charge li-ion voltage is 4.2V\n\nrecharging can cause bilstering and explosion of the battery\n\nsame will happen in the case of overload and short-circuit\n=> heating, formation of gases and finally explosion of the battery\n\nWITHOUT AN ADDITIONAL ""PROTECTION SYSTEM"" LI-ION MUST NOT BE USED !!!\nhttps://learn.adafruit.com/li-ion-and-lipoly-batteries/conclusion\n\nTHE CHARGING HAS TO BE INTERRUPTED IF THE CELL VOLTAGE IS ABOVE 4.2V\nTHE DISCHARGING HAS TO BE INTERRUPTED IF THE CELL VOLTAGE IS BELOW 2.5V\nTHE MAXIMUM CURRENT HAS TO BE LIMITED TO A FEW AMPERES\nWE WANT THIS PROTECTION BUILT-IN THE BATTERY ITSELF\n\nPROTECTION BOARD Protect from \n	- deep discharge\n	- over-charging\n	- shot-circuits\n	- over-current\n\nPROTECTION CHIPS \n\nDW01-P + 2 MOSFET transistor\n\nor \n\nFS8205A\n\nhttps://hackaday.com/2020/04/05/turn-off-those-batteries-with-their-protection-chip/\nhttps://hackaday.com/2019/11/13/lessons-in-li-ion-safety/"
# PMIC / PMU / PSU / WIRELESS CHARGING	"These two parts have similar function,PCA9450 has 400mA load switch and IIC level translator BUT BD71847AMWV doesn't have these.\n\nROHM BD71847AMWV\n\n	https://www.rohm.com/products/power-management/power-management-ic-for-system/industrial-consumer-applications/nxp-imx/bd71847amwv-product\n\nTI TPS6521825+LP873347\n\nhttps://www.ti.com/product/TPS6521825/toolssoftware\nhttps://www.ti.com/sitesearch/docs/universalsearch.tsp?searchTerm=NXP%20i.MX%208M%20mini#q=NXP%20i.MX%208M%20mini&t=everything&linkId=1\nhttp://www.radiumboards.com/products/industrial/i-mx-8m-mini-som-board\n\n\nðŸŒŸ ROHM WIRELESS CHARGING https://www.rohm.com/wireless_power\n\nInductive charging -- inductive charging metal enclosure\nhttps://www.corning.com/gorillaglass/worldwide/en/glass-is-better-for-wireless-charging.html\nhttps://www.rohm.com/new-products?newproduct-title=2015-11-17_ad_qi\nhttps://www.rohm.com/qi-support\nhttps://www.mouser.fr/ProductDetail/?qs=vLWxofP3U2yZvi3MKsqG9Q%3D%3D\nhttps://www.rohm.com/products/power-management/power-management-ic-for-system/industrial-consumer-applications/nxp-imx/bd71847amwv-product/documents\nhttps://www.nxp.com/design/designs/mp-a11-fixed-frequency-transmitter-22-watts-capability-reference-design:WCT-15W1CFFPD\nhttps://electronics.stackexchange.com/questions/79279/does-mah-measure-how-long-a-battery-would-last\nhttps://electronics.stackexchange.com/questions/2601/how-can-i-tell-how-much-juice-a-lipo-battery-still-has-in-it"

### PCB 
The simplest way to ensure the correct laminate/material is issued is to tick the requirements, and record what is issued, because of traceability, we need to also record the certificate of conformance details of the laminate/material issued.	
(Df) dissipation factor	
NPG-181\nhttps://www.npc.com.tw/j2npc_ext/public/userfiles/prodnews/file/20201016-TPCA_show-poster.pdf	
High-speed 1-5GHz	
Due to the geometry of the glass fabric weave used in the construction of the PCB, the impedance of a signal trace may change based upon the orientation and the position in relation to the weave.	
low-k for low impedance good lossless signal propagation	
https://www.signalintegrityjournal.com/articles/1336-demystifying-pcb-transmission-line-interconnect-modeling	
https://eesemi.com/dielectric-constant.htm	
Fluorine-series resin â€” materials like PTFE have excellent dielectric performance and can be a great choice if you need at least 5GHz frequency. Their cost is probably the highest of all three types, and they have a high thermal expansion coefficient. However, they perform impressively in areas of dielectric loss and constant and absorbing water.\n    PPO or PPE resin â€” a suitable option for 1â€“10GHz frequencies. They secure an all-around decent performance of your board.\n    Modified epoxy resin â€” they can also be a good choice for frequencies between 1GHz and 10GHz. In general, they have the most affordable cost, which is the reason for their popularity. For example, PTFE, which falls into the fluorine-series category is highly considered. It has excellent dielectric performance and can be a great choice if you need at least a 5GHz frequency.	
**â€œstandard FR4â€** mean a laminate having :\n+ a typical dielectric constant (Dk) of about 4.3\n+ dissipation factor (Df) of 0.020 â€“ 0.025 at 1MHZ\n+ 50% resin content.	
https://www.edn.com/selecting-pcb-materials-for-high-frequency-applications/	
https://www.ccieurolam.com/fr/basematerial/haute-frequence	
https://resources.pcb.cadence.com/blog/2019-high-speed-pcb-and-system-design-your-top-circuit-board-material-considerations	
TU-901 http://www.tuc.com.tw/en-us/products-detail/id/40	
Elite Material Leader mondial	
â“ woven glass weave	https://blog.lamsimenterprises.com/2010/12/14/pcb-fabrication-overview/\nhttps://www.vetrotextextiles.com/technical-information-glossary-terms\nhttps://www.vetrotextextiles.com/applications/electrical\nhttps://rushpcb.com/fiberglass-fabric-styles-used-in-laminates/
ðŸŸ« DIELECTRIC -- PREPREG (Preimpregnated Bonding Layers) & LAMINATES	
https://www.signalintegrityjournal.com/articles/1336-demystifying-pcb-transmission-line-interconnect-modeling	
(Dk or Er) dielectric constant or relative permittivity\n+ PTFE 2.1\n+ RO4000\n+ FR-4 4.5	
**Match Coefficient of Thermal Expansion (CTE)**: CTE is the most important Of the substrate qualities pertaining to temperature. As with Dk, the CTE between two substrates must match.\n\nElse, the two substrates might expand at different speeds and consistencies. During the fabrication process, differing CTEâ€™s can result in defects. In operation, this could change the physical geometry of the substrate and lead to non-uniform Dks. Also, the clashing CTEâ€™s could impact the Dkâ€™s when the PCB is in use.	Match Coefficient of Thermal Expansion (CTE) - There are several temperature related characteristics for substrates, but CTE is the only one Iâ€™ll mention. If you go on a double date, your friendâ€™s compatibility will affect yours. Your substrate componentâ€™s CTE can affect its Dk. If the components of your substrate have different CTEs, they may expand at different rates during fabrication or operation. In fabrication, this can lead to defects. In operation, this could change the physical geometry of the substrate and lead to non-uniform Dks. In love this will lead to a ruined relationship.
**Micron recommends FR-4 for PCBs**, because of its low cost, low moisture absorption, and low electrical conductivity inmodule fabrication. The dielectric constant of PCB materials for most memory applications is 3.6 to 4.5, varying slightly with frequency, temperature, material, and resin-to-glass ratio. FR-4, one commonly used dielectric material, averages 4.2 with signaling at 100 MHz.	
https://cdn.website-editor.net/ffa329bc53b7408f8bf2b7721450901d/files/uploaded/Sunshine%2520Corporate%2520Overview%252C%2520Oct%25202018.pdf	
(Tg) glass transition temperature, which is the point where heat causes the material to deform or soften and may be customized	
**Match the Dielectric Constants**: The Dkâ€™s of the different dielectric constants need to be matched to one another on PCBs. If the Dkâ€™s contradict, problems are likely to emerge. An example of mismatched DKâ€™s could be a resin paired with a woven layer.	Match Dielectric Constants - When dating you want a personality match, in PCBs you want a Dk match. If your PCB substrate is made of a resin and woven material they may have different Dks. Non-uniform Dks in your substrate will cause problems. You should check with your manufacturer to make sure you get all of your substrateâ€™s Dks as close as possible.
Manufacturing Defects - Oh yeah, remember those things? Well, they happen even more often with high-frequency materials. Some materials, like PTFE, are especially vulnerable to defects. Make sure youâ€™re getting in bed with the right manufacturer before they break your boards and your heart.	
#NAME?	
**Tight Substrate Weave**: The substrate must be woven tightly for the material, and meshed to properly interact. If not, the DKâ€™s will be negatively impacted.	Tight Substrate Weave - You want to mesh well with your partner. The woven part of your substrate also needs to mesh tightly. A loosely woven substrate will lead to vibe killing differing Dks.
https://www.mclpcb.com/pcb-material-selection-guide/	
Ajinomoto Buildup Film	
thickness of the outside to nearest inner layer is the most important dimension	
**FR-4 is not an option** : As earlier mentioned, FR-4 is a no-no for high-frequency PCBs. Due to its enticing price, many tend to settle down for it, even when itâ€™s clearly ill-suited for their PCBs. For circuits that generate high frequencies, FR-4 is not your friend, since it is obvious you should use a low loss substrate.	Donâ€™t Use FR4 - It was obvious I shouldnâ€™t have worn velour to a speed date, but I still did it. Itâ€™s also obvious you should use a low loss substrate. However, some people out there are still using FR4 for their high-frequency circuits. FR4 is not an appropriate material for high-frequency applications, use something else.
https://www.protoexpress.com/blog/pcb-substrates-knowing-dielectric-materials-properties/	
https://www.polarinstruments.com/support/si/AP8173.html	
http://www.hottconsultants.com/tips.html	
low water absorbtion\nThe dielectric constant of PCB materials will vary with humidity and temperature. Since water has a high Dk value of about 80, any material that absorbs water in a high-humidity environment will exhibit an increase in Dk, resulting in a change in high-frequency circuit performance.	
The best possible material is used depending on the desired final PCB thickness, stack-up, dielectric constant (impedance), dimensional stability (registration) and cost.	
distance between the two inner layers (and as a result of the entire board thickness) is the least important	
https://whatis.techtarget.com/definition/dielectric-constant	
Use a Smooth Foil - Beauty, and apparently current, is only skin deep. A smooth copper foil will ensure lower resistive losses at extremely high frequencies.	
PCBWAY TU-768\nhttps://www.pcbway.com/blog/PCB_Basic_Information/TU_768__High_Speed_Digital__HSD___PCB_Materials.html	
Glass has a dielectric constant of approximately 6, and the resin has a dielectric constant of approximately 3. So an FR4 PCB can typically have a figure ranging from under 4, to almost 5.	

## Magnetic sheet
https://product.tdk.com/info/en/products/noise_magnet-sheet/index.html


### Display
BOE\nhttps://www.boe.com/en/product/dkqj/xsycg/amoled/sjcp/\nhttps://www.boe.com/en/product/dkqj/xsycg/wxs/mds/	
ðŸ“„ https://docs.google.com/spreadsheets/d/18izbiThYyO9UTMbBaOp4_UuKM8YqIjPZnjuAyPpSTEU/edit#gid=920790485	
ðŸŒŸ https://marketplace.oled-info.com/	
### Display Drivers Compatiblity\nhttps://community.nxp.com/thread/500017\ncompat DRM (https://community.nxp.com/thread/520748)\n\ncompatible DRM controller -- MIPI-DSI to Panel\nhttps://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/panel?h=next-20200608\nhttps://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/panel?h=git.kernel.org%2Flinux-stable%2Flinux-5.7.y\n\nex: \nRaydium RM67191\nhttp://www.lcddisplaymodule.com/sale-10554222-5-49-inch-full-color-amoled-display-rgb-custom-oled-screen.html \n\ncompatible DRM controller -- MIPI-DSI Bridge to Panel\nhttps://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge?h=git.kernel.org%2Flinux-stable%2Flinux-5.7.y\n\n### Touchscreen Controller Compatibility\nhttps://linux-sunxi.org/Touchscreen\n\n**Goodix**\nhttps://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/goodix.c\nhttps://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml\nhttps://github.com/pimoroni/HyperPixel4TouchScreen\nhttps://community.nxp.com/thread/510499\n\n**FocalTech**\nhttps://github.com/torvalds/linux/blob/master/drivers/input/touchscreen/edt-ft5x06.c\nhttps://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml	
EDO\nhttp://www.everdisplay.com/en/product.php	
### PPI calculator\nhttps://www.calculatorsoup.com/calculators/technology/ppi-calculator.php	
ðŸ­ https://www.oled-info.com/companies-list/oled-display-producers - https://en.wikipedia.org/wiki/List_of_flat_panel_display_manufacturers	
TCL/CSOT\nhttp://en.szcsot.com/ProductsSt_sjxs.html	
PCAP vs ONCELL vs INCELL\nhttps://ihsmarkit.com/research-analysis/q22-in-cell-or-on-cell-two-camps-form-around-rival-touch-technologies-v2.html\nhttps://fieldscale.com/learn-capacitive-sensing/touch-sensor-stackups-materials-structures/	
Plessey microLEDs\nhttps://plesseysemiconductors.com/	
ðŸŒŸ https://www.panoxdisplay.com/	
https://www.nature.com/articles/s41377-020-0341-9	
ðŸŒŸ https://www.lcds-center.com/	
AUO\nhttps://www.auo.com/en-global/application/detail/Smartphone_Applications	
### AMOLED ?\nhttps://www.alibaba.com/product-detail/3-81-inch-1080-1200-HD_62464730920.html?spm=a2700.12243863.0.0.3a213e5fRUCXza\nhttp://www.panelook.com/AMS395GB02_Samsung_4_OLED_overview_15186.html\nhttps://www.alibaba.com/products/AMS395GB02.html?IndexArea=product_en&sortType=TRALV\nhttps://www.alibaba.com/product-detail/Brand-new-original-AMS395GB02-4-inch_60809631618.html?spm=a2700.galleryofferlist.0.0.27db6681uyMDn0	
eMagin Micro Display\nhttps://www.emagin.com/	
https://macropolo.org/digital-projects/supply-chain/oled-display/inside-an-oled-display/	
Japan Display\nhttps://www.j-display.com/english/product/mobile.html	
Innolux (Foxconn)\nhttp://www.innolux.com/Pages%2fen%2fIndex_en.html	
### iPhone Screen Teardown\nhttps://blog.rewatechnology.com/iphone-x-oled-screen-total-teardown/\nhttps://blog.rewatechnology.com/rewa-mobile-phone-lcd-refurbish-solution-v2-0-economical-solution/	
**Requirements**\n- 3.97" (10cm)\n- (AM)OLED\n- high color gamut \n- 18-bit colour (262,144 colours)\n- 60 FPS frame rate\n- 58.5x97x12mm (WxHxD)\n- Contrast ratio: 500:1\n- 480*800 - 235 ppi\n- MIPI DSI interface\n- Capacitive multi-touch	
### Touch Panel Structure\nhttps://optical.getac.com/technologies/GG-GFF.html\nhttps://www.ronben.com/support/A-Z-knowledge-about-tablet-PC-capacitive-touchscreen.htm	
ðŸ›’ https://www.panelook.com/modelsearch.php?op=brand	
ðŸŒŸ http://www.panelook.com/	
ðŸ”Œ https://www.usmicroproducts.com/blog/understanding-display-interfaces	
olightek Micro Display\nhttp://www.olightek.com/product/6/	
ðŸŒŸ LCD SCREEN TOOLS\nhttps://www.calculatorsoup.com/calculators/technology/ppi-calculator.php	
here is our spec:\n* 5inch touchscreen\n* vertical orientation\n* 16:10 or 5:3 aspect ratio\n* highend AMOLED\n* Full Viewing Angle\n* 24-bit color depth - 16.7M colors\n* 480*800 60 FPS - 235ppi\n* 700nits (cd/cm2) brightness\n* 700:1 contrast\n* MIPI DSI interface (custom termination connector)\n* Display IC Linux compatible (ILITEK / SITRONIX / ?)\n* Capacitive Touch - 5 points \n* I2C interface (custom termination connector)\n* Touch IC Linux Compatible (FocalTech? Goodix?)\n* RoHS Compliant\n\n* can you do Custom FFC/FPC Connectors Type ? Hirose Molex ?\nhttps://www.molex.com/molex/products/family/slimstack_fine_pitch_smt_board_to_board_connectors\n\n* can you do Custom cover glass design ?\nspecific cut for the corner so it fits our enclosure ?\nbezel-less (reduce black margin/full viewing area ?)	
https://www.youtube.com/watch?v=cFvh7qM6LdA	
Visionox\nhttp://www.visionox.com/en/products.html	

### Connectors
# MIPI-CSI 24PIN Connector	Molex\n\nhttps://www.molex.com/molex/search/deepSearch?pQuery=q%253D*%253A*%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dproductname%253A%2522SlimStack%2522%2540fq%253Dcircuitsloaded%253A%252240%2522%2540fq%253Dcircuitsloaded%253A%252240%2522%2540fq%253Dcategory%253A%2522PCB%252BReceptacles%2522%2540fq%253Ddurabilitymatingcyclesmax%253A%252230%2522Â¤tQuery=hflh%3ALow-Halogen&origin=_l1stv13w\n\n**FIRST CHOICE**\n505066-2422 + 5050702422\nhttps://www.molex.com/molex/products/part-detail/pcb_receptacles/5050662422\nhttps://www.molex.com/molex/products/part-detail/pcb_headers/5050702422\nhttps://www.mouser.fr/ProductDetail/Molex/505066-2422?qs=%2Fha2pyFaduicjkaDS%2FEO6vVrUQ1iqZaUQNaLs3Y9gYHzGPnLxq4W1g%3D%3D\nhttps://www.mouser.fr/ProductDetail/Molex/505070-2422?qs=%2Fha2pyFaduilo6nU8JIoVgJPGT6WhnZpFiz4cxH%2FybFYpmytlD2BxQ%3D%3D\n\n**MOST AVAILABLE SECOND CHOICE**\n505270-2412 + 5050704022\nhttps://www.molex.com/molex/products/part-detail/pcb_receptacles/5052702412\nhttps://www.molex.com/molex/products/part-detail/pcb_headers/5050702422\nhttps://www.mouser.fr/ProductDetail/Molex/505270-2412?qs=%2Fha2pyFaduiDuVotJOEZ0hU0bxDl0AWhtII0nYdotiIaj%252B5bqw1Ltw%3D%3D\nhttps://www.mouser.fr/ProductDetail/Molex/505070-2422?qs=%2Fha2pyFaduilo6nU8JIoVgJPGT6WhnZpFiz4cxH%2FybFYpmytlD2BxQ%3D%3D\n\nHirose\n\nhttps://www.hirose.com/product/series?lang=en&part=Wearable-Smartphone_Smartphones_Display-Main-Sub-Board-Camera\n\n**THIRD SAFE CHOICE**\nBM28 Series\nhttps://www.hirose.com/product/series/BM28?lang=en\n    BM28B0.6-24DS/2-0.35V + BM28B0.6-24DP/2-0.35V\n    https://www.hirose.com/product/p/CL0673-5025-0-53\n    https://www.hirose.com/product/p/CL0673-5024-0-53\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM28B06-24DS-2-035V53?qs=1mbolxNpo8f74GW3Yu8ADA%3D%3D\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM28B06-24DP-2-035V53?qs=%2Fha2pyFaduhE%2FAvbOH6zWf1nfpxp1EiQdIiizvFYgoDFP6cnKpBaf9QA%2FVC99HZxOf3gaGocLk8%3D\n\n**MIGHT BE OLD**\nBM23PF Series\nhttps://www.hirose.com/product/series/BM23PF?lang=en\n    BM23PF0.8-24DS-0.35V + BM23PF0.8-24DP-0.35V\n    https://www.hirose.com/product/p/CL0480-0368-0-95?lang=en\n    https://www.hirose.com/product/p/CL0480-0291-0-95?lang=en\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM23PF08-24DS-035V895?qs=YCa%2FAAYMW012ns85Z%252BYgig%3D%3D\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM23PF08-24DP-035V895?qs=YCa%2FAAYMW00Eo8zObYug9A%3D%3D\n\n**MIGHT BE OLD**\nBM20 Series\nhttps://www.hirose.com/product/series/BM20?lang=en\n    BM20B(0.8)-24DS-0.4V + BM20B(0.8)-24DP-0.4V
# MIPI-DSI 40PIN Connector	Molex\n\nhttps://www.molex.com/molex/search/deepSearch?pQuery=q%253D*%253A*%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dcollection%253Aimpulse%2540fq%253Dproductname%253A%2522SlimStack%2522%2540fq%253Dcircuitsloaded%253A%252240%2522%2540fq%253Dcircuitsloaded%253A%252240%2522%2540fq%253Dcategory%253A%2522PCB%252BReceptacles%2522%2540fq%253Ddurabilitymatingcyclesmax%253A%252230%2522Â¤tQuery=hflh%3ALow-Halogen&origin=_l1stv13w\n\n**AVAILABLE SAFE CHOICE**\n505270-4012 + ?\nhttps://www.molex.com/molex/products/part-detail/pcb_receptacles/5052704012\nhttps://www.molex.com/molex/products/part-detail/pcb_headers/5050704022\nhttps://www.mouser.fr/ProductDetail/Molex/505270-4012?qs=%2Fha2pyFaduhjJLQLQDZWAhs5YToiXDDCWEhTM%2FM%252BQOpkEGrLOwZHYw%3D%3D\nhttps://www.mouser.fr/ProductDetail/Molex/505070-4022?qs=%2Fha2pyFadujvQBpg0fGUIxvw2k5BQY0%252B03TTPIx81R9C9ikZI%252BU%252BWg%3D%3D\n\nHirose\n\nhttps://www.hirose.com/product/series?lang=en&part=Wearable-Smartphone_Smartphones_Display-Main-Sub-Board-Camera\n\n**SECOND SAFE CHOICE**\nBM28 Series\nhttps://www.hirose.com/product/series/BM28?lang=en\n    BM28B0.6-40DS/2-0.35V + BM28B0.6-40DP/2-0.35V\n    https://www.hirose.com/product/p/CL0673-5019-0-53\n    https://www.hirose.com/product/p/CL0673-5018-0-53\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM28B06-40DS-2-035V53?qs=%2Fha2pyFaduhE%2FAvbOH6zWednF8iHe4Xg35Feo6eVsAdTKkMXZkA1Smug7lkOtQnG8MCHQqtWc5Y%3D\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM28B06-40DP-2-035V53?qs=1mbolxNpo8f6Kv%2FKrr9Pfg%3D%3D\n\n**MIGHT BE BEST OF ALL BUT NOT AVAILABLE YET**\nBK13C Series\nhttps://www.hirose.com/product/series/BK13C?lang=en\n    BK13C06-40DS/2-0.35V + BK13C06-40DP/2-0.35V\n    https://www.hirose.com/product/p/CL0480-0666-0-00?lang=en\n    https://www.hirose.com/product/p/CL0480-0665-0-00?lang=en\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BK13C06-40DS-2-035V800?qs=%2Fha2pyFaduh9KC1pyvhpSzMKJ3uu1%2FBSF1wgGCwIiD7XFWoJC9P3DYji69fIVr%252BpGQRSQp3dpok%3D\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BK13C06-40DP-2-035V800?qs=%2Fha2pyFaduh9KC1pyvhpS7vAQwzMRA1ax0EtGALpQsV9QMLjE0PO9m2CO0pgcl6LIi%2F8nO5k1%2Fs%3D\n\n**MIGHT BE OLD**\nBM23PF Series\nhttps://www.hirose.com/product/series/BM23PF?lang=en\n    BM23PF0.8-40DS-0.35V + BM23PF0.8-40DP-0.35V\n    https://www.hirose.com/product/p/CL0480-0369-0-95?lang=en\n    https://www.hirose.com/product/p/CL0480-0317-0-95?lang=en\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM23PF08-40DS-035V895?qs=YCa%2FAAYMW00aPRQiN9RMBQ%3D%3D\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM23PF08-40DP-035V895?qs=%2Fha2pyFaduiEk8h9JIs%252B9IdOcHSPTEVGf67JIhwgR2wWLPn3sa14pgpfdmnYQR8JT29yRzQiRtI%3D\n\n**MIGHT BE OLD**\nBM20 Series\nhttps://www.hirose.com/product/series/BM20?lang=en\n    BM20B(0.8)-40DS-0.4V + BM20B(0.8)-40DP-0.4V\n    https://www.hirose.com/product/p/CL0684-9012-1-53\n    https://www.hirose.com/product/p/CL0684-9005-6-53\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM20B08-40DS-04V53?qs=%2Fha2pyFadujpts7YYZBlYTi3eX5n1J8pwJNxQjS4gytr8dJgpwZxCkIf5PmgJphP\n    https://www.mouser.fr/ProductDetail/Hirose-Connector/BM20B08-40DP-04V53?qs=AAveGqk956EoqJ9zTvCjVg%3D%3D
# Antenna Connector	Hirose\n\nhttps://www.hirose.com/product/series?lang=en&page=&pageSize=100&sort=RECOMMENDED&category=&name=&\npart=Wearable-Smartphone_Smartphones_Antenna&largeCategory=&industry=Wearable-Smartphone&application=Wearable-Smartphone_Smartphones&error=\nhttps://www.hirose.com/product/p/CL0331-0472-2-10?lang=en\nhttps://www.hirose.com/product/document?clcode=&productname=&series=U.FL&documenttype=Catalog&lang=en&documentid=D31697_en\n\n**SAFE CHOICE**\nU.FL-R-SMT-1(10)\nhttps://www.hirose.com/product/series/U.FL?lang=en\nhttps://www.hirose.com/product/p/CL0331-0472-2-10?lang=en
# Connector Manufacturers	Molex\n\nhttps://www.molex.com/molex/search/deepSearch?pQuery=q%253D*spch2*%2540fq%253Dcollectionspch2impulse%2540fq%253Dproductnamespch2%2522SlimStack%2522\nhttps://www.molex.com/molex/products/family/slimstack_fine_pitch_smt_board_to_board_connectors?parentKey=board_to_board_connectors\nhttps://www.molex.com/molex/search/deepSearch?pQuery=productname%253A%2522SlimStack%2522%2540pitchmatinginterface%253A%25220.35mm%2522\nhttps://www.mouser.fr/Molex/Connectors/Board-to-Board-Mezzanine-Connectors/_/N-ay0krZlls6?P=1ytkn06Z1z0z7ymZ1z0zlew\n\nHirose\n\nhttps://www.hirose.com/product/application/Wearable-Smartphone_Smartphones?lang=en\n\nhttps://prd-4s-public.s3-ap-northeast-1.amazonaws.com/html/en/products/industry/Wearable-Smartphone/smartphones/R12016E_Smartphone_8.pdf\n\nFlex PCB\n\nhttps://www.pcb-flexconnect.com/electronic-circuit-components-connectors-and-ready-to-use-solutions/?lang=en
# Power Connector	Molex\n\nhttps://www.molex.com/molex/products/family/slimstack_fine_pitch_smt_board_to_board_connectors\n\n**SAFE CHOICE**\n505473-0810 + 505476-0810\nhttps://www.molex.com/molex/products/part-detail/pcb_receptacles/5054730810\nhttps://www.molex.com/molex/products/part-detail/pcb_headers/5054760810\nhttps://www.mouser.fr/ProductDetail/Molex/505473-0810?qs=%2Fha2pyFadujugMdY2Bii%252B4ZUuRiMPICYLkQoLWulTlHdcNaYWz1UeA%3D%3D\nhttps://www.mouser.fr/ProductDetail/Molex/505476-0810?qs=%2Fha2pyFaduiVjakYU3dGS7kMW%252B4e2acoaJDNj0lgmgJPjjcOG6nRSA%3D%3D\n\n\n**MAYBE BETTER yet not available**\n211175-0080 + 211176-0080\nhttps://www.molex.com/molex/products/part-detail/pcb_receptacles/2111750080\nhttps://www.molex.com/molex/products/part-detail/pcb_headers/2111760080\nhttps://www.mouser.fr/ProductDetail/Molex/211175-0080?qs=%2Fha2pyFadui0LUi1gmCDnjtpKWaMkV1DKzX%2Fj3kcYl3CAUwiFBDLSw%3D%3D\nhttps://www.mouser.fr/ProductDetail/Molex/211176-0080?qs=%2Fha2pyFadujq83IR8%2F7%252B%252BgMCcKM9IvhzeqQEPfiaINwiKj2%252BzdAwyw%3D%3D\n\nHirose\n\nhttps://www.hirose.com/product/series?lang=en&part=Wearable-Smartphone_Smartphones_Battery\nhttps://www.hirose.com/product/document?clcode=CL0677-1200-0-51&productname=BM25-4S%2f2-V(51)&series=BM25&documenttype=Catalog&lang=en&documentid=D51172_en\n\nCOMPARING SPECS THIS ONE HAS A SLIGHLTY BETTER RESISTANCE TO MATING\nAND LOWER PIN RESISTANCE / HIGHER POWER SAVINGS\nBUT ITS LESS LESS AVAILABLE THAN THE MOLEX AND TWICE THE PRICE\n\n**LATEST VERSION**\nBM25-4S/2-V + BM25-4P/2-V\nhttps://www.hirose.com/product/p/CL0677-1200-0-53?lang=en\nhttps://www.hirose.com/product/p/CL0677-1201-2-53?lang=en\nhttps://www.mouser.fr/ProductDetail/Hirose-Connector/BM25-4S-2-V53?qs=%2Fha2pyFaduihPkRRWASsPuzUfSHFDSAAk8pEJXfG5OjlMXHhar8K0g%3D%3D\nhttps://www.mouser.fr/ProductDetail/Hirose-Connector/BM25-4P-2-V53?qs=%2Fha2pyFadug1aNQLNGbX8U51mlzAbPIKiKNrHmw39MhdEYohkeh5Zg%3D%3D\n\niPhone Battery connectors\n\nhttps://fr.aliexpress.com/item/4000045495548.html?src=google&src=google&albch=shopping&acnt=248-630-5778&isdl=y&slnk=&plac=&mtctp=&albbt=Gploogle_7_shopping&aff_atform=google&aff_short_key=UneMJZVf&gclsrc=aw.ds&&albagn=888888&&ds_e_adid=438856512850&ds_e_matchtype=&ds_e_device=c&ds_e_network=u&ds_e_product_group_id=709881906425&ds_e_product_id=fr4000045495548&ds_e_product_merchant_id=109166098&ds_e_product_country=FR&ds_e_product_language=fr&ds_e_product_channel=online&ds_e_product_store_id=&ds_url_v=2&ds_dest_url=https://fr.aliexpress.com/item/2PCS-Inner-FPC-Connector-Battery-Holder-Clip-Contact-For-iPhone-7-8-Plus-X-XR-XS/4000045495548.html?src=google&albcp=10191220526&albag=107473525328&gclid=EAIaIQobChMI-cKK5rrC6gIVA-ztCh3elQzeEAQYAiABEgKEWfD_BwE

## Camera
https://ciechanow.ski/cameras-and-lenses/


### BOM
ðŸŒŸ SiFive ? RISC-V Based ?	
ðŸŒŸMediaTek	
# COMPONENTS SUPPLY\n> Suppliers -- What they sell ? How many they sell ? For how much ?\n> actively develop their suppliers\n> managing a vast international supply chain\n> Environment Friendly\n> CUTTING COST FOR MAX PRECISION\n> Production should be thought of HOLISTICALLY, wasted material is wasted money. improving yields on production â€” positive contribution to gross margin\n> If I want it made well, the US, Europe, Germany, Japan, and Russia can make stuff to be proud of. Cheap? China is your go to party. The issue is that the cheap gizmos are the weak link in the chain.  That, and the "hidden third shift". In Europe, if I spec something, I will get what is specced, every time, from now, to whenever production stops. I have read over and over again about companies encountering "quality fade" in China. They might get a 500GB flash drive the first few months... but then the drive becomes an 8gb drive with a controller lying about the rest and overwriting data soon after that. Or the titanium alloy needed for strength is replaced by some pot metal lying around the factory.\n\nðŸŒŸ MISC\nhttps://www.snapeda.com/\nhttps://www.logicalincrements.com/\nhttps://medium.com/@fretx/dangerous-moves-on-hardware-prototyping-and-the-abuse-of-digikey-579b6a584946\nhttps://github.com/PwnKitteh/InsanelyCheapElectronics\n\nðŸŒŸ MARKETPLACES\nhttp://english.ezezic.com/index.html\nhttps://www.leroymerlin.fr/\nhttps://fr.rs-online.com/web/\nhttps://www.newegg.com/\nhttps://www.mcmaster.com/\nhttps://www.ebay.com/\nhttps://www.amazon.com/\nhttps://www.aliexpress.com/\nhttps://www.alibaba.com/\nhttps://www.globalsources.com/\nhttps://www.onlinecomponents.com/\nhttps://www.made-in-china.com/\nhttp://www.globalmarket.com/hot-products/lithium-battery--7346.html\nhttps://www.tradewheel.com/\nhttps://www.tradesparq.com/catalog/all/Lithium-Ion-Battery-manufacturers\ntaobao.com - 1688.com\nhttps://all.biz/\nhttps://www.indiamart.com/\nhttps://www.tradeindia.com/\nhttps://www.thomasnet.com/\nhttps://www.europages.co.uk/\nhttps://www.solostocks.com/\nhttps://www.rosfirm.ru/\nhttps://cn.china.cn/\nhttps://www.chinabrands.com/\nhttps://www.lightinthebox.com/\n\nðŸ’€ Blacklists\nhttp://www.supplierblacklist.com/\n\nðŸ” PART SELECTION\nsupplier@peerpersonal.com\n\n1 - PARAMETRIC SEARCH\nhttps://octopart.com -- https://octopart.com/api/home\nhttps://www.mouser.fr -- https://www.mouser.fr/api-hub/ -- https://api.mouser.com/api/docs/ui/index\n\n2- PRICE, REPLACABILITY, FORECAST AND VOLUME VALIDATION\nhttps://www.trustedparts.com/fr INDUSTRY CENTRALIZED AUTHORITY\nhttps://www.partstat.com/solutions/part-search\nhttps://www.oemstrade.com !oem\n\nhttps://dev-partinfo.kitspace.org/graphql -- https://github.com/kitspace/partinfo -- USELESS UX\nhttps://www.oemsecrets.com -- BAD DATA -> GOOD UX\n\nðŸŒŸ DISTRIBUTOR\n\nhttps://www.digikey.fr/\nhttps://www.avnet.com/shop/emea/s/promotions/\nhttps://fr.farnell.com/ -- https://partner.element14.com/docs/Product_Search_API_REST__Description -- \nhttps://www.arrow.com/fr-fr\nhttps://www.tme.eu/fr/\nhttps://www.futureelectronics.com/fr/\n\n ðŸŒŸPRIVATE SOURCER\n EBV Elektronik\nhttp://www.txcube.eu/\n\nðŸŒŸMODEL FACTORY -- CASING\nhttp://www.casetekholdings.com/html/product_intro.php\nhttps://www.made-in-china.com/manufacturers/smartphone.html\nhttps://www.nijiworks.com/\nhttps://www.protocase.com/\n\nðŸŒŸ COMMUNITIES\nhttps://www.hackster.io/projects/?by=featured&ref=topnav&sort=popular\ntindie.com\nadafruit.com\nshop.pimoroni.com\n\nðŸŒŸOpen Source Hardware\nhttp://makingsociety.com/2013/03/the-worlwide-list-of-open-source-hardware-online-stores/\nhttp://opencircuitdesign.com/\nhttps://github.com/intajay/open-electronics\n\n**IC companies**\nhttps://en.wikipedia.org/wiki/List_of_integrated_circuit_manufacturers\nhttps://en.wikipedia.org/wiki/Semiconductor_industry\nhttps://www.investopedia.com/articles/markets/012216/worlds-top-10-semiconductor-companies-tsmintc.asp\nhttp://anysilicon.com/top-20-semiconductor-companies-2016/\nhttp://www.electronicsandyou.com/blog/top-50-semiconductor-manufacturing-companies-in-the-world.html\nhttp://electroiq.com/blog/2012/04/2011-semiconductor-sales-rankings/\nhttp://www.powerelectronics.com/companies/power-30-powerelectronicscom-s-top-30-semiconductor-companies\nhttps://elinux.org/Board_and_Chip_Vendors\nhttps://en.wikipedia.org/wiki/List_of_mobile_phone_makers_by_country\n\nhttps://www.mediatek.com/\n\n**Boards**\nhttps://www.seeedstudio.com/\n\n**FPGA** Digilent Arty A7 / S7\nhttps://www.achronix.com/ -- https://en.wikipedia.org/wiki/Achronix\nhttps://www.altera.com/ -- https://en.wikipedia.org/wiki/Altera\nhttps://www.xilinx.com/\n\n**SCREEN / FINGERPRINT**\nhttp://www.focaltech-systems.com/en.html\n\n**Sensors**\nhttp://ams.com/eng -- https://en.wikipedia.org/wiki/Ams_AG\n\n**Graphics**\nhttps://www.amd.com/en â€” https://en.wikipedia.org/wiki/ATI_Technologies\n\n**Microcontroller**\nhttp://www.microchip.com/ â€” https://en.wikipedia.org/wiki/Microchip_Technology\n\n**Mixed IC**\nhttp://www.analog.com/en/index.html â€” https://en.wikipedia.org/wiki/Analog_Devices\nhttp://www.appliedmaterials.com/ â€” https://en.wikipedia.org/wiki/Applied_Materials	
ðŸ‡¨ðŸ‡³ Qualcomm\nAPQ8064E\nhttps://en.wikipedia.org/wiki/List_of_Qualcomm_Snapdragon_systems-on-chip	
ðŸŒŸ BOM\nhttps://www.fictiv.com/hwg/plan/how-to-build-a-bom\nhttps://github.com/openscopeproject/InteractiveHtmlBom\nhttps://neo900.org/stuff/block-diagrams/neo900/neo900.html	
