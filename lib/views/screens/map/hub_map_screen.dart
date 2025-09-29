import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controller/neighbor/neighbor_controller.dart';
import '../../../../core/app_constants/app_colors.dart';
import '../../widgets/custom_text.dart';

class HubMapScreen extends StatefulWidget {
  const HubMapScreen({super.key});

  @override
  State<HubMapScreen> createState() => _HubMapScreenState();
}

class _HubMapScreenState extends State<HubMapScreen> {
  final NeighborController neighborController = Get.find<NeighborController>();

  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
   var data = Get.arguments;
    neighborController.getMap(hubId: data["hubId"]); // call your API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 5,
        shadowColor: Colors.black,
        title: CustomText(text: "Member Tracking", fontSize: 18),
      ),
      body: Obx(() {
        if (neighborController.mapLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (neighborController.map.isEmpty) {
          return const Center(child: Text("No members found"));
        }

        /// Default center (fallback if no member has location)
        LatLng defaultCenter = const LatLng(23.790934543802027, 90.4139501156808);

        final firstWithLocation = neighborController.map.firstWhereOrNull(
              (member) => member.location != null &&
              member.location?.lat != null &&
              member.location?.lng != null,
        );

        if (firstWithLocation != null) {
          defaultCenter = LatLng(
            firstWithLocation.location!.lat!,
            firstWithLocation.location!.lng!,
          );
        }


        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: defaultCenter,
            zoom: 13,
          ),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          markers: neighborController.map
              .where((member) =>
          member.location != null)
              .map((member) {
            final parts = member.location!.coordinates!;

            if (parts.length != 2) {
              return const Marker(markerId: MarkerId("invalid"));
            }

            final lat = double.tryParse(parts[0].toString());
            final lng = double.tryParse(parts[1].toString());

            if (lat == null || lng == null) {
              return const Marker(markerId: MarkerId("invalid"));
            }

            return Marker(
              markerId: MarkerId(member.id ?? member.name ?? "unknown"),
              position: LatLng(lat, lng),
              infoWindow: InfoWindow(
                title: member.name ?? "Unknown Member",
                snippet: "Member location",
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen,
              ),
            );
          }).toSet(),
        );

      }),
    );
  }
}
