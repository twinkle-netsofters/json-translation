// import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:jsonlanguagetranslation/utils/translations.dart';
// import 'package:jsonlanguagetranslation/widgets/droppedfile.dart';
// import 'package:translator/translator.dart';
//
// //Language & Theme
// import 'package:code_text_field/code_text_field.dart';
// import 'package:highlight/languages/dart.dart';
// import 'package:flutter_highlight/themes/monokai-sublime.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   CodeController? _codeController;
//   DroppedFile? file;
//   String language1 = Translations.languages.first;
//   GoogleTranslator translator = GoogleTranslator();
//   String out = "";
//   String error = '';
//   final lang = TextEditingController();
//   final lang1 = TextEditingController();
//   final translatedtextC = TextEditingController();
//   String dropdownValue = 'One';
//   final GlobalKey<FormState> _changePwdKey = GlobalKey<FormState>();
//   var decodedJson;
//   // static JsonDecoder decoder = JsonDecoder();
//   // static JsonEncoder encoder = JsonEncoder.withIndent('  ');
//   Map<String, String> translatedJson = {};
//   List<String> langCode = [
//     'af',
//     'sq',
//     'am',
//     'ar',
//     'hy',
//     'as',
//     'az',
//     'eu',
//     'be',
//     'bn',
//     'bs',
//     'bg',
//     'my',
//     'ca',
//     'zh',
//     'hr',
//     'cs',
//     'da',
//     'dv',
//     'nl',
//     'en',
//     'et',
//     'mk',
//     'fo',
//     'fa',
//     'fi',
//     'fr',
//     'gd',
//     'gl',
//     'ka',
//     'de',
//     'el',
//     'gn',
//     'gu',
//     'he',
//     'hi',
//     'hu',
//     'is',
//     'id',
//     'it',
//     'ja',
//     'kn',
//     'ks',
//     'kk',
//     'km',
//     'ko',
//     'lo',
//     'la',
//     'lv',
//     'lt',
//     'ms',
//     'ml',
//     'mt',
//     'mi',
//     'mr',
//     'mn',
//     'ne',
//     'nn',
//     'or',
//     'pl',
//     'pt',
//     'pa',
//     'rm',
//     'ro',
//     'ru',
//     'sa',
//     'sr',
//     'tn',
//     'sd',
//     'si',
//     'sk',
//     'sl',
//     'so',
//     'sb',
//     'es',
//     'sw',
//     'sv',
//     'tg',
//     'ta',
//     'tt',
//     'te',
//     'th',
//     'bo',
//     'ts',
//     'tr',
//     'tk',
//     'uk',
//     'ur',
//     'uz',
//     'vi',
//     'cy',
//     'xh',
//     'yi',
//     'zu',
//   ];
//   List<String?> languageList = [];
//   String currentselLangCode = "";
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final source = "okay";
//
//     //Instantiate the codeController
//     languageList = [
//       "Afrikaans",
//       "Albanian",
//       "Amharic",
//       "Arabic",
//       "Armenian",
//       "Assamese",
//       "Azeri",
//       "Basque",
//       "Belarusian",
//       "Bengali",
//       "Bosnian",
//       "Bulgarian",
//       "Burmese",
//       "Catalan",
//       "Chinese",
//       "Croatian",
//       "Czech",
//       "Danish",
//       "Divehi",
//       "Dutch",
//       "English",
//       "Estonian	",
//       "FYRO Macedonia",
//       "Faroese",
//       "Farsi - Persian",
//       "Finnish",
//       "French",
//       "Gaelic",
//       "Galician",
//       "Georgian",
//       "German",
//       "Greek",
//       "Guarani",
//       "Gujarati",
//       "Hebrew",
//       "Hindi",
//       "Hungarian",
//       "Icelandic",
//       "Indonesian",
//       "Italian",
//       "Japanese",
//       "Kannada",
//       "Kashmiri",
//       "Kazakh",
//       "Khmer",
//       "Korean",
//       "Lao",
//       "Latin",
//       "Latvian",
//       "Lithuanian",
//       "Malay",
//       "Malayalam",
//       "Maltese",
//       "Maori",
//       "Marathi",
//       "Mongolian",
//       "Nepali",
//       "Norwegian",
//       "Oriya",
//       "Polish",
//       "Portuguese",
//       "Punjabi",
//       "Raeto",
//       "Romanian",
//       "Russian",
//       "Sanskrit",
//       "Serbian",
//       "Setsuana",
//       "Sindhi",
//       "Sinhala",
//       "Slovak",
//       "Slovenian",
//       "Somali",
//       "Sorbian",
//       "Spanish",
//       "Swahili",
//       "Swedish",
//       "Tajik",
//       "Tamil",
//       "Tatar",
//       "Telugu",
//       "Thai",
//       "Tibetan",
//       "Tsonga",
//       "Turkish",
//       "Turkmen",
//       "Ukrainian",
//       "Urdu",
//       "Uzbek",
//       "Vietnamese",
//       "Welsh",
//       "Xhosa",
//       "Yiddish",
//       "Zulu",
//     ];
//
//     _codeController = CodeController(
//         text: source, language: dart, theme: monokaiSublimeTheme);
//   }
//
//   @override
//   void dispose() {
//     _codeController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   void dropdownCallBack() {
//     print(currentselLangCode + "+++-----");
//     var jsonString = lang.text;
//     bool decodedSucceeded = false;
//
//     try {
//       decodedJson = json.decode(jsonString) as Map<String, dynamic>;
//       decodedSucceeded = true;
//     } on FormatException catch (e) {
//       print('The Provided String is not valid JSON');
//     }
//
//     decodedJson.forEach((key, value) {
//       translator
//           .translate(value.toString(),
//           from: 'auto', to: currentselLangCode.toString())
//           .then((output) {
//         setState(() {
//           var keyyy;
//           out = output.toString();
//
//           keyyy = "\"${key.toString()}\"";
//
//           translatedJson[keyyy.toString()] =
//               "\"${out.toString()}\"" + "\n"; //out;
//         });
//
//         translatedtextC.text = translatedJson.toString();
//
//         //    print(translatedJson.toString() + "oooooooo");
//         //    print('value pair-->' + out.toString() + key.toString());
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Json Translator'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '1. Please Enter Json.',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w800),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height / 2,
//                           width: MediaQuery.of(context).size.width,
//                           color: Colors.blueGrey,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextField(
//                                 enableInteractiveSelection: true,
//                                 cursorColor: Colors.white,
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.white),
//                                 minLines: 400,
//                                 maxLines: null,
//                                 keyboardType: TextInputType.multiline,
//                                 controller: lang,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: 'Enter Your JSON Data Here',
//                                     hintStyle: TextStyle(color: Colors.white))),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     openChangeLanguageBottomSheet();
//                   },
//                   child: Card(
//                     child: Container(
//                       color: Colors.white,
//                       alignment: Alignment.center,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 18, left: 18.0),
//                             child: Text(
//                               '2. Select target language to translate',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.w800),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Center(
//                             child: Container(
//                               height: 30,
//                               width: 400,
//                               decoration: BoxDecoration(
//                                 color: Colors.teal.shade300,
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0)),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Select language",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 translatedtextC.text != ""
//                     ? Card(
//                   child: Padding(
//                     padding: EdgeInsets.all(18.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '3. Translated Json.',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w800),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height / 2,
//                           width: MediaQuery.of(context).size.width,
//                           color: Colors.blueGrey,
//                           child: TextField(
//                             decoration: InputDecoration(
//                                 border: InputBorder.none
//                             ),
//
//                             cursorColor: Colors.white,
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.white,
//                             ),
//                             maxLines: null,
//                             controller: translatedtextC,
//                             // decoration: InputDecoration(
//                             //   hintText: "Enter Your Json Here .... "
//                             // ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                     : Container(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget bottomSheetHandle() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10.0),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.0), color: Colors.black54),
//         height: 5,
//         width: MediaQuery.of(context).size.width * 0.3,
//       ),
//     );
//   }
//
//   int? selectLan;
//
//   List<Widget> getLngList(BuildContext ctx, StateSetter setModalState) {
//     return languageList
//         .asMap()
//         .map(
//           (index, element) => MapEntry(
//         index,
//         InkWell(
//           onTap: () {
//             if (mounted) {
//               setState(() {
//                 selectLan = index;
//                 getLanguageCode(langCode[index]).then((value) {
//                   setState(() {
//                     currentselLangCode = value.toString();
//                   });
//                   dropdownCallBack();
//                 });
//                 //_changeLan(langCode[index], ctx);
//               });
//             }
//             setModalState(() {});
//           },
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 25.0,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: selectLan == index
//                               ? Colors.teal
//                               : Colors.white,
//                           border: Border.all(color: Colors.grey)),
//                       child: Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: selectLan == index
//                             ? Icon(
//                           Icons.check,
//                           size: 17.0,
//                           color: Colors.black,
//                         )
//                             : Icon(
//                           Icons.check_box_outline_blank,
//                           size: 15.0,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                         padding: const EdgeInsetsDirectional.only(
//                           start: 15.0,
//                         ),
//                         child: Text(
//                           languageList[index]!,
//                           style: Theme.of(context)
//                               .textTheme
//                               .subtitle1!
//                               .copyWith(color: Colors.black54),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     )
//         .values
//         .toList();
//   }
//
//   void openChangeLanguageBottomSheet() {
//     showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
//       isScrollControlled: true,
//       context: context,
//       builder: (context) {
//         return Wrap(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: Form(
//                 key: _changePwdKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     bottomSheetHandle(),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "- Choose Language -",
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     StatefulBuilder(
//                       builder:
//                           (BuildContext context, StateSetter setModalState) {
//                         return Container(
//                           height: MediaQuery.of(context).size.height / 2,
//                           child: SingleChildScrollView(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: getLngList(
//                                 context,
//                                 setModalState,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // String? prettyPrintJson(String input) {
//   //   const JsonDecoder decoder = JsonDecoder();
//   //   const JsonEncoder encoder = JsonEncoder.withIndent('  ');
//   //   final dynamic object = decoder.convert(input);
//   //   final dynamic prettyString = encoder.convert(object);
//   //   prettyString.split('\n').forEach((dynamic element) => print(element));
//   // }
//   Future<String?> getLanguageCode(String langcode) async {
//     print(langcode.toString() + "curr language code");
//     return await langcode.toString();
//   }
// }

//----------------------------
// void hindi() {
//   var jsonString = lang.text;
//   bool decodedSucceeded = false;
//   try {
//     decodedJson = json.decode(jsonString) as Map<String, dynamic>;
//     decodedSucceeded = true;
//   } on FormatException catch (e) {
//     print('The Provided String is not valid JSON');
//   }
//
//   decodedJson.forEach((key, value) {
//     translator
//         .translate(value.toString(), from: 'auto', to: 'en')
//         .then((output) {
//       setState(() {
//         var keyyy;
//         out = output.toString();
//
//         keyyy = "\"${key.toString()}\"";
//         translatedJson[keyyy.toString()] =
//             "\"${out.toString()}\"" + "\n"; //out;
//       });
//       translatedtextC.text = translatedJson.toString();
//       print(translatedJson.toString() + "oooooooo");
//       print('value pair-->' + out.toString() + key.toString());
//     });
//   });
// }

// void gujrati() {
//   setState(() {
//     if (Translations.languages == 'French') {
//       print('okayyy');
//     } else {
//       print('not okay');
//     }
//   });
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jsonlanguagetranslation/utils/translations.dart';
import 'package:jsonlanguagetranslation/widgets/droppedfile.dart';
import 'package:translator/translator.dart';

//Language & Theme
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CodeController? _codeController;
  DroppedFile? file;
  String language1 = Translations.languages.first;
  GoogleTranslator translator = GoogleTranslator();
  String out = "";
  final lang = TextEditingController();
  final lang1 = TextEditingController();
  final translatedtextC = TextEditingController();
  String dropdownValue = 'One';

  var decodedJson;
  Map<String, String> translatedJson = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final source = lang;
    //Instantiate the codeController
    _codeController = CodeController(
        text: source.text, language: dart, theme: monokaiSublimeTheme);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  void dropdownCallBack() {
    var jsonString = lang.text;
    bool decodedSucceeded = false;
    try {
      decodedJson = json.decode(jsonString) as Map<String, dynamic>;
      decodedSucceeded = true;
    } on FormatException catch (e) {
      print('The Provided String is not valid JSON');
    }
    if (dropdownValue == "English") {
      decodedJson.forEach((key, value) {
        translator
            .translate(value.toString(), from: 'auto', to: 'en')
            .then((output) {
          setState(() {
            var keyyy;
            out = output.toString();

            keyyy = "\"${key.toString()}\"";
            translatedJson[keyyy.toString()] =
                "\"${out.toString()}\"" + "\n"; //out;
          });
          translatedtextC.text = translatedJson.toString();
          print(translatedJson.toString() + "oooooooo");
          print('value pair-->' + out.toString() + key.toString());
        });
      });
      print('English');
    } else if (dropdownValue == "French") {
      decodedJson.forEach((key, value) {
        translator
            .translate(value.toString(), from: 'auto', to: 'fr')
            .then((output) {
          setState(() {
            var keyyy;
            out = output.toString();

            keyyy = "\"${key.toString()}\"";
            translatedJson[keyyy.toString()] =
                "\"${out.toString()}\"" + "\n"; //out;
          });
          translatedtextC.text = translatedJson.toString();
          print(translatedJson.toString() + "oooooooo");
          print('value pair-->' + out.toString() + key.toString());
        });
      });
      print('French');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
              ),
              // Container(
              //   height: 300,
              //   width: 500,
              //   color: Colors.grey,
              //   child: TextField(
              //       minLines: 400,
              //       maxLines: null,
              //       keyboardType: TextInputType.multiline,
              //       controller: lang,
              //       decoration: InputDecoration(
              //           border: InputBorder.none,
              //           enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(15),
              //               borderSide:
              //                   const BorderSide(width: 3, color: Colors.blue)))),
              // ),
              CodeField(
                maxLines: 20,
                minLines: null,
                controller: _codeController!,
                textStyle: TextStyle(fontFamily: 'SourceCode'),
              ),
              translatedtextC.text != ""
                  ? TextField(
                style: TextStyle(
                  color: Colors.pink,
                ),
                maxLines: null,
                controller: translatedtextC,
              )
                  : Container(),
              Container(
                child: DropdownButton<String>(
                  value: language1,
                  icon: Icon(Icons.arrow_downward),
                  elevation: 16,
                  items: <String>[
                    "Choose Language",
                    "English",
                    "French",
                    "Romanian"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      dropdownCallBack();
                    });
                    //  print(dropdownValue+'dropdown value');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



