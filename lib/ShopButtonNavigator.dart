import 'package:flutter/material.dart';

class ShopBottonNavigator extends StatelessWidget {
  const ShopBottonNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //color: Colors.amber,
      color: Colors.blue,
      //height: 200,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      notchMargin: 7.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        //width: 120,
        height: 60,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2 -20,
                //color: Colors.deepOrangeAccent,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.home , color: Colors.white),
                      Icon(Icons.person_2_outlined, color: Colors.white),
                    ],
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width / 2 -20,
                //color: Colors.deepOrange,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.white),
                      Icon(Icons.shopping_bag, color: Colors.white),
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
