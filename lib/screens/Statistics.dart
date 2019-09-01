import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory SimpleLineChart.withRandomData() {
    return new SimpleLineChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<LinearActivity, num>> _createRandomData() {
    final random = new Random();

    final data = [
      new LinearActivity(0, random.nextInt(100)),
      new LinearActivity(1, random.nextInt(100)),
      new LinearActivity(2, random.nextInt(100)),
      new LinearActivity(3, random.nextInt(100)),
    ];

    return [
      new charts.Series<LinearActivity, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearActivity activity, _) => activity.day,
        measureFn: (LinearActivity activity, _) => activity.steps,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  
}

/// Sample linear data type.
class LinearActivity {
  final  day;
  final int steps;

  LinearActivity(this.day, this.steps);
}
class StatisticsScreen extends StatelessWidget{
  
     List<charts.Series<LinearActivity,int>> _createSampleData() {
    final List<LinearActivity> data =[
           new LinearActivity(0, 2000),

     new LinearActivity(1, 200),
     new LinearActivity(3, 100),
     new LinearActivity(4, 500),
     new LinearActivity(5, 600),
     new LinearActivity(6, 1000)
    ];

    return [
      new charts.Series<LinearActivity, int>(
        id: 'Activity',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearActivity activity, _) => activity.day,
        measureFn: (LinearActivity activity, _) => activity.steps,
        data: data,
      )
    ];
  }
   SimpleLineChart withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
    return Container(child:withSampleData(),height:height/2,width:width,margin: EdgeInsets.all(10),);
  }
  
}