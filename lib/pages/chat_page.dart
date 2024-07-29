import 'package:flutter/material.dart';
import 'package:homiepet/component/Locations.dart';

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> conversation;
  final List<Map<String, dynamic>> messages;

  ChatPage({required this.conversation, required this.messages});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<Map<String, dynamic>> messages;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with messages passed from the parent
    messages = widget.messages;
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'isUserMessage': true, 'time': _getCurrentTime()});
      });
      _controller.clear();
      if (text == "This is my location") {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            messages.add({'text': 'Okay, I will see you there', 'isUserMessage': false, 'time': _getCurrentTime()});
          });
        });
      } else {
        // Simulate a reply
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            messages.add({
              'text': 'Yes, of course',
              'isUserMessage': false,
              'time': _getCurrentTime()
            });
          });
        });
      }
    }
  }

  void _shareLocation(Locations location) {
    print('Location data: ${location.location}, ${location.address}, ${location.image}');
    setState(() {
      messages.add({
        'text': location.location,
        'address': location.address,
        'image': location.image,
        'isUserMessage': true,
        'time': _getCurrentTime(),
      });
    });
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '${hour}:${now.minute.toString().padLeft(2, '0')}$period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.conversation['name'], style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on, color: Colors.orange),
            onPressed: () async {
              final location = await Navigator.pushNamed(context, '/map');
              if (location != null && location is Locations) {
                _shareLocation(location);
              } else {
                print('Location data not received or not valid');
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message['isUserMessage'];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isUserMessage)
                        CircleAvatar(
                          backgroundImage: AssetImage(widget.conversation['avatar']),
                        ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          if (message["image"]!=null)
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isUserMessage ? Colors.grey[200] : Colors.white,
                                border: isUserMessage ? null : Border.all(color: Colors.orange, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    'assets/${message['image']}',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 5),
                                  Text(message['text'], style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            )
                          else
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isUserMessage ? Colors.grey[200] : Colors.white,
                                border: isUserMessage ? null : Border.all(color: Colors.orange, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(message['text']),
                            ),
                          Text(
                            message['time'],
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Colors.grey[300]!, width: 1.0),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        border: InputBorder.none,
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
