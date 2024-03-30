import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tripbooking/model/response/trip_get_res.dart';

class ShowTrip extends StatefulWidget {
  const ShowTrip({super.key});

  @override
  State<ShowTrip> createState() => _ShowTripState();
}

class _ShowTripState extends State<ShowTrip> {
  List<TripGetResponse> trips = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายการทริป'),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () async {
              String url = 'https://cslab.it.msu.ac.th/tripbooking/trip';
              var res = await http.get(Uri.parse(url));
              trips = tripGetResponseFromJson(res.body);
              log(trips.length.toString());
              setState(() {
                
              });
            },
            child: const Text('แสดงข้อมูล'),
          ),
          Expanded( // เพื่อให่ SingleChildScrollView ไม่ล้นจอ
            child: SingleChildScrollView(
              child: Column(
                children: trips.map((trip) {
                  return Text(trip.name.toString());
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
