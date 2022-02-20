import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SLTrans'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //just verify if we need to use var or final variables for the controllers.
  var textController = TextEditingController();
  var outputTextController = TextEditingController();
  var resultAssetPath = '';
  var resultAssetPaths = ['assets/bsl/blank.png']; //new List();
  // var alphaMap = new Map();
  var alphaMap = {'A':'assets/bsl/A.png','P':'assets/bsl/P.png',
  'L':'assets/bsl/L.png','E':'assets/bsl/E.png'};
  var dummyCounter = 0;
  // alphaMap['A'] = 'assets/bsl/A.png';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  generateResult(text) {

    // List(<String>) resultAssetPaths = []; //new List(<String>);
    text = text.toUpperCase();
    
  
    for (int i=0; i<text.length;i++){
      resultAssetPaths.add(alphaMap[text[i]]);

      
    }

    return resultAssetPaths;


  }
  //   return Container(

  //             child: Image.asset('assets/bsl/A.png')
            
            
  //           ,);


  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
            Align(
            alignment: Alignment.topCenter,
            child:Container(

                      child: TextField(
                        controller: textController,
                        cursorHeight: 30,
                        // selectionHeightStyle: BoxHeightStyle.tight,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Text',
                        hintStyle:TextStyle(fontSize: 20),
                        labelText: 'English Text',
                        floatingLabelBehavior: FloatingLabelBehavior.always
                      ),
                    ),
                    // alignment: Alignment.topRight,
                    
                    padding: EdgeInsets.all(20),
            
            ) 
            ),

            ElevatedButton(
              
              onPressed:  
              
              // uncomment this func bloc if using text as result
              (){ 
                setState(() {
                  // resultAssetPath='assets/bsl/A.png';
                  dummyCounter++;
                  // resultAssetPaths.clear(); This is not working need to fix
                  resultAssetPaths = generateResult(textController.text);
                });
                // resultAssetPath.text = 'assets/bsl/A.png';
                outputTextController.text = textController.text;}, 
            
            child:Text('Translate'),
            style:ElevatedButton.styleFrom(
              primary: Colors.blue,



            )
            
            ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child:Container(

          //             child: TextField(
          //               controller: outputTextController,
          //               cursorHeight: 30,
          //               // selectionHeightStyle: BoxHeightStyle.tight,
          //             decoration: InputDecoration(
          //               border: OutlineInputBorder(),
          //               hintText: 'SL Translated',
          //               // hintText: textController.text,
          //               hintStyle:TextStyle(fontSize: 20),
          //               labelText: 'SL',
          //               floatingLabelBehavior: FloatingLabelBehavior.always
          //             ),
          //           ),
          //           // alignment: Alignment.topRight,
                    
          //           padding: EdgeInsets.all(20),
            
          //   ) 
          //   ),


            Align(alignment: Alignment.bottomCenter,
            
            child:Container(

              child: Image.asset(resultAssetPaths[dummyCounter])
            
            
            ,)
            ),
            
          ],
        
        
        
        ),
        
      ),
      
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child : Text('Translate'),
      //   // child: Icon(Icons.add),
      // ),

      

      

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
