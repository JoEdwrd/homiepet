import 'package:flutter/material.dart';
import 'package:homiepet/pages/my_pets.dart';

import '../component/Pet.dart';

class DetailPetPage extends StatefulWidget {
  const DetailPetPage({super.key, required this.petData});

  final Pet petData;

  @override
  State<DetailPetPage> createState() => _DetailPetPageState();
}

// Keeping track of selected preferences
final Set<String> selectedPreferences = {};
final Set<String> selectedAnimals = {};

class _DetailPetPageState extends State<DetailPetPage> {
  late Pet petData;

  late final List<String> animals;
  late final Map<String, List<String>> breeds;
  late final List<String> characters;

  @override
  void initState() {
    // Initialize selectedAnimals with the available animal options from the beginning
    super.initState();
    petData = widget.petData;
    animals = [petData.animal];
    characters = petData.characters;
    breeds = {
      petData.animal: [petData.breed]
    };

    // Prepopulate selectedAnimals with the available options
    selectedAnimals.addAll(animals);
  }

  @override
  Widget build(BuildContext context) {
    double getDeviceHeight = MediaQuery.of(context).size.height;
    double getDeviceWidth = MediaQuery.of(context).size.width;

    List<Widget> inputUser(String label, String hint, double width, double height) {
      return [
        Text(
          label,
          style: TextStyle(
              fontSize: getDeviceWidth * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        const SizedBox(
          height: 3,
        ),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            initialValue: label == 'Name'
                ? petData.name
                : label == 'Age'
                ? petData.age.toString()
                : label == 'About Me'
                ? petData.aboutMe
                : label == 'Looking For'
                ? petData.lookingFor
                : '',
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.black)),
            ),
          ),
        )
      ];
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      "Detail",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: getDeviceWidth * 0.4,
                              height: getDeviceWidth * 0.43,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[350],
                                image: DecorationImage(
                                    image: AssetImage(petData.pathImage),
                                  fit: BoxFit.cover
                                )
                              ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...inputUser("Name", "Enter your pet's name here",
                              getDeviceWidth * 0.45, getDeviceHeight * 0.055),
                          const SizedBox(
                            height: 15,
                          ),
                          ...inputUser("Age", "Enter your pet's age here",
                              getDeviceWidth * 0.45, getDeviceHeight * 0.055)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildPreferenceCategory('Animal', animals),
                buildPreferenceCategory(
                  'Breeds',
                  selectedAnimals
                      .expand((animal) => breeds[animal] ?? [])
                      .cast<String>()
                      .toList(),
                ),
                buildPreferenceCategory('Character', characters),
                const SizedBox(
                  height: 20,
                ),
                ...inputUser("About Me", "Enter the description of your pet's here",
                    getDeviceWidth, getDeviceHeight * 0.1),
                const SizedBox(
                  height: 10,
                ),
                ...inputUser("Looking For", "Enter the description of your pet's here",
                    getDeviceWidth, getDeviceHeight * 0.1),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: getDeviceWidth * 0.3,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/editPet',
                            arguments: Pet(
                              name: petData.name,
                              age: petData.age,
                              animal: petData.animal,
                              breed: petData.breed,
                              characters: characters,
                              aboutMe: petData.aboutMe,
                              lookingFor: petData.lookingFor,
                              pathImage: petData.pathImage,
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.orange, width: 2),
                            foregroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: const Text("Edit")),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPreferenceCategory(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: options.map((option) => buildChip(option)).toList(),
        ),
      ],
    );
  }

  Widget buildChip(String label) {
    final isSelected = true;

    return ChoiceChip(
      showCheckmark: false,
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          selectedPreferences.add(label);
          selectedAnimals.add(label);
        });
      },
      selectedColor: Colors.black,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey[500],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
            color: isSelected ? Colors.white : Colors.grey[500]!, width: 2),
      ),
    );
  }
}
