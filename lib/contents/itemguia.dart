import 'package:flutter/material.dart';

class ItemGuia extends StatelessWidget {
  final String name;
  final IconData icon;
  final Widget widget;
  const ItemGuia({Key? key, required this.name, required this.icon, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
          width: 100,
          height: 100,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widget));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(name, style: TextStyle(color: Colors.white, fontSize: 17),), Icon(icon, color: Colors.white,)],
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))))),
    );
  }
}
