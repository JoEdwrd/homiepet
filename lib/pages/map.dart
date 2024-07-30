import 'package:flutter/material.dart';
import 'package:homiepet/component/Locations.dart';

class Map extends StatefulWidget {
  final Function(Locations) onShareLocation; // Add this line

  const Map({Key? key, required this.onShareLocation}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _mapImage = 'BcaLearningInstitute.png'; // Initialize with default image

  List<Locations> locations = [
    Locations(
      location: "BCA Learning Institute",
      address: 'Sentul City, Jl. Pakuan No.3, Sumur Batu, Babakan Madang, Bogor Regency, West Java 16810',
      image: 'BcaLearningInstitute.png',
    ),
    Locations(
      location: "Rumah Talenta BCA",
      address: 'Jl. Pakuan No.3, Sumur Batu, Kec. Babakan Madang, Kabupaten Bogor, Jawa Barat 16810',
      image: 'RumahTalentaBca.png',
    ),
    Locations(
      location: "Aston Sentul",
      address: 'Jl. Pakuan No.3, Sumur Batu, Kec. Babakan Madang, Kabupaten Bogor, Jawa Barat 16810',
      image: 'Aston.png',
    ),
    Locations(
      location: "Taman Budaya",
      address: 'Jl. Siliwangi No.1, Sumur Batu, Kec. Babakan Madang, Kabupaten Bogor, Jawa Barat 16810',
      image: 'TamanBudaya.png',
    ),
    Locations(
      location: "Sentul Nirwana",
      address: 'Jl. Raya Jungle Land Avenue No.58, Bojong Koneng, Kec. Babakan Madang, Kabupaten Bogor, Jawa Barat 16810',
      image: 'SentulNirwana.png',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Locations> filteredLocations = locations.where((location) {
      return location.location.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          location.address.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      locations.firstWhere((location) => location.image == _mapImage),
                    );
                  },
                  icon: Icon(Icons.close),
                ),
                SizedBox(width: 40), // The comma should be here, outside the IconButton
              ],
            ),
            Text(
              "Locations",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, locations.firstWhere((location) => location.image == _mapImage));
              },
              child: Text(
                "Share",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              'assets/$_mapImage',
              fit: BoxFit.contain,
              height: 390,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100], // Set the background color to gray
                borderRadius: BorderRadius.circular(10), // Set the border radius
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none, // Remove the border
                  prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding to center text
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _mapImage = filteredLocations[index].image;
                      });
                    },
                    title: Text(filteredLocations[index].location, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(filteredLocations[index].address),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
