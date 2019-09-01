import 'package:flutter/material.dart';
import '../widgets/CustomPedometer.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }
}

class _MainScreenState extends State {
  int stepCount;
  int stepCountValue(int stepCountVal) {
    print(stepCountVal);
    return stepCountVal;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
        
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
            child: Image.asset("assets/images/walking.gif", fit: BoxFit.cover),
            height: height / 2,
            margin: EdgeInsets.only(left: 40)),
        Container(
            height: 200,
            child: Stack(children: [
              Container(
                child: CustomPedometer(),
                 width:width-20,
                 height:100,
                 decoration: BoxDecoration(border: Border.all(width: 4),
             
              ))
            ]))
      ],
    );
  }
}
