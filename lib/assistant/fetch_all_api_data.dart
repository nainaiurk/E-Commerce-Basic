// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:e_commerce/model/AllUser.dart';
import 'package:e_commerce/model/getCategory.dart';
import 'package:e_commerce/model/getOrderSummary.dart';
import 'package:e_commerce/model/getOrders.dart';
import 'package:e_commerce/model/getProduct.dart';
import 'package:e_commerce/model/getSliders.dart';
import 'package:http/http.dart' as http;
class FetchAllApiData{

  // final clientObject = http.Client;

  static Future<List<GetAllCategoryList>?> fetchGetAllCategoryList() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallcategory");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData);
      return getAllCategoryListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllProductList>?> fetchGetAllProductData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallproductdata");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData.toString()+'2');
      return getAllProductListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllSlidersList>?> fetchGetAllSlider() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallsliders");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);

      return getAllSlidersListFromJson(convertData);
    }
    return null;
  }

  static Future<List<AllUserList>?> fetchAllUserData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/allUserList");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);

      return allUserListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetOrders>?> fetchGetOrderList() async {
    var url = Uri.parse("https://happybuy.appsticit.com/orders");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);

      print(convertData);

      return getOrdersFromJson(convertData);
    }
    return null;
  }

  static Future<GetOrderSummary?> fetchGetOrderSummary() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getordersummary");
    var heroResponse = await http.get(url, headers: {"Content-Type": "application/json"});

    if(heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode);

      return getOrderSummaryFromJson(convertData);
    }
    return null;
  }
}