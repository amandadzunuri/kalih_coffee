import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalih Menu',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DaftarMenu(),
    );
  }
}

class DaftarMenu extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Coffee', 'image': 'assets/images/coffee.png'},
    {'name': 'Non-Coffee', 'image': 'assets/images/non_caffee.png'},
    {'name': 'Noodle', 'image': 'assets/images/noodle.png'},
    {'name': 'Rice', 'image': 'assets/images/rice.png'},
    {'name': 'Snack', 'image': 'assets/images/snack.png'},
  ];

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Rice Bowl Chicken Sambal Matah',
      'price': 25000,
      'image': 'assets/images/rice_bowl.png'
    },
    {
      'name': 'Rice Bowl Chicken Sambal Matah',
      'price': 100000,
      'image': 'assets/images/rice_bowl.png'
    },
    {
      'name': 'Rice Bowl Chicken Sambal Matah',
      'price': 25000,
      'image': 'assets/images/rice_bowl.png'
    },
    {
      'name': 'Rice Bowl Chicken Sambal Matah',
      'price': 100000,
      'image': 'assets/images/rice_bowl.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3E5), // Background color changed
      body: Column(
        children: [
          // Green Background for Title
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF0E3822), // Changed green color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20), // Corner round bawah kiri
                bottomRight: Radius.circular(20), // Corner round bawah kanan
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16,
                          top: 20), // Tambahkan padding di sebelah kiri
                      child: Text(
                        'Selamat datang di Kalih!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16,
                          top: 20), // Tambahkan padding di sebelah kanan
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        child: Image.asset(
                          'assets/icon/ic_keranjang.png', // Ganti dengan path gambar Anda
                          width: 24, // Sesuaikan lebar gambar
                          height: 24, // Sesuaikan tinggi gambar
                          color: Colors.white, // Warna gambar
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  // Removed color property
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            16, 16, 2, 0), // Tambahkan padding kiri
                        child: GestureDetector(
                          onTap: () {
                            // Handle category tap
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                categories[index]['image']!,
                                width: 58,
                                height: 58,
                              ),
                              //SizedBox(height: 0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 0),
                                child: Text(
                                  categories[index]['name']!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => DetailPage(menuItems[index]),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Color(0xFFD6CDA4), // Background color
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.asset(
                            menuItems[index]['image']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8), // Margin bottom for image
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                menuItems[index]['name']!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height: 8), // Margin bottom for text name
                              Text(
                                'Rp ${menuItems[index]['price']}.00',
                                style: TextStyle(
                                    color: Colors
                                        .black), // Margin bottom for price
                              ),
                              SizedBox(
                                  height:
                                      8.0), // Add some space before the button
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle add to cart
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(
                                        0xFF0E3822), // Button background color changed
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(),
                                    ),
                                    fixedSize: Size(160, 0),
                                  ),
                                  child: Text(
                                    'Tambah +',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> menuItem;

  DetailPage(this.menuItem);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(menuItem['image']!, width: 100, height: 100),
            SizedBox(height: 16),
            Text(menuItem['name']!, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Rp ${menuItem['price']}.00'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Center(
        child: Text('Keranjang belanja Anda kosong.'),
      ),
    );
  }
}
