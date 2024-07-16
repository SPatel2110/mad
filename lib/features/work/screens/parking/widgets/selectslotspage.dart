import 'package:UrbanPark/features/work/screens/parking/widgets/selectvehiclepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/orderdetailpage.dart'; // Import OrderDetailsPage
import 'package:UrbanPark/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:UrbanPark/utils/constants/sizes.dart';
import 'package:UrbanPark/common/widgets/text/section_heading.dart';

class SelectSlotPage extends StatefulWidget {
  final List<String>? availableSlots;
  final List<String> bookedSlots;

  SelectSlotPage({this.availableSlots, required this.bookedSlots, required String selectedVehicle, required String destinationName});

  @override
  _SelectSlotPageState createState() => _SelectSlotPageState();
}

class _SelectSlotPageState extends State<SelectSlotPage> {
  late List<String> bookedSlots;
  String? selectedSlot;

  @override
  void initState() {
    super.initState();
    bookedSlots = widget.bookedSlots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Select Slot'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'SELECT PARKING SLOT',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Available Slots',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of boxes per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.availableSlots?.length ?? 0,
                    itemBuilder: (context, index) {
                      final slot = widget.availableSlots?[index];
                      final isBooked = bookedSlots.contains(slot);
                      final isSelected = selectedSlot == slot;

                      return GestureDetector(
                        onTap: isBooked ? null : () {
                          setState(() {
                            selectedSlot = slot;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isBooked ? Colors.redAccent : (isSelected ? Colors.blue : Colors.white),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              slot!,
                              style: TextStyle(
                                color: isBooked ? Colors.white : (isSelected ? Colors.white : Colors.black),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ElevatedButton(
                    onPressed: selectedSlot == null || bookedSlots.contains(selectedSlot) ? null : () {
                      _handleSlotSelection(selectedSlot!, context);
                    },
                    child: Text('Continue'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSlotSelection(String slot, BuildContext context) async {
    // Navigate to OrderDetailsPage and pass selected slot information
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderDetailPage(selectedSlot: slot, vehicleName: '', destination: '', isCar: false,)),
    );

    // If payment was successful, mark the slot as booked
    if (result == true) {
      setState(() {
        bookedSlots.add(slot);
        selectedSlot = null;
      });
    }
  }
}
