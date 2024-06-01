import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PilihUser(),
      routes: {
        '/login_admin': (context) => LoginAdminPage(),
        '/login_pelanggan': (context) => LoginPelangganPage(),
      },
    );
  }
}

class PilihUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Sebagai?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login_admin');
                  },
                  child: Container(
                    width: 140, // Atur lebar background
                    height: 180, // Atur tinggi background
                    decoration: BoxDecoration(
                      color: Color(0xFFD6CDA4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/kasir.png', // Sesuaikan dengan path gambar admin
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Admin',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login_pelanggan');
                  },
                  child: Container(
                    width: 140, // Atur lebar background
                    height: 180, // Atur tinggi background
                    decoration: BoxDecoration(
                      color: Color(0xFFD6CDA4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/pelanggan.png', // Sesuaikan dengan path gambar pelanggan
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Pelanggan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Admin'),
      ),
      body: Center(
        child: Text('Halaman Login Admin'),
      ),
    );
  }
}

class LoginPelangganPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Pelanggan'),
      ),
      body: Center(
        child: Text('Halaman Login Pelanggan'),
      ),
    );
  }
}
