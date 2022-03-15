// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
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
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 20,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      6,
                      (index) => Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.yellow[100]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text('Add to cart    '),
                                    Icon(Icons.shopping_cart)
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )),
              ),
              SizedBox(height:20),
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
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                    6,
                    (index) => Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.yellow[100]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              onPressed: () {},
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
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
