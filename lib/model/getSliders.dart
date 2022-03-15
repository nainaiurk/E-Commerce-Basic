// To parse this JSON data, do
//
//     final getAllSlidersList = getAllSlidersListFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<GetAllSlidersList> getAllSlidersListFromJson(String str) => List<GetAllSlidersList>.from(json.decode(str).map((x) => GetAllSlidersList.fromJson(x)));

String getAllSlidersListToJson(List<GetAllSlidersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllSlidersList {
    GetAllSlidersList({
        required this.id,
        required this.sliderImage,
        required this.status,
    });

    int id;
    String sliderImage;
    String status;

    factory GetAllSlidersList.fromJson(Map<String, dynamic> json) => GetAllSlidersList(
        id: json["id"],
        sliderImage: json["slider_image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image": sliderImage,
        "status": status,
    };
}
