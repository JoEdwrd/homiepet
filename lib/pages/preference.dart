import 'package:flutter/material.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  final List<String> animals = ['Cat', 'Dog', 'Rabbit', 'Bird'];
  final Map<String, List<String>> breeds = {
    'Cat': ['Siamese', 'Persian', 'Maine Coon', 'Bengal'],
    'Dog': ['Golden', 'Husky', 'Malamute', 'Chihuahua', 'Bulldog', 'Poodle', 'Shitzu', 'Labrador', 'Pomeranian', 'Corgi'],
    'Rabbit': ['Holland Lop', 'Netherland Dwarf', 'Mini Rex'],
    'Bird': ['Parrot', 'Canary', 'Finch', 'Parakeet'],
  };
  final List<String> characters = [
    'Playful',
    'Active',
    'Calm',
    'Sociable',
    'Affectionate',
    'Obedience',
    'Protectiveness',
    'Loyal'
  ];

  // Keeping track of selected preferences
  final Set<String> selectedPreferences = {};
  final Set<String> selectedAnimals = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[400],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/appbarlogo.png',
              fit: BoxFit.contain,
              height: 50,
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 1],
            colors: [Colors.orange.shade400, Colors.brown.shade600],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40),
                Text(
                  "Your Preference",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Pick up to 10 things you love, It’ll help us to find your next best buddy",
                  style: TextStyle(fontSize: 10, color: Colors.grey[700]),
                ),
                SizedBox(height: 16),
                buildPreferenceCategory('Animal', animals),
                if (selectedAnimals.isNotEmpty)
                  buildPreferenceCategory(
                    'Breeds',
                    selectedAnimals.expand((animal) => breeds[animal] ?? []).cast<String>().toList(),
                  ),
                buildPreferenceCategory('Character', characters),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${selectedPreferences.length}/10 Selected',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
              shape: CircleBorder(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPreferenceCategory(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Wrap(
          spacing: 8.0,
          children: options.map((option) => buildChip(option, title == 'Animal')).toList(),
        ),
      ],
    );
  }

  Widget buildChip(String label, [bool isAnimal = false]) {
    final isSelected = selectedPreferences.contains(label);

    return ChoiceChip(
      showCheckmark: false,
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            if (selectedPreferences.length < 10) {
              selectedPreferences.add(label);
              if (isAnimal) selectedAnimals.add(label);
            }
          } else {
            selectedPreferences.remove(label);
            if (isAnimal) selectedAnimals.remove(label);
          }
        });
      },
      selectedColor: Colors.black,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey[500],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: isSelected ? Colors.white : Colors.grey[500]!, width: 2),
      ),
    );
  }
}
