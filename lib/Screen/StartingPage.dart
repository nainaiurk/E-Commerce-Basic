// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Screen/cart_screen.dart';
import 'package:e_commerce/Screen/detailsPage.dart';
import 'package:e_commerce/assistant/controller.dart';
import 'package:e_commerce/assistant/helper.dart';
import 'package:e_commerce/assistant/userInfo.dart';
import 'package:e_commerce/database/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {

  String userName= '';
  final _controller = Get.put(Controller());
  final dbHelper =  DatabaseHelper.instance;

  @override
  void initState() {
    // getSharedPreferenceData();
    // _controller.getOrderList();
    _controller.getAllCategoryList();
    _controller.getProductList();
    _controller.getSliderList();
  } 
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search products',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>CartScreen())
                      );
                    }, 
                    icon: Icon(Icons.sort)
                  )
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Obx((){
                  if(_controller.loadingSliderList.value){
                    return Center(
                      child: CircularProgressIndicator()
                    );
                  }
                  else{
                    return CarouselSlider.builder(
                      itemCount: _controller.dataSliderList.length,
                      itemBuilder: (context,index,pageViewIndex){
                        return CachedNetworkImage(
                          imageUrl: Helper.baseUrl+_controller.dataSliderList[index].sliderImage.toString(),
                          fit: BoxFit.cover,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 150,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: Duration(seconds: 2)
                      )
                    );
                  }
                }),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_right_alt,
                        size: 40,
                      ))
                ],
              ),
              SizedBox(height: 20,),
              Obx((){
                if(_controller.loadingCategoryList.value){
                  return CircularProgressIndicator();
                }
                else{
                  return Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _controller.dataCategoryList.length,
                      itemBuilder: ( context,index){
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height*0.2,
                              width: MediaQuery.of(context).size.width*.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[50]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Image(
                                        image: NetworkImage(
                                          'https://happybuy.appsticit.com'+
                                          _controller.dataCategoryList[index].categoryImage.toString()
                                        ),
                                        height: 50,
                                        width:50,
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      _controller.dataCategoryList[index].name.toString(),
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        );
                      }
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    'Most Popular',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_right_alt,
                      size: 40,
                    )
                  )
                ],
              ),
              SizedBox(height: 20,),
              Obx((){
                if(_controller.loadingProductList.value){
                  return CircularProgressIndicator();
                }
                else{
                  return  Expanded(
                // height: MediaQuery.of(context).size.height*0.4,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10
                        ),
                      itemCount: _controller.dataProductList.length,
                      itemBuilder: ( context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, 
                              MaterialPageRoute(builder: (contex)=>
                              DetailsPage(getAllProductList: _controller.dataProductList[index],))
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: MediaQuery.of(context).size.height*0.1,
                              width: MediaQuery.of(context).size.width*.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue[50]
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      'https://happybuy.appsticit.com'+
                                      _controller.dataProductList[index].img1.toString(),
                                    ),
                                    height: 100,
                                    width:100,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          _controller.dataProductList[index].name.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        _controller.dataProductList[index].sellingPrice+'\$',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  TextButton(
                                    onPressed: (){
                                      insertUpdate(index);
                                    }, 
                                    child: Row(
                                      children: [
                                        Text('Add to cart    '),
                                        Icon(Icons.shopping_cart)
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  void getSharedPreferenceData() async{
    UserInfo user = UserInfo();

    await user.getEmail().then((value){
      setState((){
        userName = value!;
      });
    });
  }

  void insertUpdate(index) async{
    print('add to cart');
    Map<String, dynamic> row = {
      DatabaseHelper.proid: _controller.dataProductList[index].id,
      DatabaseHelper.proName: _controller.dataProductList[index].name,
      DatabaseHelper.proQuantity: 1,
      DatabaseHelper.pImg: _controller.dataProductList[index].img1,
      DatabaseHelper.proPrice: _controller.dataProductList[index].price,
      DatabaseHelper.tPrice: _controller.dataProductList[index].price,
    };

    final checkPro = await dbHelper.checkProduct(_controller.dataProductList[index].id.toString());
    if(checkPro == null){
      final idupdate = await dbHelper.insert(row);
      print(idupdate.toString() + 'insert');
      setState(() {
        
      });
    }
    else{
      final updatedata =  await dbHelper.updateCartList(row, _controller.dataProductList[index].id);
      print(updatedata.toString() + 'update');
      setState(() {
        
      });
    }
  }
}
