import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../component/Pet.dart';

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({super.key});

  @override
  State<MyPetsPage> createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetsPage> {
  int _selectedIndex = 2;
  final ScrollController _scrollController = ScrollController();

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double getDeviceHeight = MediaQuery.of(context).size.height;
    double getDeviceWidth = MediaQuery.of(context).size.width;

    Widget myPetCard(String pathImage, String petName, String petAge, String animal, String breed, List<String> characters, String aboutMe, String lookingFor) {
      return InkWell(
        onTap: (){
          Navigator.pushNamed(
            context,
            '/detailPet',
            arguments: Pet(
              name: petName,
              age: petAge,
              animal: animal,
              breed: breed,
              characters: characters,
              aboutMe: aboutMe,
              lookingFor: lookingFor,
              pathImage: pathImage,
            ),
          );
        },
        child: Column(
          children: [
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
              elevation: 7,
              child: Image.asset(
                pathImage,
                width: getDeviceWidth * 0.35,
                height: getDeviceHeight * 0.16,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              petName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 10, 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => {
                    Navigator.pop(context)
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(width: 45),
                Image.asset('assets/appbarlogo.png')
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          "My Pets",
                          style: TextStyle(fontSize: 27, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 34,
                      runSpacing: 30,
                      children: Pet.petDataList.map((pet) {
                        return myPetCard(
                                pet.pathImage,
                                pet.name,
                                pet.age,
                                pet.animal,
                                pet.breed,
                                pet.characters,
                                pet.aboutMe,
                                pet.lookingFor,
                              );
                            }).toList(),
                    ),
                    const SizedBox(height: 150), // Add padding to avoid overlapping with the sticky bar
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                width: getDeviceWidth,
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
            ),
            Positioned(
              bottom: 110, // Adjust as needed to position above the navbar
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addPet');
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/addBtnMyPets.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

