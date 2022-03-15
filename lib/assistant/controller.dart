// ignore_for_file: avoid_print
import 'package:e_commerce/assistant/fetch_all_api_data.dart';
import 'package:e_commerce/database/db_model.dart';
import 'package:e_commerce/model/AllUser.dart';
import 'package:e_commerce/model/getCategory.dart';
import 'package:e_commerce/model/getOrderSummary.dart';
import 'package:e_commerce/model/getOrders.dart';
import 'package:e_commerce/model/getProduct.dart';
import 'package:e_commerce/model/getSliders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {

  var loadingCategoryList = true.obs;
  var loadingUserList  = true.obs;
  var loadingGetOrderList = true.obs;
  var loadingGetOrderSummaryList = true.obs;
  var loadingProductList = true.obs;
  var loadingSliderList = true.obs;
  
  var dataCartList = <Model>[].obs;
  var dataCategoryList = List<GetAllCategoryList>.empty().obs;
  var dataUserList = List<AllUserList>.empty().obs;
  var dataGetOrderList = List<GetOrders>.empty().obs;
  var dataGetOrderSummaryList = List<GetOrderSummary>.empty().obs;
  var dataProductList = List<GetAllProductList>.empty().obs;
  var dataSliderList = List<GetAllSlidersList>.empty().obs;

  void init(BuildContext context){
    getAllCategoryList();
    getAllUserList();
    getOrderList();
    getOrderList();
    getOrderSummaryList();
    getSliderList();
  }

  getAllCategoryList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchGetAllCategoryList();

      if(data != null){
        print(' Error ' + data.toList.toString());
        dataCategoryList.value = data;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingCategoryList(false).obs;
    }
  }
  getAllUserList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchAllUserData();

      if(data != null){
        dataUserList = data.obs;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingUserList(false).obs;
    }
  }
  getOrderList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchGetOrderList();

      if(data != null){
        dataGetOrderList = data as RxList<GetOrders> ;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingGetOrderList(false).obs;
    }
  }
  getOrderSummaryList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchGetOrderSummary();

      if(data != null){
        dataGetOrderSummaryList = data.obs as RxList<GetOrderSummary>;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingGetOrderSummaryList(false).obs;
    }
  }
  getProductList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchGetAllProductData();
      print('1');

      if(data != null){
        dataProductList.value = data;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingProductList(false).obs;
    }
  }
  getSliderList() async{
    try{
      loadingCategoryList(true).obs;
      var data = await FetchAllApiData.fetchGetAllSlider();

      if(data != null){
        dataSliderList.value = data;
      }
    }
    catch(e){
      print(e);
    }
    finally{
      loadingSliderList(false).obs;
    }
  }

}