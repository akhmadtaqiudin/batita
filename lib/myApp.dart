import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {

  final List<Map<String, dynamic>> _kategori = [
    {'title': 'Huruf Hijaiyah', 'color': Colors.red},
    {'title': 'Huruf Fokal', 'color': Colors.yellowAccent},
    {'title': 'Huruf Alfabet', 'color': Colors.green},
    {'title': 'Angka', 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flutter.png',
              fit: BoxFit.contain,
              height: 37,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('Welcome to BATITA App')
            )
          ],
        )
      ),

      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover
          )
        ),

        margin: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: _kategori.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            childAspectRatio: 1),
            itemBuilder: (context, index) {
              return  ClipPath(
                clipper: ClipperContainer(),
                child: Container(
                  color: _kategori[index]['color'],
                  height: 200,
                  child: Center(
                    child: Text(
                      _kategori[index]['title'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  )
                )
              );
            }
        )
      )
    );
  }
}

class ClipperContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.width / 2, size.height, size.width);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}