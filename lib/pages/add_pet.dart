import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../component/Pet.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

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



class _AddPetPageState extends State<AddPetPage> {

  late String pathImage;
  // Keeping track of selected preferences
  final Set<String> selectedPreferences = {};
  final Set<String> selectedAnimals = {};
  late String selectedBreed;
  final List<String> selectedCharacters = [];

  final TextEditingController nameInput = TextEditingController();
  final TextEditingController ageInput = TextEditingController();
  final TextEditingController aboutMeInput = TextEditingController();
  final TextEditingController lookingForInput = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pathImage = '';
  }

  void _showImagePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select your pet Picture'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _buildImageOption('assets/chihuahaPet.png'),
                      Spacer(),
                      _buildImageOption('assets/bulldogPet.png'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      _buildImageOption('assets/dogPet.png'),
                      Spacer(),
                      _buildImageOption('assets/dogPet2.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageOption(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pathImage = imagePath; // Update the global variable
        });
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double getDeviceHeight = MediaQuery.of(context).size.height;
    double getDeviceWidth = MediaQuery.of(context).size.width;

    List<Widget> inputUser(String label, String hint, double width, double height){
      return [
        Text(
            label,
            style: TextStyle(fontSize: getDeviceWidth*0.045, fontWeight: FontWeight.bold, color: Colors.black)
        ),
        const SizedBox(height: 3,),
        Container(
          height: height,
          width: width,
          child: TextFormField(
            controller: label == 'Name' ? nameInput : label == 'Age' ? ageInput : label == 'About Me' ? aboutMeInput : label == 'Looking For' ? lookingForInput : null,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                fontSize: 12
              ),
              label: Text(hint),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.black)
              ),
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
                       "Add New Pet",
                       style: TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.w600
                       ),
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
                           InkWell(
                             child: pathImage == '' ? Container(
                               width: getDeviceWidth*0.4,
                               height: getDeviceWidth*0.43,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.grey[350]
                               ),
                               child: Icon(
                                 Icons.file_upload_outlined,
                                 size: getDeviceWidth*0.3,
                                 color: Colors.white,
                               ),
                             ) : Container(
                               width: getDeviceWidth * 0.4,
                               height: getDeviceWidth * 0.438,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.grey[350],
                                   image: DecorationImage(
                                     image: AssetImage(pathImage),
                                     fit: BoxFit.cover,
                                   )
                               ),
                             ),
                             onTap: (){
                               _showImagePicker();
                             },
                           ),
                           const SizedBox(height: 10,),
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           ...inputUser("Name", "Enter your pet's name here", getDeviceWidth*0.45, getDeviceHeight*0.06),
                           const SizedBox(height: 15,),
                           ...inputUser("Age", "Enter your pet's age here", getDeviceWidth*0.45, getDeviceHeight*0.06)
                         ],
                       )
                     ],
                   ),
                 ),
                 const SizedBox(height: 20,),
                 buildPreferenceCategory('Animal', animals),
                 if (selectedAnimals.isNotEmpty)
                   buildPreferenceCategory(
                     'Breeds',
                     selectedAnimals.expand((animal) => breeds[animal] ?? []).cast<String>().toList(),
                   ),
                 buildPreferenceCategory('Character', characters),
                 const SizedBox(height: 20,),
                 ...inputUser("About Me", "Enter the description of your pet's here", getDeviceWidth, getDeviceHeight*0.1),
                 ...inputUser("Looking For", "Enter the description of your pet's here", getDeviceWidth, getDeviceHeight*0.1),
                 const SizedBox(height: 30,),
                 Align(
                   alignment: Alignment.center,
                   child: SizedBox(
                     width: getDeviceWidth*0.3,
                     height: 50,
                     child: OutlinedButton(
                         onPressed: (){
                           Pet.petDataList.add(Pet(
                             pathImage: pathImage,
                             aboutMe: aboutMeInput.text,
                             age: ageInput.text,
                             animal: selectedAnimals.first,
                             breed: selectedBreed,
                             characters: selectedCharacters,
                             lookingFor: lookingForInput.text,
                             name: nameInput.text
                           ));

                           Navigator.pushNamed(context, '/mypets');
                         },
                         style: OutlinedButton.styleFrom(
                           side: BorderSide(color: Colors.orange, width: 2),
                           foregroundColor: Colors.orange,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(18)
                           )
                         ),
                         child: Text("Save")
                     ),
                   ),
                 ),
                 SizedBox(height: 20,)
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
          children: options.map((option) => buildChip(option, title == 'Animal', title == 'Breeds', title == 'Character')).toList(),
        ),
      ],
    );
  }

  Widget buildChip(String label, bool isAnimal, bool isBreed, bool isCharacter) {
    final isSelected = selectedPreferences.contains(label);

    return ChoiceChip(
      showCheckmark: false,
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
            if (selected) {
              if(isBreed){
                selectedBreed = label;
              }else if(isCharacter){
                selectedCharacters.add(label);
              }

              if ((!selectedAnimals.isNotEmpty && isAnimal) || !isAnimal) {
                selectedPreferences.add(label);
                if (isAnimal) selectedAnimals.add(label);
              }else{

                if(isBreed){
                  selectedBreed = '';
                }else if(isCharacter){
                  selectedCharacters.remove(label);
                }

                if(isAnimal){
                  selectedPreferences.remove(selectedAnimals.first);
                  if (isAnimal) selectedAnimals.remove(selectedAnimals.first);
                  selectedPreferences.add(label);
                  if (isAnimal) selectedAnimals.add(label);
                }
              }
            }else {
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
