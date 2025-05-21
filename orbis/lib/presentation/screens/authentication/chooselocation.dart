import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:orbis/domain/busineslogic/map/map_cubit.dart';
import 'package:orbis/domain/busineslogic/map/map_state.dart';
import 'package:orbis/presentation/widgets/custombottn.dart';
import 'package:orbis/utils/constant/Responsive.dart';
import 'package:orbis/utils/helper/color.dart';

class Chooselocation extends StatelessWidget {
  const Chooselocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder:
          (context, state) => Scaffold(
            body:
                (state is MapLoading)
                    ? Center(child: CircularProgressIndicator())
                    : (state is MapLoaded)
                    ? Stack(
                      children: [
                        FlutterMap(
                          mapController: context.read<MapCubit>().mapController,
                          options: MapOptions(
                            initialCenter: LatLng(
                              state.currentLocation!.latitude!,
                              state.currentLocation!.longitude!,
                            ),
                            initialZoom: 15,
                            onTap: (tapPosition, point) {
                              context.read<MapCubit>().addDestinationMarker(
                                point,
                              );
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      content: SizedBox(
                                        height:
                                            Responsive(context).hight * 0.15,
                                        child: Column(
                                          spacing: 10,
                                          children: [
                                            Text(
                                              "Confirm location?",
                                              style: TextStyle(
                                                color: AppColor().black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 24,
                                                fontFamily: "MPLUSRounded1c",
                                              ),
                                            ),
                                            Text(
                                              "Are you sure this is your address?",
                                            ),
                                            Text(
                                              context.read<MapCubit>().address,
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Custombottn(
                                          onTap: () {
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              "/singinScreen",
                                              (route) => false,
                                            );
                                          },
                                          height: 50,
                                          text: "Sure",
                                          boxcolor: AppColor().baiscblue2,
                                        ),
                                        Custombottn(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          height: 54,
                                          text: "No, thankyou",

                                          boxcolor: AppColor().baiscblue2,
                                        ),
                                      ],
                                      backgroundColor: AppColor().white,
                                    ),
                              );
                            }, 
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c'],
                            ),
                            MarkerLayer(markers: state.markers),
                            PolygonLayer(
                              polygons: [Polygon(points: state.routePoints)],
                            ),
                          ],
                        ),
                      ],
                    )
                    : (state is MapError)
                    ? Center(child: Text(state.message))
                    : const Center(child: Text('Unknown state')),

            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    // color: AppColor().white,
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      // controller: search,
                      onSubmitted: (value) {
                        context.read<MapCubit>().searchLocation(value);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor().babyblue,
                        prefixIcon: Icon(Icons.search),
                        hintText: "search",
                        hintStyle: TextStyle(fontFamily: "MPLUSRounded1c"),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor().blackblue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: AppColor().babyblue,
                  child: Icon(Icons.my_location, color: AppColor().black),
                  onPressed: () async {
                    if (context.read<MapCubit>().currentLocation != null) {
                      // await context.read<MapCubit>().nameLocation(
                      //   context.read<MapCubit>().currentLocation!.latitude!,
                      //   context.read<MapCubit>().currentLocation!.longitude!,
                      // );
                      context.read<MapCubit>().movetomylocation();
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }
}
 