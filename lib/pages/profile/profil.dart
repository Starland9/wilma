// ignore_for_file: prefer_const_constructors

import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/text_field/gf_text_field_squared.dart';
import 'package:wilma/classes/cart.dart';
import 'package:wilma/classes/order.dart';
import 'package:wilma/main.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    var width2 = (MediaQuery.of(context).size.width * 2 / 3) - 50;
    var width3 = (MediaQuery.of(context).size.width / 3) - 10;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FastCachedImage(
                url: "https://img.icons8.com/windows/256/car-roof-box.png",
                width: 50,
              ),
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: EdgeInsets.all(1),
                  child: GFTextFieldSquared(
                    color: Colors.white,
                    editingbordercolor: Theme.of(context).primaryColor,
                    idlebordercolor: Colors.grey,
                    borderwidth: 0.5,
                    hintText: "Rechercher...",
                    backgroundcolor: Colors.white,
                    onChanged: (value) {
                      // setState(() {
                      //   search = value;
                      //   _updateArticles();
                      // });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_2,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
            ),
          ),
          Divider(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildHeadLeft1(width2: width2),
                    SizedBox(
                      height: 50,
                    ),
                    _build2Head(width2),
                    SizedBox(
                      height: 50,
                    ),
                    Text("Mon Panier"),
                    if (carts.values.isNotEmpty)
                      SizedBox(
                        width: width2,
                        height: 150,
                        child: ListView(
                          children: carts.values.first.items
                              .map((e) => ListTile())
                              .toList(),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                child: Column(
                  children: [
                    Text("Historique de mes commades"),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      width: width3,
                      height: MediaQuery.of(context).size.height - 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: orders.values
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    title: Text(e.car.model),
                                    subtitle: Text(e.date.toIso8601String()),
                                    leading: FastCachedImage(
                                      url: e.car.carImagePath,
                                      width: 100,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _build2Head(double width2) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      width: width2,
      height: 150,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            CmdCard(
              nb: orders.length,
              text: "COMMANDES",
            ),
            CmdCard(
              nb: carts.values.isEmpty ? 0 : carts.values.first.items.length,
              text: "ARTICLES AU PANIER",
            ),
          ],
        ),
      ),
    );
  }
}

class CmdCard extends StatelessWidget {
  const CmdCard({
    super.key,
    required this.nb,
    required this.text,
  });

  final int nb;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              nb.toString(),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                // fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _buildHeadLeft1 extends StatelessWidget {
  const _buildHeadLeft1({
    super.key,
    required this.width2,
  });

  final double width2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width2,
      height: 290,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 120,
                color: Colors.blue.shade900,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt_rounded),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 160,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person),
                          Text(
                            gClient?.nom ?? "Foo Barr",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          Text(
                            gClient?.email ?? "foobar@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text(
                            gClient?.phone ?? "555-555-555",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: (width2 / 2) - 70,
            bottom: 120,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                border: Border.all(
                  color: Colors.blue,
                  // width: 5,
                ),
                color: Colors.white,
                image: DecorationImage(
                  image: FastCachedImageProvider(
                    "https://img.icons8.com/ios-filled/256/gender-neutral-user.png",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
