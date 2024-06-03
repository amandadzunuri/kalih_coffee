import 'package:flutter/material.dart';

void main() {
  runApp(KalihApp());
}

class KalihApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalih Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(14, 56, 34, 1.0),
        title: Text(
          'Selamat datang di Kalih!',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle cart action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(14, 56, 34, 1.0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Row(
                children: [
                  CategoryButton('Coffee', 'assets/images/coffee.png'),
                  CategoryButton('Non-Coffee', 'assets/images/non-coffee.png'),
                  CategoryButton('Noodle', 'assets/images/noodle.png'),
                  CategoryButton('Rice', 'assets/images/rice.png'),
                  CategoryButton('Snack', 'assets/images/snack.png'),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0, // Tambahkan jarak vertikal antar item
              ),
              itemCount: 6, // Sesuaikan jumlah item berdasarkan data Anda
              itemBuilder: (context, index) {
                return MenuItem(
                  title: 'Rice Bowl Chicken Sambal Matah',
                  price: index % 2 == 0 ? 25000 : 100000,
                  imageUrl: 'assets/images/rice_bowl.png',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final String imageUrl;

  CategoryButton(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.4),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Container(
            padding: EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(14, 56, 34, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              imageUrl,
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(height: 2), // Tambahkan jarak antara gambar dan teks
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final String title;
  final int price;
  final String imageUrl;

  MenuItem({required this.title, required this.price, required this.imageUrl});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(
          214, 205, 164, 1), // Setel warna latar belakang di sini
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0), // Tambahkan padding di sekitar gambar
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                widget.imageUrl,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 3), // Tambahkan jarak
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Rp ${widget.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 10.0),
              textAlign: TextAlign.left,
            ),
          ),
          Spacer(), // Dorong tombol ke bawah
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled:
                      true, // Tambahkan ini agar pop-up dapat di-scroll
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      // Tambahkan SingleChildScrollView di sini
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(214, 205, 164, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                20), // Border radius untuk bagian atas
                            topRight: Radius.circular(
                                20), // Border radius untuk bagian atas
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar produk
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  widget.imageUrl,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // Nama produk
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            // Deskripsi produk (contoh)
                            Text(
                              'Deskripsi produk',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            // Harga produk
                            Text(
                              'Rp ${widget.price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 10),
                            // Catatan untuk penjual (contoh)
                            Row(
                              children: [
                                Icon(Icons
                                    .note), // Tambahkan ikon catatan di sini
                                SizedBox(
                                    width:
                                        5), // Tambahkan jarak horizontal antara ikon dan teks
                                Text(
                                  'Catatan untuk penjual: ',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                            SizedBox(height: 10),
                            // Jumlah dibeli
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    // Implementasi pengurangan jumlah
                                    setState(() {
                                      if (_quantity > 1) {
                                        _quantity--;
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '$_quantity', // Tampilkan jumlah item
                                  style: TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    // Implementasi penambahan jumlah
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                                SizedBox(width: 60),
                                // Tombol tambah ke keranjang
                                ElevatedButton(
                                  onPressed: () {
                                    // Tangani aksi tambah ke keranjang
                                  },
                                  child: Text(
                                    'Tambah ke keranjang',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(14, 56, 34, 1.0)),
                                  ),
                                ),
                              ],
                            ),
                            // Isi pop-up
                          ],
                        ),
                      ),
                    );
                  },
                ); // Tangani aksi tambah ke keranjang
              },
              child: Text(
                'Tambah +',
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(14, 56, 34, 1.0)),
                fixedSize: MaterialStateProperty.all<Size>(
                    Size(130, 12)), // Atur ukuran dengan angka height dan width
              ),
            ),
          ),
        ],
      ),
    );
  }
}
