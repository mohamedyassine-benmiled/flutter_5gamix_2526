import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String _url;
  final String _title;
  final int _price;

  const ProductInfo(this._url, this._title, this._price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Image.asset(
              _url,
              width: 200,
              height: 110,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_title),
              Text(
                "$_price TND",
                textScaleFactor: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
