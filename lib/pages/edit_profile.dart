import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _selectedIndex = 2;
  File? _image;

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _pickImage() async {
    final photoStatus = await Permission.photos.request();
    final cameraStatus = await Permission.camera.request();

    if (photoStatus.isGranted && cameraStatus.isGranted) {
      final ImagePicker picker = ImagePicker();
      try {
        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          setState(() {
            _image = File(image.path);
            print("Image picked: ${image.path}"); // Debugging output
          });
        }
      } catch (e) {
        print("Error picking image: $e");
      }
    } else {
      print("Permission denied");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0), // Increase the height
        child: Stack(
          clipBehavior: Clip.none, // Allow the profile picture to overflow
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30), // Add radius to the bottom
              ),
              child: AppBar(
                backgroundColor: Color(0xffFEAA38),
                automaticallyImplyLeading: false, // Disable the default leading behavior
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/appbarlogo.png',
                          width: 180,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -55, // Adjust this value as needed to control overlap
              left: 0, // Reset left positioning
              right: 0, // Reset right positioning
              child: Align(
                alignment: Alignment.bottomCenter, // Center horizontally
                child: Stack(
                  children: [
                    Container(
                      width: 110, // Adjust this value to increase size
                      height: 110, // Adjust this value to increase size
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 5, // Border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 45, // Adjust radius to fit within the container
                        backgroundImage: _image == null
                            ? AssetImage('assets/profile_picture.jpg') as ImageProvider
                            : FileImage(_image!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffFEAA38), // Button background color
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined),
                          color: Colors.black, // Icon color
                          iconSize: 20, // Adjust icon size as needed
                          padding: EdgeInsets.all(3),
                          onPressed: () {
                            _pickImage();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter, // Position the Stack towards the top
            child: Padding(
              padding: const EdgeInsets.only(top: 120.0), // Adjust this value as needed
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 320,
                        padding: EdgeInsets.only(left: 24, right: 24, top: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, right: 5),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            editProfileDataRow('Name', 'John Doe'),
                            editProfileDataRow('Email', 'johndoe@example.com'),
                            editProfileDataRow('Phone', '(123) 456-7890'),
                            editProfileDataRow('Password', '*****'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Space between the container and the log out button
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 40), // Button width and height
                      backgroundColor: Colors.white, // Button background color
                      foregroundColor: Color(0xffFEAA38), // Text color
                      side: BorderSide(color: Color(0xffFEAA38), width: 2), // Border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Border radius
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5), // Button padding
                    ),
                    child: Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
          Spacer(), // Pushes the navigation bar to the bottom
          Container(
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

Widget editProfileDataRow(String attribute, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        constraints: BoxConstraints(
          minHeight: 10, // Set the minimum height
          maxHeight: 20, // Set the maximum height
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              attribute,
              style: TextStyle(fontSize: 14),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 14),
                ),
                IconButton(
                  onPressed: () {
                    // Add your onPressed functionality here
                  },
                  icon: Icon(LineAwesomeIcons.pen_solid),
                  color: Colors.black,
                  iconSize: 15, // Icon size
                  constraints: BoxConstraints(
                    minWidth: 30, // Set the minimum width
                    minHeight: 30, // Set the minimum height
                  ),
                  padding: EdgeInsets.all(0), // Adjust padding
                ),
              ],
            )
          ],
        ),
      ),
      Divider(
        color: Colors.black.withOpacity(0.5), // More visible divider color
        thickness: 2, // Increase the thickness of the divider
      ),
      SizedBox(height: 20,)
    ],
  );
}
