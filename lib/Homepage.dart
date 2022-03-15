// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unused_field


import 'package:e_commerce/assistant/controller.dart';
import 'package:e_commerce/assistant/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double displayHeight = MediaQuery.of(context).size.height;
  late double displayWidth = MediaQuery.of(context).size.height;
  String userName= '';
  final _controller = Get.put(Controller());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userName),),
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    foregroundImage: NetworkImage('https://scontent.fdac24-1.fna.fbcdn.net/v/t39.30808-1/p240x240/265195615_1621197978225860_7242594645775801046_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeHxuK_FrGVjGCqudOm4a8-1eBrzXW6ZZw94GvNdbplnDzjuJjjwF6eHK_S5IUxeFH2Gl6vS8TpHvhA19_6MMFk4&_nc_ohc=9h-97NWfymQAX_wa2tP&_nc_ht=scontent.fdac24-1.fna&oh=00_AT8arBtr9cs7xTw06P41hPFKzGVOnkylku40r6EPeuz6Pw&oe=61DA0F99'),
                    radius: 50,
                  ),
                  Text(
                    'WELCOME',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Divider(),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.person),
                title: Text('My Profile'),
                subtitle: Text("Edit your profile"),
              ),
              Divider(),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                subtitle: Text("Go to Homepage"),
              ),
              Divider(),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                subtitle: Text("Edit your settings"),
              ),
              Divider(),
              ListTile(
                onTap: (){},
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                subtitle: Text("Sign In to another account"),
              ),
            ],
          )
          
        )
      ),
      body: Center(
        child: Text('WELCOME'),
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
}