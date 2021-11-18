import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.brown,
                displayColor: Colors.white,
              )),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        imagePath: 'images/background.jpg',
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Links(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Weather(),
            ),
            Align(
              alignment: Alignment(0.0, 0.5),
              child: Focus(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Setting(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Quotes(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Todo(),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "13:00",
                  style: TextStyle(fontSize: 50, color: Colors.black),
                )),
          ]),
        ),
      ),
    );
  }
}

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Links"),
        Container(width: 10, height: 0),
        Icon(Icons.search, color: Colors.brown),
      ],
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud, color: Colors.white),
            Container(
              width: 10,
              height: 0,
            ),
            Text("21º"),
          ],
        ),
        Container(width: 0, height: 10),
        Text("Gwanak-Gu"),
      ],
    );
  }
}

class Focus extends StatelessWidget {
  const Focus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Focus",
      style: TextStyle(color: Colors.black),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _settingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: _settingVisible,
          child: Container(
            width: 500,
            height: 500,
            color: Colors.green,
            child: Center(
              child: Icon(Icons.access_time_outlined, size: 50),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.brown,
          ),
          onPressed: () {
            setState(() {
              _settingVisible = !_settingVisible;
            });
          },
        ),
      ],
    );
  }
}

class Quotes extends StatelessWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Quotes",
      style: TextStyle(color: Colors.black),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool _todoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // AnimatedOpacity(
        //   opacity: 0.5,
        //   duration: Duration(milliseconds: 200),
        // ),
        AnimatedOpacity(
          opacity: _todoVisible ? 1 : 0,
          duration: Duration(milliseconds: 200),
          child: Visibility(
            visible: _todoVisible,
            child: TodoBox(),
          ),
        ),
        FlatButton(
            minWidth: 0,
            onPressed: () {
              setState(() {
                _todoVisible = !_todoVisible;
              });
            },
            child: Text(
              "Todo",
              style: TextStyle(color: Colors.black),
            )),
      ],
    );
  }
}

class TodoBox extends StatefulWidget {
  const TodoBox({Key? key}) : super(key: key);

  @override
  _TodoBoxState createState() => _TodoBoxState();
}

class _TodoBoxState extends State<TodoBox> {
  List<String> dropDownList = ['Inbox', 'Today', 'Done'];
  String? dropDownValue = "Inbox";
  List<bool> showingScreen = [true, false, false];
  int todoIndex = 0;
  bool showMoreBox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 350,
      padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(8))),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButton<String>(
              value: dropDownValue,
              items: dropDownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value,));
              }).toList(),
              onChanged: (String? value){
                setState(() {
                  dropDownValue = value;
                  showingScreen[todoIndex] = false;
                  todoIndex = dropDownList.indexOf(value!);
                  showingScreen[todoIndex] = true;
                });
              },
              style: TextStyle(color: Colors.black),
              // icon: ,
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: showingScreen[0],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Inbox", style: TextStyle(color: Colors.black),),
                  Text("New todo", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: showingScreen[1],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Today", style: TextStyle(color: Colors.black),),
                  Text("Today's work", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: showingScreen[2],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Done", style: TextStyle(color: Colors.black),),
                  Text("Not yet", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              visible: showMoreBox,
              child: InkWell(
                onTap: (){
                  setState(() {
                    showMoreBox = !showMoreBox;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.black,),
                  onPressed: (){
                    setState(() {
                      showMoreBox = !showMoreBox;
                    });
                  },
                ),
                Visibility(
                  visible: showMoreBox,
                  child: MoreBox(),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MoreBox extends StatefulWidget {
  @override
  _MoreBoxState createState() => _MoreBoxState();
}

class _MoreBoxState extends State<MoreBox> {
  List<String> moreContent = <String>['Autofocus', 'Add integration', 'Setting'];
  double _settingHeight = 30, _settingWidth = 110, _paddingSize = 5;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: _settingHeight * moreContent.length + _paddingSize*2,
      width: _settingWidth + _paddingSize*2,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(_paddingSize)),
      ),
      child: Padding(
        padding: EdgeInsets.all(_paddingSize),
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: moreContent.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: _settingHeight,
              width: _settingWidth,
              child: GestureDetector(
                child: Center(
                  child: Text(moreContent[index], style: TextStyle(color: Colors.black),),
                ),
                onTap: (){
                  print(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


class BackGround extends StatelessWidget {
  final Widget? child;
  final String imagePath;

  BackGround({this.child, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
