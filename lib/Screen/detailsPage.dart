// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:e_commerce/model/getProduct.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key,required this.getAllProductList}) : super(key: key);
  final GetAllProductList getAllProductList;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.getAllProductList.name,style:TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.add_shopping_cart,color: Colors.black,)
            )
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height*0.5,
        minHeight: 50,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0)
        ),
        panel: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                Icon(Icons.linear_scale_sharp,size: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(6, (index) => 
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.yellow[100]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                          children: [
                            Center(
                              child: Image(
                                image: NetworkImage(
                                  'https://50.cdn.ekm.net/ekmps/shops/podcmedia/images/height-adjustable-beechwood-rectangle-table-yellow-116632-p.jpg?w=400&h=400&v=1',
                                ),
                                height: 100,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Table',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$100',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            TextButton(
                              onPressed: (){}, 
                              child: Row(
                                children: [
                                  Text('Add to cart    '),
                                  Icon(Icons.shopping_cart)
                                ],
                              )
                            )
                          ],
                        ),
                      ),)
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(
                'https://happybuy.appsticit.com'+
                widget.getAllProductList.img1
              ),
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height*0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 200,),
                  Text(
                    widget.getAllProductList.name,
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:20),
                  Text(widget.getAllProductList.description)
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
