import 'package:flutter/material.dart';

import 'product_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "G-Store ESPRIT",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("G-Store ESPRIT"),
        ),
        body: Column(
          children: [
            ProductInfo("assets/images/dmc5.jpg", "Devril May Cry 5", 200),
            ProductInfo("assets/images/re8.jpg", "Resident Evil VIII", 200),
            ProductInfo("assets/images/nfs.jpg", "NFS Heat", 100),
            ProductInfo("assets/images/rdr2.jpg", "RDR 2", 150),
            ProductInfo("assets/images/fifa.jpg", "FIFA 22", 100),
          ],
        )
      ),
    );
  }
}
