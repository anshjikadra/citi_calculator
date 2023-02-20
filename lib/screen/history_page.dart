import 'package:citi_calculator/screen/f_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../history_db/history_data_file.dart';
import '../history_db/history_db_model.dart';

class history_page extends StatefulWidget {
  const history_page({Key? key}) : super(key: key);

  @override
  State<history_page> createState() => _history_pageState();
}

class _history_pageState extends State<history_page> {






  @override
  void initState() {
    super.initState();
    get_history();
  }
  get_history() async {

    s_history = await DB.gethistory();

   hisstory=List.from(s_history.reversed);
    // s_history.reversed.toList();
    // print(s_history);

    setState(() {});
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: TextStyle(fontFamily: "Myfont",color: Colors.black),
        ),
        actions: [

          IconButton(onPressed: (){

            print('Hello');

            _showAlertDialog(context);






          }, icon:Icon(Icons.delete_rounded,color: Colors.blue,) ),
        ],
        leading:  IconButton(onPressed: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
            return f_page();
          },));

        }, icon: Icon(Icons.arrow_back_ios,color: Colors.blue,)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: ListView.builder(itemCount: s_history.length,itemBuilder: (context, index) {
        print(s_history[index]);

        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(

            color: Colors.white54,
            child: ListTile(

              title: Align(alignment: Alignment.topRight,child: Text(_string(hisstory[index].history_data),style: TextStyle(color: Colors.black,fontFamily: "Myfontlight",fontSize: 20))),
              leading: Text(hisstory[index].stor_time,style: TextStyle(color: Colors.black,fontFamily: "Myfontlight",fontSize: 13),),
            ),
          ),
        );
      },),
    );
  }

  String _string(String data) {
    var list = data.split("");
    data = list
        .map(
          (e) {
        if (e.contains("+")) {
          return e = "\n+ ";
        }
        if (e.contains("-")) {
          return e = " \n- ";
        }
        if (e.contains("×")) {

          return e = " \n× ";
        }

        if (e.contains("÷")) {
         return e = " \n÷ ";
        }
        if (e.contains("%")) {
          return e = " \n% ";
        }

        return e;
      },
    )
        .toList()
        .join();
    return data;
  }


//CUPERTINO DILOUGE BOX FOR DELETE HISTORY.....................................
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Delete History',style: TextStyle(fontFamily: "Myfont"),),
        content: const Text('Are you sure you want to delete all history data?',style: TextStyle(fontFamily:"Myfontlight"),),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(

            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(

            isDestructiveAction: true,
            onPressed: () {

              DB.delete();
              s_history.clear();
              Navigator.pop(context);
              setState(() {

              });
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }



}
