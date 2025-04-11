import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
//        navigateToScreens(index);
      });
    }

    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(color: Color(0xFF2C2B2B)),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',          
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          label:
            'Near By',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          label:'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          label:
            'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xFFfd5352),
      onTap: _onItemTapped,
    );
  }
}
