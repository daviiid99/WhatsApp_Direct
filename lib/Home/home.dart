import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget{
  const Home({
    super.key
});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{

   Uri _url = Uri.parse('https://wa.me/');
   File file = File("/data/user/0/com.daviiid99.whatsappdirect/app_flutter/code.json");
   TextEditingController phoneNumber = TextEditingController(text: "");
   TextEditingController message = TextEditingController(text: "");
   bool phoneEntered = false;
   List<String> countryPrefix = [];
   List<String> countryFlag = [];
   List<String> countryName = [];
   String choosedPrefix = "+34";
   int count  = 0;

   Map<dynamic, dynamic> countryCodes = {
     "+1" : ["us.png", "US"],
     "+1242" : ["bs.png", "BS"],
     "+1246" : ["bb.png", "BB"],
     "+1264" : ["ai.png", "AI"],
     "+1268" : ["ag.png", "AG"],
     "+1284" : ["vg.png", "VG"],
     "+1340" : ["vi.png", "VI"],
     "+1441" : ["bm.png", "BM"],
     "+1473" : ["gd.png", "GD"],
     "+1649" : ["tc.png", "TC"],
     "+1664" : ["ms.png", "MS"],
     "+1670" : ["mp.png", "MP"],
     "+1671" : ["gu.png", "GU"],
     "+1684" : ["as.png", "AS"],
     "+1758" : ["lc.png", "LC"],
     "+1767" : ["dm.png", "DM"],
     "+1784" : ["vc.png", "VC"],
     "+1849" : ["do.png", "DO"],
     "+1868" : ["tt.png", "TT"],
     "+1869" : ["kn.png", "KN"],
     "+1876" : ["jm.png", "JM"],
     "+1939" : ["pr.png", "PR"],
     "+20" : ["eg.png", "EG"],
     "+211" : ["ss.png", "SS"],
     "+212" : ["ma.png", "MA"],
     "+213" : ["dz.png", "DZ"],
     "+216" : ["tz.png", "TZ"],
     "+218" : ["ly.png", "LY"],
     "+220" : ["gm.png", "GM"],
     "+221" : ["sn.png", "SN"],
     "+222" : ["mr.png", "MR"],
     "+223" : ["ml.png", "ML"],
     "+224" : ["gn.png", "GN"],
     "+225" : ["ci.png", "CI"],
     "+226" : ["bf.png", "BF"],
     "+227" : ["ne.png", "NE"],
     "+228" : ["tg.png", "TG"],
     "+229" : ["bj.png", "BJ"],
     "+230" : ["mu.png", "MU"],
     "+231" : ["lr.png", "LR"],
     "+232" : ["sl.png", "SL"],
     "+233" : ["gh.png", "GH"],
     "+234" : ["ng.png", "NG"],
     "+235" : ["td.png", "TD"],
     "+236" : ["cf.png", "CF"],
     "+237" : ["cm.png", "CM"],
     "+238" : ["cv.png", "CV"],
     "+239" : ["st.png", "ST"],
     "+240" : ["gq.png", "GQ"],
     "+241" : ["ga.png", "GA"],
     "+242" : ["cg.png", "CG"],
     "+243" : ["cd.png", "CD"],
     "+244" : ["ao.png", "AO"],
     "+245" : ["gw.png", "GW"],
     "+246" : ["io.png", "IO"],
     "+248" : ["sc.png", "SC"],
     "+249" : ["sd.png", "SD"],
     "+250" : ["rw.png", "RW"],
     "+251" : ["et.png", "ET"],
     "+252" : ["so.png", "SO"],
     "+253" : ["dj.png", "DJ"],
     "+254" : ["ke.png", "KE"],
     //"+255" : ["tz.png", "TZ"],
     "+256" : ["ug.png", "UG"],
     "+257" : ["bi.png", "BI"],
     "+258" : ["mz.png", "MZ"],
     "+260" : ["zm.png", "ZM"],
     "+261" : ["mg.png", "MG"],
     "+262": ["tf.png", "TF"],
     "+263" : ["zw.png", "ZW"],
     "+264" : ["na.png", "NA"],
     "+265" : ["mw.png", "MW"],
     "+266" : ["ls.png", "LS"],
     "+267" : ["bw.png", "BW"],
     "+268" : ["sz.png", "SZ"],
     "+269" : ["km.png", "KM"],
     "+27" : ["za.png", "ZA"],
     "+290" : ["sh.png", "SH"],
     "+291" : ["er.png", "ER"],
     "+297" : ["aw.png", "AW"],
     "+298" : ["fo.png", "FO"],
     "+299" : ["gl.png", "GL"],
     "+30" : ["gr.png", "GR"],
     "+31" : ["nl.png", "NL"],
     "+32" : ["be.png", "BE"],
     "+33" : ["fr.png", "FR"],
     "+34" : ["es.png", "ES"],
     "+345" : ["ky.png", "KY"],
     "+350" : ["gi.png", "GI"],
     "+351" : ["pt.png", "PT"],
     "+352" : ["lu.png", "LU"],
     "+353" : ["ie.png", "IE"],
     "+354" : ["is.png", "IS"],
     "+355" : ["al.png", "AL"],
     "+356" : ["mt.png", "MT"],
     "+357" : ["cy.png", "CY"],
     "+358" : ["fi.png", "FI"],
     "+359" : ["bg.png", "BG"],
     "+36" : ["hu.png", "HU"],
     "+370" : ["lt.png", "LT"],
     "+371" : ["lv.png", "LV"],
     "+372" : ["ee.png", "EE"],
     "+373" : ["md.png", "MD"],
     "+374" : ["am.png", "AM"],
     "+375" : ["by.png", "BY"],
     "+376" : ["ad.png", "AD"],
     "+377" : ["mc.png", "MC"],
     "+378" : ["sm.png", "SM"],
     "+379" : ["va.png", "VA"],
     "+380" : ["ua.png", "UA"],
     "+381" : ["rs.png", "RS"],
     "+382" : ["me.png", "ME"],
     "+383" : ["xk.png", "XK"],
     "+385" : ["hr.png", "HR"],
     "+386" : ["si.png", "SI"],
     "+387" : ["ba.png", "BA"],
     "+389" : ["mk.png", "MK"],
     "+39" : ["it.png", "IT"],
     "+40" : ["ro.png", "RO"],
     "+41" : ["ch.png", "CH"],
     "+420" : ["cz.png", "CZ"],
     "+421" : ["sk.png", "SK"],
     "+423" : ["li.png", "LI"],
     "+43" : ["at.png", "AT"],
     "+44" : ["gb.png", "GB"],
     "+45" : ["dk.png", "DK"],
     "+46" : ["se.png", "SE"],
     "+47" : ["no.png", "NO"],
     "+48" : ["pl.png", "PL"],
     "+49" : ["de.png", "DE"],
     "+500" : ["gs.png", "GS, FK"],
     "+501" : ["bz.png", "BZ"],
     "+502" : ["gt.png", "GT"],
     "+503" : ["sv.png", "SV"],
     "+504" : ["hn.png", "HN"],
     "+505" : ["ni.png", "NI"],
     "+506" : ["cr.png", "CR"],
     "+507" : ["pa.png", "PA"],
     "+508" : ["pmg.png", "PM"],
     "+509" : ["ht.png", "HT"],
     "+51" : ["pe.png", "PE"],
     "+52" : ["mx.png", "MX"],
     "+53" : ["cu.png", "CU"],
     "+54" : ["ar.png", "AR"],
     "+55" : ["br.png", "BR"],
     "+56" : ["cl.png", "CL"],
     "+57" : ["co.png", "CO"],
     "+58" : ["ve.png", "VE"],
     "+590" : ["mf.pnf", "MF,BL,GP"],
     "+591" : ["bo.png", "BO"],
     "+592" : ["gy.png", "GY"],
     "+593" : ["ec.png", "EC"],
     "+594" : ["gf.png", "GF"],
     "+595" : ["py.png", "PY"],
     "+596" : ["mq.png", "MQ"],
     "+597" : ["sr.png", "SR"],
     "+598" : ["uy.png", "UY"],
     "+599" : ["an.png", "AN"],
     "+60" : ["my.png", "MY"],
     "+61" : ["au.png", "AU,CX,CC"],
     "+62" : ["id.png", "ID"],
     "+63" : ["ph.png", "PH"],
     "+64" : ["nz.png", "NZ,PN"],
     "+65" : ["sg.png", "SG"],
     "+66" : ["th.png", "TH"],
     "+670" : ["tl.png", "TL"],
     "+672" : ["aq.png", "AQ,HM,NF"],
     "+673" : ["bn.png", "BN"],
     "+674" : ["nr.png", "NR"],
     "+675" : ["pg.png", "PG"],
     "+676" : ["to.png", "TO"],
     "+677" : ["sb.png", "SB"],
     "+678" : ["vu.png", "VU"],
     "+679" : ["fj.png", "FJ"],
     "+680" : ["pw.png", "PW"],
     "+681" : ["wf.png", "WF"],
     "+682" : ["ck.png", "CK"],
     "+683" : ["nu.png", "NU"],
     "+685" : ["ws.png", "WS"],
     "+686" : ["ki.png", "KI"],
     "+687" : ["nc.png", "NC"],
     "+688" : ["tv.png", "TV"],
     "+689" : ["pf.png", "PF"],
     "+690" : ["tk.png", "TK"],
     "+691" : ["fm.png", "FM"],
     "+692" : ["mh.png", "MH"],
     "+7" : ["ru.png", "RU,KZ"],
     "+81" : ["jp", "JP"],
     "+82" : ["kr.png", "KR"],
     "+84" : ["vn.png", "VN"],
     "+850" : ["kp.png", "KP"],
     "+852" : ["hk.png", "HK"],
     "+853" : ["mo.png", "MO"],
     "+855" : ["kh.png", "KH"],
     "+856" : ["la.png", "LA"],
     "+86" : ["cn.png", "CN"],
     "+880" : ["bd.png", "BD"],
     "+886" : ["tw.png", "TW"],
     "+90" : ["tr.png", "TR"],
     "+91" : ["in.png", "IN"],
     "+92" : ["pk.png", "PK"],
     "+93" : ["af.png", "AF"],
     "+94" : ["lk.png", "LK"],
     "+95" : ["mm.png", "MM"],
     "+960" : ["mv.png", "MV"],
     "+961" : ["lb.png", "LB"],
     "+962" : ["jo.png", "JO"],
     "+963" : ["sy.png", "SY"],
     "+964" : ["iq.png", "IQ"],
     "+965" : ["kw.png", "KW"],
     "+966" : ["sa.png", "SA"],
     "+967" : ["ye.png", "YE"],
     "+968" : ["om.png", "OM"],
     "+970" : ["ps.png", "PS"],
     "+971" : ["ae.png", "AE"],
     "+972" : ["il.png", "IL"],
     "+973" : ["bh.png", "BH"],
     "+974" : ["qa.png", "QA"],
     "+975" : ["bt.png", "BT"],
     "+976" : ["mn.png", "MN"],
     "+977" : ["np.png", "NP"],
     "+98" : ["ir.png", "IR"],
     "+992" : ["tj.png", "TJ"],
     "+993" : ["tm.png", "TM"],
     "+994" : ["az.png", "AZ"],
     "+995" : ["ge.png", "GE"],
     "+996" : ["kg.png", "KG"],
     "+998" : ["uz.png", "UZ"]
   };

   Map<dynamic,dynamic> defaultCode = {};

   writeDefaultPrefix(String code){
     // Always set last used country code as default
     defaultCode =  {"default" : code};
     String jsonString = jsonEncode(defaultCode);
     file.writeAsStringSync(jsonString);
   }

   restoreDefaultPrefix(){
     // Always recover last used country code to make it easy for users
     setState(() {
       if (file.existsSync()){
         String jsonString = file.readAsStringSync();
         defaultCode = jsonDecode(jsonString);
         choosedPrefix = defaultCode["default"];
       }

     });
   }

   @override
  void initState(){
     setState(() {
       updateLists();
       restoreDefaultPrefix();
     });
     super.initState();
   }

   updateLists() async {
     // This method will read the countryCodes HashMa and update local lists

     for (String code in countryCodes.keys){
           // Current prefix
           if (!countryPrefix.contains(code)) {
             countryPrefix.add(code);
           }

           // Current flag
           if (!countryFlag.contains(countryCodes[code][0])){
             countryFlag.add(countryCodes[code][0]);
           }

           // Current name
           if (!countryName.contains(countryCodes[code][1])){
             countryName.add(countryCodes[code][1]);
           }
           }
   }

   openWhatsAppChat(){
     _url = (Uri.parse('whatsapp://send?phone="$choosedPrefix${phoneNumber.text.replaceAll(" ", "")}"&text=${message.text}'));
     launchUrl(_url);
     setState(() {
       phoneNumber.text = ""; // Clear last phone number after pressing send button
       message.text = ""; // Clear message if exists
       phoneEntered = false;
     });
   }

   checkPhoneIsEmpty(String phone){
     // Check if the user entered a phone number to show the meesage textfield
     if (phone.isNotEmpty){
       setState(() {
         phoneEntered = true;
       });
     } else {
       setState(() {
         phoneEntered = false;
       });
     }
   }

   showToast(String message){
     // Show a toast on display with the given message
     //Used to show usefull information on display like errors, warnings,...


     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       behavior: SnackBarBehavior.floating,
       width: 300,
       margin: const EdgeInsets.only(bottom: 100.0),
       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
         topLeft: Radius.circular(24),
         topRight: Radius.circular(24),
         bottomLeft: Radius.circular(24),
         bottomRight: Radius.circular(24),
       )),
       content: Text(message, textAlign: TextAlign.center,),
       elevation: -5.0,
     ));
   }

   userConfirmation(int index) async {
     // User will be prompted to confirm or decline current selection

     showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             backgroundColor: Colors.transparent,
             content: InkWell(
               borderRadius: const BorderRadius.only(
                 topRight: Radius.circular(24),
                 topLeft: Radius.circular(24),
                 bottomRight: Radius.circular(24),
                 bottomLeft: Radius.circular(24),
               ),
               child: SizedBox(
                 width: 400,
                  height: 500,
                  child : Column(
                 children: [
                   const Text("User Confirmation", style: TextStyle(color: Colors.white, fontSize: 25),),
                   const SizedBox(height: 50,),
                   Align(
                     alignment: Alignment.center,
                   child : Text("You're choosing the country code ${countryPrefix[index]} that references the country ${countryName[index]}", style: TextStyle(color: Colors.white),)),
                   const SizedBox(height: 50,),
                   Align(
                   alignment: Alignment.center,
                   child : Image.asset("assets/flags/${countryFlag[index]}", width: 150, height: 150,)),
                   const SizedBox(height: 100,),
                   Row(
                     children: [
                       const Spacer(),
                       TextButton(
                         style: TextButton.styleFrom(
                           backgroundColor: Colors.green
                         ),
                           onPressed: (){
                           // User confirmed selection
                             setState(() {
                               getLatestCode(countryPrefix[index]);
                               showToast("Choosed Country Code : ${countryPrefix[index]}(${countryName[index]})");
                               Navigator.pop(context);
                               Navigator.pop(context);
                             });

                           },
                           child: const Text("Confirm", style: TextStyle(color: Colors.white),)),
                       const Spacer(),
                       TextButton(
                           style: TextButton.styleFrom(
                               backgroundColor: Colors.red
                           ),
                           onPressed: (){
                             // User declined selection
                             Navigator.pop(context);

                           },
                           child: const Text("Decline", style: TextStyle(color: Colors.white),)),
                       const Spacer(),
                     ],
                   )
                 ],
               ),
             ),
             ),
           );
     }
     );
   }

   bool checkPhoneOnSubmit(){
     // Before trying to open a chat on whatsapp check if the phone is empty or not
     // Notify the user if the phone is empty

     if (phoneEntered){
       return true;

     } else {
       showToast("Enter a phone number before submitting");
       return false;
     }

   }

   showCountriesDialog() async {
     // Let use to choose a country prefix
     showDialog(
         context: context,
         builder: (BuildContext context){
           return StatefulBuilder(
               builder: (context, setState)
               {
                 return AlertDialog(
                   backgroundColor: Colors.transparent,
                   content: SizedBox(
                     width: 400,
                     height: 800,
                     child: Column(
                       children: [
                         Expanded(child: ListView.builder(
                             itemCount: countryFlag.length,
                             itemBuilder: (context, index) {
                               return InkWell(
                                   onTap: () {
                                     setState(() async{
                                       userConfirmation(index);
                                     });


                                   },
                                   child: Card(
                                     child: Column(
                                       children: [
                                         ListTile(
                                           leading: Image.asset("assets/flags/${countryFlag[index]}", width: 40,
                                             height: 40,),
                                           title: Text(countryPrefix[index]),
                                           subtitle: Text(countryName[index]),
                                         )
                                       ],
                                     ),
                                   )
                               );
                             }
                         )
                         )
                       ],
                     ),
                   ),
                 );
               }
           );
         }
     );

   }

   getLatestCode(String prefix) async {
     setState(() {
       choosedPrefix = prefix;
       writeDefaultPrefix(prefix);
     });

     return choosedPrefix;

   }


  @override
  Widget build(BuildContext context){

          imageCache.clear();
          imageCache.clearLiveImages();

           return Scaffold(
               body: Container(
                 decoration: const BoxDecoration(
                     image: DecorationImage(
                         image: AssetImage("assets/images/background.jpeg"),
                         fit: BoxFit.cover
                     )
                 ),
                 child: Column(
                     children: [
                       Expanded(
                           child: Column(
                             children : [
                              Image.asset("assets/icon/banner.png"),

                               const Align(
                                 alignment: Alignment.center,
                                   child : Text("Welcome!", style : TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold))),

                               const SizedBox(height: 20,),

                               const Align(
                                 alignment: Alignment.center,
                                 child: Text("1.- Choose your country code", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                 ),
                               ),

                               const Align(
                                 alignment: Alignment.center,
                                 child: Text("2.- Enter your phone number", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                 ),
                               ),

                               const Align(
                                 alignment: Alignment.center,
                                 child: Text("3.- Press the send icon", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                 ),
                               ),
                             ]
                           )
                       ),

                       InkWell(
                         child: Row(
                           children: [
                             const Spacer(),
                             InkWell(
                                 onTap: () {
                                   // Let user to choose a defined country prefix :)
                                   setState(() async {
                                     await showCountriesDialog();
                                   });
                                 },

                                 child: SizedBox(
                                     width: 50,
                                     height: 50,
                                     child: ClipRRect(
                                         borderRadius: const BorderRadius.only(
                                           topLeft: Radius.circular(24),
                                           topRight: Radius.circular(24),
                                           bottomLeft: Radius.circular(24),
                                           bottomRight: Radius.circular(24),
                                         ),
                                         child: Container(
                                           decoration: BoxDecoration(
                                           image: DecorationImage(
                                           image: AssetImage("assets/flags/${countryFlag[countryPrefix.indexOf(choosedPrefix)]}"),
                                           fit: BoxFit.cover
                                           )
                                           ),
                                             child: Column(
                                                 children: const [
                                                   SizedBox(height: 10,),
                                                   Align(
                                                       alignment: Alignment.center,
                                                       child: Text(
                                                         "",
                                                         style: TextStyle(
                                                           color: Colors.black, fontWeight: FontWeight.bold,
                                                             fontSize: 25),
                                                       )),
                                                   SizedBox(height: 15,),
                                                 ]
                                             )
                                         )))),

                             const Spacer(),

                             ClipRRect(
                                 borderRadius: const BorderRadius.only(
                                   topRight: Radius.circular(25),
                                   topLeft: Radius.circular(25),
                                   bottomRight: Radius.circular(25),
                                   bottomLeft: Radius.circular(25),
                                 ),
                                 child: SizedBox(
                                     width: 200,
                                     child : InkWell(
                                       onFocusChange: (_){
                                         setState(() {
                                           checkPhoneIsEmpty(phoneNumber.text);
                                         });
                                       },
                                     child: TextField(
                                       textAlign: TextAlign.center,
                                       style: const TextStyle(fontSize: 25),
                                       decoration: const InputDecoration(
                                         hintText: "Enter a phone",
                                           hintStyle: TextStyle(fontSize: 25),
                                           filled: true,
                                           fillColor: Colors.white
                                       ),
                                       controller: phoneNumber,
                                       keyboardType: TextInputType.phone,
                                     ))
                                 )
                             ),
                             const Spacer(),
                             IconButton(
                                 onPressed: () async {
                                   bool entered  = checkPhoneOnSubmit();
                                   if (entered) {
                                     openWhatsAppChat();
                                   }
                                 },
                                 icon: const Icon(
                                   Icons.send_rounded, color: Colors.blueAccent,
                                   size: 40,)),
                             const Spacer(),

                           ],
                         ),
                       ),

                       const SizedBox(height: 20,),

                       if(phoneEntered)
                         ClipRRect(
                           borderRadius: const BorderRadius.only(
                             topRight: Radius.circular(24),
                             topLeft: Radius.circular(24),
                             bottomRight: Radius.circular(24),
                             bottomLeft: Radius.circular(24),
                           ),
                         child : SizedBox(
                          child : TextField(
                           textAlign: TextAlign.center,
                           decoration: const InputDecoration(
                             filled: true,
                             fillColor: Colors.white,
                             hintText: "Write a message",
                             alignLabelWithHint: true
                           ),

                           style: const TextStyle(color: Colors.black, fontSize: 25),
                           controller: message,
                           keyboardType: TextInputType.multiline,
                            maxLines: null,
                         ))),

                       const SizedBox(height: 20,),
                     ]

                 ),

               ) // -> 01
           );
  }
}