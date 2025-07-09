import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ujian Akhir Semester PAPB (Semester 6)',
      home: MyHomePage(),
    );
  }
}

// Gambar
const String pecelHeader = 'asset/pecel1.jpg';
const String pecelMenu = 'asset/pecel2.jpg'; // Gambar menu pecel

// Warna
const Color textYellow = Color(0xFFF6c24d);
const Color iconYellow = Color(0xFFF4bf47);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyAppbar(),
      body: ListView(
        children: const [
          FoodListview(),
          SizedBox(height: 16.0), // Jarak antara header dan kategori menu
          SelectTypeSection(),
          SizedBox(height: 16.0), // Jarak antara kategori menu dan daftar menu
          MenuItemslist(),
        ],
      ),
    );
  }
}

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Column(
                children: [
                  Icon(Icons.home),
                  Text('Home', style: TextStyle(fontSize: 12.0)),
                ],
              ),
              SizedBox(width: 100.0),
              Column(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.black45),
                  Text('Keranjang', style: TextStyle(fontSize: 12.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyActionButton extends StatelessWidget {
  const MyActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: ClipPath(
        clipper: HexagonClipper(),
        child: Container(
          color: iconYellow,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.book),
              SizedBox(height: 4.0),
              Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom hexagon clipper
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    return Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w * 0.5, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MenuItemslist extends StatelessWidget {
  const MenuItemslist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menu Pilihan',
            style: TextStyle(fontSize: 20.0, color: Colors.black54),
          ),
          SizedBox(height: 16.0),
          MenuItem(),
          MenuItem(),
          MenuItem(),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.0,
            width: 100.0,
            child: Image.network(pecelMenu, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: iconYellow,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: [Icon(Icons.star, size: 15.0), Text('4.5')],
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Pecel Sambel Tumpang',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 200.0,
                  child: Text(
                    'Pecel, Sambel Tumpang, Telur Bali, Sate Usus, ...',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTypeSection extends StatelessWidget {
  const SelectTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Menu Special
            Container(
              height: 92.0,
              width: 124.0,
              color: Colors.lightGreen[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.bowlRice, color: Colors.green[300]),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Menu Special',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            // Menu Terlaris
            Container(
              height: 92.0,
              width: 124.0,
              color: const Color.fromARGB(255, 245, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.spoon, color: Colors.orange[200]),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Menu Terlaris',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            // Minuman
            Container(
              height: 92.0,
              width: 124.0,
              color: Colors.blue[700],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.mugHot, color: Colors.blue[200]),
                  const SizedBox(height: 4.0),
                  const Text(
                    'Minuman',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodListview extends StatelessWidget {
  const FoodListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 170.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [ItemCard(), ItemCard(), ItemCard()],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 160.0,
        width: 300.0,
        decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage(pecelHeader), // ✅ benar
    fit: BoxFit.cover,
  ),
),

        child: Stack(
          children: [
            Container(
              height: 170.0,
              width: 300.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.1), Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Spacer(),
                  Text(
                    'Promo 20%',
                    style: TextStyle(
                      color: textYellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Text(
                    'Untuk 10 Pembeli Pertama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
