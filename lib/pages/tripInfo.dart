import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/model/response/trip_get_res.dart';

class TripInfoPage extends StatefulWidget {
  int tripId = 0;
  TripInfoPage({super.key, required this.tripId});

  @override
  State<TripInfoPage> createState() => _TripInfoPageState();
}

class _TripInfoPageState extends State<TripInfoPage> {
  List<TripGetResponse> trips = [];
  late Future<void> loadData;

  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.tripId.toString());
    return Scaffold(
      appBar: AppBar(title: const Text('รายละเอียดทริป')),
      body: FutureBuilder(
          future: loadData,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                Image.network(trips.first.coverimage),
                Text(trips.first.name.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(trips.first.country),Text(trips.first.price.toString())],
                ),
                Text(trips.first.duration.toString()),
                Text(trips.first.detail)
              ],
            );
          }),
    );
  }

  Future<void> loadDataAsync() async {
    String url = 'https://cslab.it.msu.ac.th/tripbooking/trip/${widget.tripId}';
    var res = await http.get(Uri.parse(url));
    trips = tripGetResponseFromJson(res.body);
    log(res.body);
    // setState(() {});
    log(trips.length.toString());
  }
}
