import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:my_project/ShopButtonNavigator.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/product.dart';



void main() => runApp(const Store());

class Store extends StatefulWidget {
  const Store({super.key});
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<Product> _items=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchItems();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "آکادمی متیسما",
            style: TextStyle(color: Colors.white, fontFamily: "BZarBd"),
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => print("Pressed"),
              icon: const Icon(Icons.maps_ugc),
              color: Colors.white,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(_items.length, (int position){
              return generateItem(_items[position]);
            }),
          ),
        ),
        bottomNavigationBar: const ShopBottonNavigator(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void fetchItems() async {
    //var url = "https://welearn.site/flutter/products_list.json";
    //var response = await get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    //http.Response response = await http.get(Uri.parse("welearn.site","/flutter/products_list.json"));
    //var response = await http.get(Uri.parse('https://welearn.site/flutter/products_list.json'));


    /////ok hast
    // String uri = 'https://firebasestorage.googleapis.com/v0/b/ecosolutions-73ab2.appspot.com/o/sensores.json';
    // http.Response  response = await http.get(Uri.parse(uri));
    // print(response.body);

    /////ok hast
    // http.Response response= await http.get(Uri.parse('https://firebasestorage.googleapis.com/v0/b/ecosolutions-73ab2.appspot.com/o/sensores.json'));
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   // File successfully fetched
    //   print(response.body);
    // } else {
    //   // Failed to fetch file
    //   throw Exception('Failed to fetch file');
    // }
    // }



    // String actualUrl = 'https://firebasestorage.googleapis.com/v0/b/ecosolutions-73ab2.appspot.com/o/sensores.json';
    // final finalUrl = Uri.parse(actualUrl);
    // final response = await http.get(finalUrl);
    // print(response.body);


    //ok load asset file in local space
    String data = await  DefaultAssetBundle.of(context).loadString('/products_list.json');
    final jsonResult = json.decode(data);
    print(jsonResult);
    setState(() {
      for (var i in jsonResult){
        var product_item=Product(i['product_name'], i['id'], i['price'],i['image_url'] , i['off'], i['description']);
        _items.add(product_item);
      }

    });

  }

    // final httpPackageUrl = Uri.https('github.com', '/masoudkh8/digital_products/blob/master/subscriptions/serializers.py');
    // final httpPackageResponse = await http.get(httpPackageUrl);
    // if (httpPackageResponse.statusCode != 200) {
    //   print('Failed to retrieve the http package!');
    //   return;
    // }
    // print(httpPackageResponse.body);
  }


Card generateItem(Product product){
  return Card(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 5,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            height: 100,

            child: Image.network(product.imageUrl) //Image.asset("assets/big logo.jpg")
          ), Text(
            product.price,
            style: TextStyle(
              fontFamily: "BZarBd",
              fontSize: 16.0,
              color: Colors.red,
            ),
          ), Text(
            product.productName,
            style: TextStyle(
              fontFamily: "BZarBd",
              fontSize: 14.0,
              color: Colors.black,
            ),
          ),
        ],
      ),),
  );
}