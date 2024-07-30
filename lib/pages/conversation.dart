import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Conversation extends StatefulWidget {
  @override
  _Conversation createState() => _Conversation();
}

class _Conversation extends State<Conversation> {
  final List<Map<String, dynamic>> conversations = [
    {'name': 'Ziven', 'message': 'Yes, he will happy to see ...', 'time': '20m', 'avatar': 'assets/ziven.png'},
    {'name': 'Jelly', 'message': 'What\'s up?', 'time': '45m', 'avatar': 'assets/jelly.png'},
    {'name': 'Archie', 'message': 'Archie is very energetic', 'time': '2h', 'avatar': 'assets/archie.png'},
    {'name': 'Lucky', 'message': 'Of course', 'time': '1d', 'avatar': 'assets/lucky.png'},
    {'name': 'Joel', 'message': 'Joel is here', 'time': '3d', 'avatar': 'assets/joel.png'},
  ];

  final Map<String, List<Map<String, dynamic>>> userMessages = {
    'Ziven': [
      {'text': 'Hello', 'isUserMessage': true, 'time': '3:00PM'},
      {'text': 'Yes', 'isUserMessage': false, 'time': '3:00PM'},
      {'text': 'Can I pet him?', 'isUserMessage': true, 'time': '3:00PM'},
      {'text': 'Yes, he will be happy to see you', 'isUserMessage': false, 'time': '3:00PM'},
    ],
    'Jelly': [
      {'text': 'Hey Jelly!', 'isUserMessage': true, 'time': '4:00PM'},
      {'text': 'What\'s up?', 'isUserMessage': false, 'time': '4:05PM'},
    ],
    'Archie': [
      {'text': 'Hey! how is archie personality?', 'isUserMessage': true, 'time': '4:00PM'},
      {'text': 'Archie is very energetic', 'isUserMessage': false, 'time': '4:05PM'},
    ],
    'Lucky': [
      {'text': 'Can i adopt lucky?', 'isUserMessage': true, 'time': '4:00PM'},
      {'text': 'Of course', 'isUserMessage': false, 'time': '4:05PM'},
    ],
    'Joel': [
      {'text': 'Hey!', 'isUserMessage': true, 'time': '4:00PM'},
      {'text': 'Joel is here', 'isUserMessage': false, 'time': '4:05PM'},
    ],
  };

  int _selectedIndex = 0;

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/conversation');
        break;
      case 1:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 2:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/appbarlogo.png',
                height: 40,
              ),
              SizedBox(width: 8)
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),  // This sets the color for the icon in the app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Conversation',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(conversations[index]['avatar']),
                  ),
                  title: Text(conversations[index]['name']),
                  subtitle: Text(conversations[index]['message']),
                  trailing: Text(conversations[index]['time']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                          conversation: conversations[index],
                          messages: userMessages[conversations[index]['name']] ?? [],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Spacer(), // Pushes the navigation bar to the bottom
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border(
              //   top: BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: _selectedIndex == 0 ? BorderSide(color: Color(0xffB51313), width: 2) : BorderSide(color: Colors.transparent),
                      )
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
                        bottom: _selectedIndex == 1 ? BorderSide(color: Color(0xffB51313), width: 2) : BorderSide(color: Colors.transparent),
                      )
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
                        bottom: _selectedIndex == 2 ? BorderSide(color: Color(0xffB51313), width: 2) : BorderSide(color: Colors.transparent),
                      )
                  ),
                  child: IconButton(
                    onPressed: () => _onIconTapped(2),
                    icon: Icon(LineAwesomeIcons.user_solid),
                    color: _selectedIndex == 2 ? Color(0xffB51313) : Colors.grey,
                    iconSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
