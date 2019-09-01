import 'package:fitness_app/screens/TransactionScreen.dart';
import 'package:flutter/material.dart';
import '../screens/MainScreen.dart';
import '../screens/Statistics.dart';
class TabsScreen extends StatefulWidget{

  TabsScreen();
  @override
  _TabsScreenState createState() {
    // TODO: implement createState
    return _TabsScreenState();
  }
  
}
class _TabsScreenState extends State<TabsScreen>{
  
  List<Map<String,dynamic>> _pages;
  int _selectedPageIndex=0;
  @override
  void initState() {
      print("inside init state");
    _pages = [
      {
        'page': MainScreen(),
        'title': 'Fitness',
      },
      {
        'page': StatisticsScreen(),
        'title': 'Your Favorite',
      },
      {
        'page':TransactionScreen(),
        'title':'Your Transactions Here'
      }
    ];
    super.initState();
  }

  void _selectPage(int index)
  {
     setState(() {
       _selectedPageIndex=index;
     });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(_pages);
    return  Scaffold(
      appBar:AppBar(title: Text(_pages[_selectedPageIndex]['title']),),
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.fitness_center),title: Text('Exercise')),
          BottomNavigationBarItem(icon:Icon(Icons.insert_chart),title:Text('Stats')),
          BottomNavigationBarItem(icon:Icon(Icons.attach_money),title:Text('Money'))
        ]
      ),body:_pages[_selectedPageIndex]['page']);
  }
  
}


/*
bottom: TabBar(tabs: <Widget>[
        Tab(icon:Icon(Icons.category),text:'categories'),
        Tab(icon:Icon(Icons.favorite),text: 'favourites',)
      ],),),
    body:TabBarView(children: <Widget>[
      CategoriesScreen(),
      FavoritesScreen()
    ],)
    )
     */