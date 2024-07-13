import 'package:UrbanPark/features/work/screens/parking/widgets/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get for navigation

class SelectVehiclePage extends StatefulWidget {
  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  List<Vehicle> cars = [
    Vehicle(name: '2021 Audi Q3'),
    Vehicle(name: '2021 BMW X2'),
    Vehicle(name: '2022 Mercedes-Benz C-Class'),
    Vehicle(name: '2023 Toyota Camry'),
  ];

  List<Vehicle> bikes = [
    Vehicle(name: 'Honda Activa 6G'),
    Vehicle(name: 'TVS Jupiter'),
    Vehicle(name: 'Hero Pleasure Plus'),
    Vehicle(name: 'Suzuki Access 125'),
    Vehicle(name: 'Yamaha Fascino 125'),
  ];

  List<Vehicle> scooters = [
    Vehicle(name: 'Ather 450X'),
    Vehicle(name: 'Ola S1'),
    Vehicle(name: 'Bajaj Chetak'),
    Vehicle(name: 'Hero Electric Optima HX'),
    Vehicle(name: 'Revolt RV400'),
  ];

  List<Vehicle> filteredVehicles = []; // List to store filtered vehicles
  int _selectedCategoryIndex = 0; // Index of the selected category

  @override
  void initState() {
    super.initState();
    // Initially show Cars
    filterVehiclesByCategory(0);
  }

  // Method to filter vehicles based on category index
  void filterVehiclesByCategory(int categoryIndex) {
    setState(() {
      _selectedCategoryIndex = categoryIndex;
      // Clear previous filtered list
      filteredVehicles.clear();
      // Filter vehicles based on category index
      if (categoryIndex == 0) {
        filteredVehicles.addAll(cars);
      } else if (categoryIndex == 1) {
        filteredVehicles.addAll(bikes);
      } else if (categoryIndex == 2) {
        filteredVehicles.addAll(scooters);
      }
    });
  }

  // Method to add a new vehicle to the selected category
  void addNewVehicle(String name) {
    setState(() {
      if (_selectedCategoryIndex == 0) {
        cars.add(Vehicle(name: name));
      } else if (_selectedCategoryIndex == 1) {
        bikes.add(Vehicle(name: name));
      } else if (_selectedCategoryIndex == 2) {
        scooters.add(Vehicle(name: name));
      }
      filterVehiclesByCategory(_selectedCategoryIndex); // Refresh filtered list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Vehicle'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // ToggleButtons for vehicle categories
          ToggleButtons(
            isSelected: [
              _selectedCategoryIndex == 0,
              _selectedCategoryIndex == 1,
              _selectedCategoryIndex == 2,
            ],
            onPressed: (index) {
              filterVehiclesByCategory(index);
            },
            borderRadius: BorderRadius.circular(8.0),
            selectedColor: Colors.white,
            fillColor: Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColor,
            selectedBorderColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Cars'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Bikes'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Scooters'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredVehicles.length + 1, // +1 for the "Add New Vehicle" button
              itemBuilder: (context, index) {
                if (index == filteredVehicles.length) {
                  // Render "Add New Vehicle" button
                  return ListTile(
                    title: Text('Add New Vehicle'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddVehicleDialog(
                          onAddVehicle: addNewVehicle,
                        ),
                      );
                    },
                  );
                } else {
                  // Render vehicle list
                  final vehicle = filteredVehicles[index];
                  return ListTile(
                    title: Text(vehicle.name),
                    onTap: () {
                      Get.to(() => SearchPage());
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dialog for adding a new vehicle
class AddVehicleDialog extends StatelessWidget {
  final Function(String) onAddVehicle;
  final TextEditingController controller = TextEditingController();

  AddVehicleDialog({required this.onAddVehicle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Vehicle'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter vehicle name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String newName = controller.text.trim();
            if (newName.isNotEmpty) {
              onAddVehicle(newName);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class Vehicle {
  final String name;

  Vehicle({required this.name});
}
