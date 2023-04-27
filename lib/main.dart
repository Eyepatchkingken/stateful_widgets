import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double xDirection = 0.0;
  double yDirection = 0.0;
  double zDirection = 0.0;

  late Matrix4  baseTransform;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    baseTransform = Matrix4.identity(); //the default appearance of the widget
  }

  void handleSelection(){
    baseTransform.rotateX(xDirection/180.0);
    baseTransform.rotateY(yDirection/180.0);
    baseTransform.rotateZ(zDirection/180.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Slider Example"),
        ),
        body: Center(
            child: Column(
              children:  [
                Text("Move Slider to transform the card"),
                Padding(padding: EdgeInsets.all(20.0)),
                Transform( //the child within this function can be moved around
                  child: Card(
                    child: Padding(padding: EdgeInsets.all(20.0)), 
                    color: Colors.orangeAccent, //creates a card with an orange colour
                  ),
                  transform: baseTransform, //changes applied to the basetransform will affect the child element
                  ),
                  Slider( 
                  value: xDirection, 
                  max: 180.0,
                  min: 0.0,
                  onChanged: (double value) {
                    setState(() {
                      xDirection = value;
                      handleSelection();
                    });
                  }
                  ),
                   Slider(
                  value: yDirection, 
                  max: 180.0,
                  min: 0.0,
                  onChanged: (double value) {
                    setState(() {
                      yDirection = value;
                      handleSelection();
                    });
                  }
                  ),
                   Slider(
                  value: zDirection, 
                  max: 180.0,
                  min: 0.0,
                  onChanged: (double value) {
                    setState(() {
                      zDirection = value;
                      handleSelection();
                    });
                  }
                  ),
              ],
            ),
        ),
        ),
    );
  }
}
// STATEFUL TAB BAR VIEW

/* class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{ //provides a ticker in the tab bar
    TabController? tabController;

  @override
  Widget build(BuildContext context) {
    initState(){
      super.initState();
      
    }
    tabController = TabController(length: 3, vsync: this); //the length parameter gives the tab 3 items
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar Sample"),
          bottom: TabBar(
            
            controller: tabController ,
            tabs: const [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.history),),
              Tab(icon: Icon(Icons.trending_up),),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [ //each widget correlates to the tab
            Center(
              child: Icon(Icons.home, size: 128.0, color: Colors.blue,),
            ),
            Center(
              child: Icon(Icons.history, size: 128.0, color: Colors.blue,),
            ),
            Center(
              child: Icon(Icons.trending_up, size: 128.0, color: Colors.blue,),
            ),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.blueAccent,
          child: TabBar(
            controller: tabController,
            tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.history),),
              Tab(icon: Icon(Icons.trending_up),),
            ],
          ),
        ),
      ),
    );
  }
}
 */


// STATEFUL APP BAR

/* class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Icon selectionIcon = Icon(Icons.mail);
  void changeSelection(Icon icon){ //the function takes a parameter of Icon
    setState(() {
      selectionIcon = icon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Stateful App Bar "),
          centerTitle: false, //determines if the title is in the centre of the app bar
          elevation: 20.0, //determines how much drop shadow you want from the app bar
          toolbarOpacity: 1.0, //determines how clear the text is
          leading: IconButton( //what is displayed first on the app bar
            onPressed: (){}, 
            icon: Icon(Icons.menu)),
            actions: [ //the three dots button
              IconButton(onPressed: (){
                changeSelection(Icon(Icons.mail));
              }, icon: Icon(Icons.mail)),
              IconButton(onPressed: (){
                changeSelection(Icon(Icons.delete));
              }, icon: Icon(Icons.delete)),
            ], 
        ),
        body: Card(
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(selectionIcon.icon, size: 128.0, color: Colors.white,) //displays the icon stored in selectionIcon
                          ],
              ),
            ),
        ),
        ),
    );
  }
}
 */










// STATEFUL GRIDVIEW

/* class MyApp extends StatefulWidget {
 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> items = <String>[];

  @override
  void initState() { // the function that gets called to initialize the state
    // TODO: implement initState
    super.initState();
    for(var i = 0; i<100; i++){
      items.add("Item $i");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Stateful Gridview"),
          ),
          body: GridView.builder(
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index){
              return Card(
                color: Colors.blueAccent,
                child: Padding(padding: const EdgeInsets.all(20),
                child: Text("Items ${index +1}"),
                ),
              );
            },
          )
        ),
      ),
    );
  }
} */