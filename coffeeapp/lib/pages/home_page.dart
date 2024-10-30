import 'package:coffeeapp/util/coffee_title.dart';
import 'package:coffeeapp/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  //user tapped on
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; 1 < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(children: [
        //find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text("Find the best coffee for you",
              style: GoogleFonts.bebasNeue(fontSize: 56)),
        ),
        SizedBox(
          height: 25,
        ),
        //search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee..',
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600)),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        //horizontal listview
        Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                    coffeeType: coffeeType[index][0],
                    isSelected: coffeeType[index][1],
                    onTap: () {
                      coffeeTypeSelected(index);
                    },
                  );
                })),
        Expanded(
            child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CoffeeTitle(
              coffeeImagePath: 'images/latte.png',
              coffeename: 'Latte',
              coffeeprice: '4.20',
            ),
            CoffeeTitle(
              coffeeImagePath: 'images/coffee.png',
              coffeename: 'Cappucino',
              coffeeprice: '5.60',
            ),
            CoffeeTitle(
              coffeeImagePath: 'images/milk.png',
              coffeename: 'White Coffee',
              coffeeprice: '4.90',
            ),
          ],
        ))
      ]),
    );
  }
}