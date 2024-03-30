// To parse this JSON data, do
//
//     final tripGetResponse = tripGetResponseFromJson(jsonString);

import 'dart:convert';

List<TripGetResponse> tripGetResponseFromJson(String str) => List<TripGetResponse>.from(json.decode(str).map((x) => TripGetResponse.fromJson(x)));

String tripGetResponseToJson(List<TripGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TripGetResponse {
    int idx;
    dynamic name;
    dynamic country;
    int destinationid;
    String coverimage;
    String detail;
    int price;
    int duration;

    TripGetResponse({
        required this.idx,
        required this.name,
        required this.country,
        required this.destinationid,
        required this.coverimage,
        required this.detail,
        required this.price,
        required this.duration,
    });

    TripGetResponse copyWith({
        int? idx,
        dynamic name,
        dynamic country,
        int? destinationid,
        String? coverimage,
        String? detail,
        int? price,
        int? duration,
    }) => 
        TripGetResponse(
            idx: idx ?? this.idx,
            name: name ?? this.name,
            country: country ?? this.country,
            destinationid: destinationid ?? this.destinationid,
            coverimage: coverimage ?? this.coverimage,
            detail: detail ?? this.detail,
            price: price ?? this.price,
            duration: duration ?? this.duration,
        );

    factory TripGetResponse.fromJson(Map<String, dynamic> json) => TripGetResponse(
        idx: json["idx"],
        name: json["name"],
        country: json["country"],
        destinationid: json["destinationid"],
        coverimage: json["coverimage"],
        detail: json["detail"],
        price: json["price"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "idx": idx,
        "name": name,
        "country": country,
        "destinationid": destinationid,
        "coverimage": coverimage,
        "detail": detail,
        "price": price,
        "duration": duration,
    };
}
