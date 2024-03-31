import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tripbooking/model/response/trip_get_res.dart';
import 'package:tripbooking/pages/login.dart';
import 'package:tripbooking/pages/tripInfo.dart';
import 'package:tripbooking/shared/appData.dart';

class ShowTrip extends StatefulWidget {
  const ShowTrip({super.key});

  @override
  State<ShowTrip> createState() => _ShowTripState();
}

class _ShowTripState extends State<ShowTrip> {
  List<TripGetResponse> trips = [];
  late Future<void> loadData;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
    log(context.read<AppData>().userName);
    log(context.read<AppData>().isAdmin.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('รายการทริป'),
          // automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text('User Profile'),
                const Text('Tock'),
                const Text('Thonkgoon166@gmail.com'),
                ListTile(
                  title: const Text('ออกจากระบบ'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder(
            future: loadData,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ปลายทาง'),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FilledButton(
                            onPressed: () async {
                              setState(() {
                                loadData = loadDataAsync();
                              });
                            },
                            child: const Text('ทั้งหมด'),
                          ),
                          FilledButton(
                            onPressed: () => getTripByDesid(1),
                            child: const Text('เอเชีย'),
                          ),
                          FilledButton(
                            onPressed: () => getTripByDesid(2),
                            child: const Text('ยุโรป'),
                          ),
                          FilledButton(
                            onPressed: () => getTripByDesid(3),
                            child: const Text('อาเซียน'),
                          ),
                          FilledButton(
                            onPressed: () => getTripByDesid(9),
                            child: const Text('ไทย'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // เพื่อให่ SingleChildScrollView ไม่ล้นจอ
                      child: SingleChildScrollView(
                        child: Column(
                          children: trips.map((trip) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // ปรับค่าตามความต้องการ
                                  side: const BorderSide(
                                    color:
                                        Colors.amber, // เปลี่ยนสีตามความต้องการ
                                    width: 1.0, // เปลี่ยนขนาดตามความต้องการ
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(trip.name.toString()),
                                      Row(
                                        children: [
                                          Image.network(
                                            trip.coverimage.toString(),
                                            width: 150,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('ประเทศ${trip.country}'),
                                                Text(
                                                    'ระยะเวลา ${trip.duration} วัน'),
                                                Text('ราคา ${trip.price} บาท'),
                                                FilledButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              TripInfoPage(
                                                                  tripId:
                                                                      trip.idx),
                                                        ),
                                                      );
                                                    },
                                                    child: const Text(
                                                        'รายละเอียดเพิ่มเติม'))
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  void getTripByDesid(int decorationID) async {
    String url = 'https://cslab.it.msu.ac.th/tripbooking/trip';
    var res = await http.get(Uri.parse(url));
    trips = tripGetResponseFromJson(res.body);
    setState(() {
      trips = trips
          .where((element) => element.destinationid == decorationID)
          .toList();
    });
  }

// Async method
  Future<void> loadDataAsync() async {
    String url = 'https://cslab.it.msu.ac.th/tripbooking/trip';
    var res = await http.get(Uri.parse(url));
    trips = tripGetResponseFromJson(res.body);
    // setState(() {});
    log(trips.length.toString());
  }
}
