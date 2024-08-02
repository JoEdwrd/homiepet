class Pet{
  String name;
  String age;
  String animal;
  String breed;
  List<String> characters;
  String aboutMe;
  String lookingFor;
  String pathImage;

  Pet({
    required this.name,
    required this.age,
    required this.animal,
    required this.breed,
    required this.characters,
    required this.aboutMe,
    required this.lookingFor,
    required this.pathImage
  });

  static List<Pet> petDataList = [
    Pet(
      name: 'Buddy',
      animal: 'Dog',
      breed: 'Golden Retriever',
      age: '2 years',
      aboutMe: 'Friendly and playful',
      lookingFor: 'A loving family',
      pathImage: 'assets/chihuahaPet.png',
      characters: ['Playful'],
    ),
    Pet(
      name: 'Whiskers',
      animal: 'Cat',
      breed: 'Siamese',
      age: '1 year',
      aboutMe: 'Calm and affectionate',
      lookingFor: 'A quiet home',
      pathImage: 'assets/dogPet2.png',
      characters: ['Friendly', 'Playful'],
    ),

    Pet(
      name: 'Cumau',
      animal: 'Dog',
      breed: 'Golden Retriever',
      age: '5 year',
      aboutMe: 'Calm and affectionate',
      lookingFor: 'A quiet home',
      pathImage: 'assets/dogPet2.png',
      characters: ['Friendly', 'Playful'],
    ),

    Pet(
      name: 'Colab',
      animal: 'Cat',
      breed: 'Persia',
      age: '10 months',
      aboutMe: 'Calm and affectionate',
      lookingFor: 'A quiet home',
      pathImage: 'assets/dogPet2.png',
      characters: ['Friendly', 'Playful'],
    )
  ];
}