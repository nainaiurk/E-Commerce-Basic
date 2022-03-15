// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:e_commerce/assistant/controller.dart';
import 'package:e_commerce/database/db_helper.dart';
import 'package:e_commerce/database/db_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int amount = 1;
  final dbHelper = DatabaseHelper.instance;
  final Controller _controller = Get.put(Controller());
  var dbjson = [];
  int totalAmount = 0;
  int _counter = 1;
  @override
  void initState() {
    getTotal();
    _Dataquery();
    _controller.dataCartList();

  }
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: (){
              dbHelper.deleteall();
              _Dataquery();
              setState(() {});
            }, 
            child: Text(
              'Clear',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          )
        ],
      ),
      body: Obx((){
        if (_controller.dataCartList.length == 0) {
          return Center(
            child: Text(" No Data Please Add New Item"),
          );
        }
        else{
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _controller.dataCartList.length,
                  itemBuilder: (context, index) =>
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.17,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: Image(
                              image: NetworkImage(_controller.dataCartList[index].pImg),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _controller.dataCartList[index].pName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 17,),
                              Text(
                                'Quantity: '+_controller.dataCartList[index].pQuantity.toString(),
                                style: TextStyle(color: Colors.black54),
                              ),
                              SizedBox(height: 17,),
                              Text(
                               '৳ ' +
                                (double.parse(_controller.dataCartList[index].productPrice.toString()) *
                                    _controller.dataCartList[index].pQuantity).toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: (){
                                  _controller.dataCartList[index].pQuantity++;
                                  insertUpdate(index);
                                },
                                child: Text(
                                  '+',style: 
                                  TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: 17,),
                              Container(
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.red)
                                ),
                                padding: EdgeInsets.only(left: 10,right: 10),
                                child: Text(_controller.dataCartList[index].pQuantity.toString())
                              ),
                              SizedBox(height: 17,),
                              TextButton(
                                onPressed: (){
                                    _controller.dataCartList[index].pQuantity>1? _controller.dataCartList[index].pQuantity--:1;
                                  insertUpdate(index);
                                },
                                child: Text(
                                  '-',
                                  style: 
                                    TextStyle(
                                      fontSize: 30,
                                      color: Colors.black
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 30,
                    color: Colors.blue.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total Product = 6',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Total Price = \$1000.00',
                          style: TextStyle(
                            fontSize: 15,
                          ),  
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){},
                    color: Colors.blue,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Confirm Payment',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }
      })
    );
  }

  getTotal(){
    totalAmount = 0;
    for(var i =0; i<_controller.dataCartList.length; i++){
      totalAmount += _controller.dataCartList[i].productPrice * 
                    _controller.dataCartList[i].productQuantity;
    }
    return totalAmount;
  }

  Future _Dataquery() async{
    _controller.dataCartList.clear();
    dbHelper.queryAllRows().then((notes){
      notes.forEach((note) { 
        _controller.dataCartList.add(Model.fromMapObject(note));
      });
    });
  }

  void insertUpdate(index) async{
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