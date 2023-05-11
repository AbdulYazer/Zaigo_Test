import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaigo_test/core/constants.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController _controller;
  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(9.6982124, 76.7583488),zoom: 15);
  int _value = 0;
  String addressId = '';
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.amber[200],
            child: GoogleMap(
              onMapCreated: (controller){
                setState(() {
                  _controller = controller;
                });
              } ,
              mapType: MapType.normal,
              initialCameraPosition: _defaultLocation,
            ),
          ),
        ],
    );
  }
}

  class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: SvgPicture.asset(
              "assets/icons/location.svg",
              height: 16,
              width: 16,
            ),
          ),
        ),
        title: const Text(
          "Set Delivery Location",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.black),
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {},
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Search your location",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      "assets/icons/location_pin.svg",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/location.svg",
                height: 16,
              ),
              label: const Text("Use my Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: mainClr,
                foregroundColor: Colors.black,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey[300],
          ),
          MapsScreen(),
          // LocationListTile(
          //   press: () {},
          //   location: "Banasree, Dhaka, Bangladesh",
          // ),
        ],
      ),
    );
  }
}


