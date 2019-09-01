import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:sensors/sensors.dart';

class CustomPedometer extends StatefulWidget{
  @override
  _CustomPedometerState createState() => _CustomPedometerState();
}

class _CustomPedometerState extends State<CustomPedometer> {
   var _subscription;
  String _stepCountValue = '';
   void setUpPedometer() {

accelerometerEvents.listen((AccelerometerEvent event) {
 // Do something with the event.
 print(event);
});

gyroscopeEvents.listen((GyroscopeEvent event) {
 // Do something with the event.
});
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(int stepCountValue) async {
    setState(() => _stepCountValue = "$stepCountValue");
  }

  void _onDone() => print("Finished pedometer tracking");

  void _onError(error) => print("Flutter Pedometer Error: $error");

  void _onCancel() => _subscription.cancel();
//

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpPedometer();
    
    //sensors
    

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FittedBox(child:Text('${_stepCountValue}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),));
  }
}