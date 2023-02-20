import 'dart:math';

import 'package:citi_calculator/screen/history_page.dart';
import 'package:citi_calculator/screen/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../history_db/history_data_file.dart';
import '../history_db/history_db_model.dart';

String buttontext = "";

class f_page extends StatefulWidget {
  const f_page({Key? key}) : super(key: key);

  @override
  State<f_page> createState() => _f_pageState();
}

class _f_pageState extends State<f_page> {
  String result = "";
  // var text="";
  String storevalue = "0";
  String expression = "";

  int firstNumber = 0;
  int secondNumber = 0;
  String sign = "";

  // try

  @override
  void initState() {
    super.initState();
    get_history();
  }

  get_history() async {
    s_history = await DB.gethistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CITIZEN",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: "Myfont"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                          actions: [
                            Column(
                              children: [
                                // Padding(
                                //     padding:
                                //         const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                //     child: CupertinoDialogAction(
                                //         onPressed: () {
                                //           Navigator.pop(context);
                                //         },
                                //         child: Align(
                                //             alignment: Alignment.topRight,
                                //             child: Text(
                                //               "×",
                                //               style: TextStyle(
                                //                   fontSize: 45,
                                //                   color: Colors.black),
                                //             )))),
                                SizedBox(height: 10,),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return history_page();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    "History",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Myfont"),
                                  ),
                                ),
                                Divider(color: Colors.black,endIndent: 15,indent: 15),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return setting_page();
                                      },
                                    ));
                                  },
                                  child: Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Myfont"),
                                  ),
                                ),

                                Divider(color: Colors.black,endIndent: 15,indent: 15),
                                CupertinoDialogAction(onPressed: () {
                                  Navigator.pop(context);
                                },child: Text("Cancel",style: TextStyle(color: Colors.red,fontFamily: 'Myfont'),))
                              ],
                            )
                          ],
                        ));
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.blue,
              )),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(5,10,0,0),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: Container(
                        //       height: 40,
                        //        width: 40,
                        //         // color: Colors.red,
                        //       child: Center(child: Text("${storevalue.length}",style: TextStyle(fontFamily: "Mydigital",color: Colors.black,fontSize: 20),)),
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: 140,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  // color: Colors.blue,
                                  child: Center(
                                      child: Text(
                                    sign,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Mydigital",
                                        fontSize: 25),
                                  )),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Container(
                                    // color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            result,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 40,
                                                fontFamily: "Mydigital"),
                                          )),
                                    ),
                                    //Align(alignment: Alignment.centerRight,child: Text(result,style: TextStyle(color: Colors.black,fontSize: 25),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 10),
                    color: Colors.lightGreen[300],
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.white,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    button(
                      "Check",
                      Colors.blue,
                      Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    button(
                      "Delete",
                      Colors.black87,
                      Colors.white,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 25,
                          width: 100,
                          // color: Colors.blue,
                          child: Image.asset(
                              "image/solar-cell-calculator-old-isolated-white-backghround-254742563.jpeg",
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.white12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(
                            "CE",
                            Colors.black87,
                            Colors.green,
                          ),
                          button(
                            "7",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "4",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "1",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "0",
                            Colors.black87,
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(
                            "GT",
                            Colors.grey,
                            Colors.black,
                          ),
                          button(
                            "8",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "5",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "2",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "00",
                            Colors.black87,
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(
                            "+/-",
                            Colors.grey,
                            Colors.black,
                          ),
                          button(
                            "9",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "6",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "3",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            ".",
                            Colors.black87,
                            Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(
                            "√",
                            Colors.grey,
                            Colors.black,
                          ),
                          button(
                            "×",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "-",
                            Colors.black87,
                            Colors.white,
                          ),
                          button("+", Colors.black87, Colors.white, flex: 2),
                          // inputButton("CE"),
                          // inputButton("CE"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(
                            "AC",
                            Colors.green,
                            Colors.white,
                          ),
                          button(
                            "%",
                            Colors.black87,
                            Colors.white,
                          ),
                          button(
                            "÷",
                            Colors.black87,
                            Colors.white,
                          ),
                          button("=", Colors.black87, Colors.white, flex: 2),
                          // inputButton("CE"),
                          // inputButton("CE"),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget button(String buttontext, Color buttoncolor, Color buttontextcolor,
      {int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: InkWell(
        onTap: () => buttonpress(buttontext),
        child: Container(
          // width: buttonwidth,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: buttoncolor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
              child: Text(
            buttontext,
            style: TextStyle(
                color: buttontextcolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Myfont"),
          )),
        ),
      ),
    );
  }

  buttonpress(String buttontext) {
    setState(() {
      if (buttontext == "AC") {
        storevalue = "0";
        result = "0";
        sign = "";
      } else if (buttontext == "=") {
        String value_store = result;

        expression = result;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression.trim());
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.VECTOR, cm)}';
          //Save history

          DateTime t = DateTime.now();
          print(t);
          String time = t.toString();

          value_store += " \n= ${result}";

          print(value_store);
          DB.save(H_data(history_data: value_store, stor_time: time));

          sign = "=";
        } catch (e) {
          result = "EROOR";
        }
      } else if (buttontext == "√") {
        result = sqrt(double.parse(result)).toString();
        print(result);
      }
      else if (buttontext == "%") {
        // result='0';
        int divide = int.parse(result);
        result = (divide / 100).toString();
        print("DIVID:${result}");
        setState(() {});
      }
      else if (buttontext == "CE") {
        if (result == "EROOR") {
          result = "";
        }
        result = "0";
      }
      else if (buttontext == "Check") {
        result = result.substring(0, result.length - 1);
      }
      else if (buttontext == '+/-') {
        sign = buttontext;
        result.toString().startsWith('-')
            ? result = result.toString().substring(1)
            : result = '-' + result.toString();
        result = result;
      }
      else if (buttontext == "Delete") {
        if (result == "EROOR") {
          result = "";
          setState(() {});
        }
        result = result.substring(0, result.length - 1);
        if (result == "") {
          result = "";
        }
      }
      else if (buttontext == "GT") {

        String value_store = result;

        expression = result;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression.trim());
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.VECTOR, cm)}';
          //Save history

          DateTime t = DateTime.now();
          print(t);
          String time = t.toString();

          value_store += " \n= ${result}";

          print(value_store);
          DB.save(H_data(history_data: value_store, stor_time: time));

          sign = "GT";
        } catch (e) {
          result = "EROOR";
        }


      }
      else {
        if (result.length <= 13) {
          result = result + buttontext;
        }
        if (buttontext == "+" ||
            buttontext == "-" ||
            buttontext == "÷" ||
            buttontext == "=" ||
            buttontext == "×" ||
            buttontext == "+/-") {
          setState(() {
            sign = buttontext;
          });
        }
      }
      // setState(() {
      //   result=result;
      //   print("TEXT:${result}");
      // });
    });
  }
  // squrt()
  // {
  //   if(buttontext == "√")
  //   {
  //     double a=25;
  //     double b=sqrt(a);
  //     print("${b}");
  //     sqrt(b);
  //     result=b.toString();
  //     print(result);
  //   }
  // }

//New try

  // dynamic text = '0';
  // double numOne = 0;
  // double numTwo = 0;
  //
  // dynamic result = '';
  // dynamic finalResult = '';
  // dynamic opr = '';
  // dynamic preOpr = '';

  // void calculation(btnText) {
  //   if (btnText == 'AC') {
  //     text = '0';
  //     numOne = 0;
  //     numTwo = 0;
  //     result = '';
  //     finalResult = '';
  //     opr = '';
  //     preOpr = '';
  //     sign="";
  //   }
  //   else if (btnText == "Delete") {
  //     // if (text == "EROOR") {
  //     //   text = "";
  //     //   setState(() {});
  //     // }
  //     text = text.substring(0, text.length - 1);
  //     print(text);
  //     // if (text == "") {
  //     //   text = "";
  //     // }
  //     setState(() {});
  //   }
  //
  //
  //
  //   else if (opr == '=' && btnText == '=') {
  //     if (preOpr == '+') {
  //       finalResult = add();
  //     } else if (preOpr == '-') {
  //       finalResult = sub();
  //     } else if (preOpr == '×') {
  //       finalResult = mul();
  //     } else if (preOpr == '÷') {
  //       finalResult = div();
  //     }
  //   }
  //   else if (btnText == '+' ||
  //       btnText == '-' ||
  //       btnText == '×' ||
  //       btnText == '÷' ||
  //       btnText == '=') {
  //     if (numOne == 0) {
  //       numOne = double.parse(result);
  //
  //     }
  //
  //
  //     else {
  //
  //       numTwo = double.parse(result);
  //
  //     }
  //
  //     if (opr == '+') {
  //       finalResult = add();
  //     }
  //
  //     else if (opr == '-') {
  //
  //       finalResult = sub();
  //     }
  //
  //     else if (opr == '×') {
  //       finalResult = mul();
  //     }
  //
  //     else if (opr == '÷') {
  //       finalResult = div();
  //     }
  //
  //     preOpr = opr;
  //     opr = btnText;
  //     result = '';
  //   }
  //   else if (btnText == '%') {
  //     result = numOne / 100;
  //     finalResult = doesContainDecimal(result);
  //   }
  //
  //
  //   else if (btnText == '.') {
  //     if (!result.toString().contains('.')) {
  //       result = result.toString() + '.';
  //     }
  //     finalResult = result;
  //   }
  //
  //   else if (btnText == '+/-') {
  //     result.toString().startsWith('-')
  //         ? result = result.toString().substring(1)
  //         : result = '-' + result.toString();
  //     finalResult = result;
  //   }
  //
  //   else {
  //
  //       result = result + btnText;
  //       print("RESULT${result}");
  //       finalResult = result;
  //       print("FINALRESULT${finalResult}");
  //
  //   }
  //
  //   setState(() {
  //     text = finalResult;
  //     // print("TEXT${text}");
  //     if(btnText=="CE")
  //       {
  //         text="0";
  //         // print("AFTER CE${text}");
  //       }
  //
  //   });
  // }
  //
  // String add() {
  //   result = (numOne + numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }
  //
  // String sub() {
  //   result = (numOne - numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }
  //
  // String mul() {
  //   result = (numOne * numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }
  //
  // String div() {
  //   result = (numOne / numTwo).toString();
  //   numOne = double.parse(result);
  //   return doesContainDecimal(result);
  // }
  //
  // String doesContainDecimal(dynamic result) {
  //   if (result.toString().contains('.')) {
  //     List<String> splitDecimal = result.toString().split('.');
  //     print("${splitDecimal}");
  //     if (!(int.parse(splitDecimal[1]) > 0))
  //       return result = splitDecimal[0].toString();
  //   }
  //   return result;
  // }
}
