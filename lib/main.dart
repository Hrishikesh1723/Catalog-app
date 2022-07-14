// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(shopping());
}

class shopping extends StatelessWidget {
  const shopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AU Shopping",
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Future<Map> getData()async{
    var data = await http.get(Uri.parse("https://fakestoreapi.com/products/1"));
    return jsonDecode(data.body);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color:  Color.fromARGB(255, 227, 16, 150),
          
        ),
        child: Icon(Icons.person),
      ),
      ListTile(
        title: const Text('Your Orders',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
          
        },
      ),
      ListTile(
        title: const Text('Buy Again',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Your Account',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Wish list',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Cart',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Manage Cart',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Update Address',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Manage Accont',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Delete Account',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('About',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Help',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
      ListTile(
        title: const Text('Exit',style: TextStyle(
          color: Color.fromARGB(255, 37, 143, 230),
        )),
        onTap: () {
        },
      ),
    ],
  ),
),
      appBar: AppBar(
        centerTitle: true,
        title: Text("AU shopping", style: TextStyle(
          fontFamily: "RobotoMono",
          fontSize: 30,
          color:  Color.fromARGB(255, 227, 16, 150),
        ),),
        actions: [Icon(Icons.search)],
      ),
      bottomNavigationBar: BottomNavigationBar( 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          
        ],
      
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Map>(
      
      future: getData(),
      builder : (BuildContext context,AsyncSnapshot state) {
        if(state.hasData){
          return Column(
             
          children: [
             Row(
               
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              ]
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), ),
              Product(
              image: state.data!["image"],
              title: state.data!["title"],
              price: state.data!["price"].toString(), )
              ]
            ),
          ],

          
          );
          
          
        }else{
          return const CircularProgressIndicator();
        }
      }
      
      

      
      ),
  
    ),
    );
  }
}

class Product extends StatelessWidget {
  Product({required this.image,required this.title,required this.price});
  final  String image;
  final  String title;
  final  String price;


  @override
  Widget build(BuildContext context) {
    return Container(
                height: 300,
                width: 250,
                child: Card(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.add,color: Color.fromARGB(255, 227, 16, 150),),
                          Icon(Icons.favorite_border,color: Color.fromARGB(255, 227, 16, 150),),
                        ],
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        child: Image(image: NetworkImage(image)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(title, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 37, 143, 230),

                      ),
                      textAlign: TextAlign.center,),
                      
                      SizedBox(
                        height: 10,
                      ),
                      Text(price, style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color:  Color.fromARGB(255, 227, 16, 150),

                      ),
                      textAlign: TextAlign.center,),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor: MaterialStateProperty.all<Color>( Color.fromARGB(255, 227, 16, 150)),
                        ),
                        onPressed: () { },
                        child: Text('Add to cart'),)


                    ],
                  ),
                ),
             );
  }
}