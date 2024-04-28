
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/constants/colorspicker.dart';
import 'package:mealsapp/functions/databaseFunctions.dart';
import 'package:mealsapp/provider/controllerprovider.dart';
import 'package:provider/provider.dart';

class AddressPicker extends StatefulWidget {
  const AddressPicker({super.key});

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController titlecontroller = TextEditingController();
  final List<String> address = [];
  final List<String> Title = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: secondarycolor,
          context: context,
          builder: (context) {
            return Consumer<controllerProvider>(
              builder: (context, value, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'PICK YOUR ADDRESS',
                    style: TextStyle(
                        fontSize: 20,
                        color: textcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                      itemCount: address.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(Title[index]),
                          subtitle: Text(address[index]),
                          trailing: IconButton(onPressed: (){
                            setState(() {
                              address.removeAt(index);
                              Title.removeAt(index);
                            });
                          }, icon: const Icon(Icons.delete)),
                        );
                      }),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextField(
                                        controller: titlecontroller,
                                        decoration: const InputDecoration(
                                            hintText: 'Title'),
                                      ),
                                      TextField(
                                        controller: addresscontroller,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your new Address',
                                        ),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            print('Function Started');

                                            if (addresscontroller
                                                .text.isNotEmpty) {
                                              setState(() {
                                                address.add(
                                                    addresscontroller.text);
                                                    Title.add(titlecontroller.text);
                                                print(
                                                    'items aded successfully');
                                                update(
                                                    'Users',
                                                    value.usernamecontroller,
                                                    'address',
                                                    addresscontroller);
                                                print('DAtabase Updated');
                                                addresscontroller.clear();
                                                titlecontroller.clear();
                                                print('textcleared');
                                                Navigator.pop(context);
                                              });
                                            }
                                          },
                                          child: const Text('Save'))
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            size: 40,
            color: textcolor,
          ),
          Text(
            Title.toString(),
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: primarycolor,
          ),
        ],
      ),
    );
  }
}
