import 'package:flutter/material.dart';
import 'package:flutter_coffee_ui/widgets/coffee_tile.dart';
import 'package:flutter_coffee_ui/widgets/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, bool> _coffeeTypes = {
    'Cappuccino': true,
    'Espresso': false,
    'Latte': false,
    'Mocha': false,
  };

  final List<CoffeeTile> _coffeeTiles = [
    CoffeeTile(
      coffeeImagePath: 'assets/coffee1.jpg',
      coffeeName: 'Cappuccino',
      coffeeDescription: 'Espresso, hot milk, and steamed-milk foam',
      coffeePrice: '4.99',
    ),
    CoffeeTile(
      coffeeImagePath: 'assets/coffee2.jpg',
      coffeeName: 'Espresso',
      coffeeDescription: 'Espresso, hot water',
      coffeePrice: '2.99',
    ),
    CoffeeTile(
      coffeeImagePath: 'assets/coffee3.jpg',
      coffeeName: 'Latte',
      coffeeDescription: 'Espresso and steamed milk',
      coffeePrice: '3.99',
    ),
  ];

  void _onSelectCoffeeType(
    String coffeeType,
  ) {
    setState(() {
      _coffeeTypes.updateAll((key, value) => false);
      _coffeeTypes[coffeeType] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Find your coffee...",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeTypes.length,
              itemBuilder: (context, index) {
                final String coffeeType = _coffeeTypes.keys.elementAt(index);
                final bool isSelected = _coffeeTypes[coffeeType]!;
                return CoffeeType(
                  coffeeType: coffeeType,
                  isSelected: isSelected,
                  onTap: () {
                    _onSelectCoffeeType(coffeeType);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeTiles.length,
              itemBuilder: (context, index) => _coffeeTiles[index],
            ),
          ),
        ],
      ),
    );
  }
}
