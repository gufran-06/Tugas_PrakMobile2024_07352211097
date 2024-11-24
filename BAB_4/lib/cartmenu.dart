import 'package:flutter/material.dart';

class CartMenu extends StatefulWidget {
  @override
  _CartMenuState createState() => _CartMenuState();
}

class _CartMenuState extends State<CartMenu> {
  final List<Map<String, dynamic>> _cartItems = [
    {
      "name": "Filosofi Teras",
      "brand": "Kompas Media",
      "price": 40,
      "quantity": 0,
      "image": 'images/buku.jpg'
    },
    {
      "name": "Psychology of Money",
      "brand": "Harriman House",
      "price": 333,
      "quantity": 0,
      "image": 'images/buku.jpg'
    },
    {
      "name": "Duduk Dulu",
      "brand": "Gradien Mediatama",
      "price": 50,
      "quantity": 0,
      "image": 'images/buku.jpg'
    },
    {
      "name": "Atomic Habits",
      "brand": "Gramedia",
      "price": 20,
      "quantity": 0,
      "image": 'images/buku.jpg'
    },
  ];

  double get subtotal {
    return _cartItems.fold(
        0, (total, item) => total + (item["price"] * item["quantity"]));
  }

  double discount = 4.0;
  double deliveryCharges = 2.0;

  @override
  Widget build(BuildContext context) {
    double total = subtotal - discount + deliveryCharges;

    if (subtotal == 0) {
      total = 0;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Cart"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(item["image"],
                            width: 100, height: 80, fit: BoxFit.cover),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item["name"],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text(item["brand"],
                                  style: const TextStyle(color: Colors.grey)),
                              Text("\$${item["price"]}",
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 129, 84, 234))),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(children: [
                              SizedBox(width: 70),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(143, 229, 107, 107),
                                  size: 35,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _cartItems.removeAt(index);
                                  });
                                },
                              )
                            ]),
                            Text(""),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (item["quantity"] > 0) {
                                        item["quantity"]--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 129, 84, 234),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(Icons.remove,
                                        size: 16, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${item["quantity"]}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item["quantity"]++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 129, 84, 234),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    blurRadius: 10,
                    offset: Offset(0, -2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Order Summary",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Items"),
                    Text("${_cartItems.length}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount"),
                    Text("\$${discount.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Delivery Charges"),
                    Text("\$${deliveryCharges.toStringAsFixed(2)}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromARGB(255, 255, 65, 65),
                  ),
                  child: const Center(
                    child: Text(
                      "Check Out",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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
