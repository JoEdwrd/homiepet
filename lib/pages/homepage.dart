import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TCardController _controller = TCardController();
  int _selectedIndex = 1;
  double _cardHeightPercentage = 0.7; // Initial TCard height as a percentage of screen height
  bool _isDetailVisible = false; // Track if detail view is visible

  void _toggleCardPosition() {
    setState(() {
      _isDetailVisible = !_isDetailVisible;
      _cardHeightPercentage = _isDetailVisible ? 0.4 : 0.7;
    });
  }

  List<Map<String, dynamic>> pets = [
    {
      'image': 'assets/pet1.png',
      'name': 'Ziven',
      'age': 5,
      'distance': '2 KM away from you',
      'description': 'Woof, I\'m a furry ray of sunshine...',
    },
    {
      'image': 'assets/pett.png',
      'name': 'Buddy',
      'age': 4,
      'distance': '3 KM away from you',
      'description': 'Loving, playful, and always ready for a new adventure!',
    },
    {
      'image': 'assets/pet3.png',
      'name': 'Charlie',
      'age': 3,
      'distance': '1 KM away from you',
      'description': 'Energetic and loves to play fetch!',
    },
    {
      'image': 'assets/pet4.png',
      'name': 'Max',
      'age': 6,
      'distance': '4 KM away from you',
      'description': 'A gentle giant who loves cuddles.',
    },
    {
      'image': 'assets/pet5.png',
      'name': 'Car',
      'age': 2,
      'distance': '5 KM away from you',
      'description': 'Curious and always exploring new places.',
    },
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/profile');
        break;
      case 1:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 2:
        Navigator.pushNamed(context, '/preference');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = pets.map((pet) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(pet['image']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pet['name']}, ${pet['age']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pet['distance'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    pet['description'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 40,),
            Image.asset(
              'assets/appbarlogo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            IconButton(
              icon: Icon(Icons.tune, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/preference');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: 0,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: MediaQuery.of(context).size.height * _cardHeightPercentage,
              child: TCard(
                controller: _controller,
                cards: cards,
                onForward: (index, info) {
                  if (info.direction == SwipDirection.Right) {
                    print('Card $index liked');
                  } else {
                    print('Card $index reject');
                  }
                },
                onBack: (index, info) {
                  print('Card $index swiped back');
                },
                onEnd: () {
                  print('End of cards');
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                _controller.forward(direction: SwipDirection.Left);
                print('Card reject');
              },
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
              shape: CircleBorder(),
            ),
            Container(
              height: 75,
              width: 75,
              child: FittedBox(
                child: FloatingActionButton(
                
                  onPressed: () {
                    _toggleCardPosition();
                  },
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _controller.forward(direction: SwipDirection.Right);
                print('Card liked');
              },
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: _selectedIndex == 0
                      ? BorderSide(color: Color(0xffB51313), width: 2)
                      : BorderSide(color: Colors.transparent),
                ),
              ),
              child: IconButton(
                onPressed: () => _onIconTapped(0),
                icon: Icon(LineAwesomeIcons.sms_solid),
                color: _selectedIndex == 0 ? Color(0xffB51313) : Colors.grey,
                iconSize: 40,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: _selectedIndex == 1
                      ? BorderSide(color: Color(0xffB51313), width: 2)
                      : BorderSide(color: Colors.transparent),
                ),
              ),
              child: IconButton(
                onPressed: () => _onIconTapped(1),
                icon: Icon(LineAwesomeIcons.paw_solid),
                color: _selectedIndex == 1 ? Color(0xffB51313) : Colors.grey,
                iconSize: 40,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: _selectedIndex == 2
                      ? BorderSide(color: Color(0xffB51313), width: 2)
                      : BorderSide(color: Colors.transparent),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: Icon(LineAwesomeIcons.user_solid),
                color: _selectedIndex == 2 ? Color(0xffB51313) : Colors.grey,
                iconSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
