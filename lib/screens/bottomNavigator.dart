import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}



class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  void onTabTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _systemBackButtonPressed(
      BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        if (_selectedIndex != 0) {
          onTabTapped(0);
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Presser à nouveau pour quitter l\'application')));
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
        OrientationBuilder(builder: (context, orientation) {
          return WillPopScope(
            onWillPop: () => _systemBackButtonPressed(context, orientation),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/dart.png',
                      height: 20,
                    ),
                    label: 'Jouer',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.score),
                    label: 'Scores',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  onTabTapped(index);
                }),
          );
        }),
        body: IndexedStack(
          children: <Widget>[
            Container(),
            Container(),
          ],
          index: _selectedIndex,
        ));
  }
}
