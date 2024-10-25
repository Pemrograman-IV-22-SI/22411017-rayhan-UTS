import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uts_poemrogaman4_rayhan/output.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  static String routeName = "/input";

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart, size: 24),
                  SizedBox(width: 10),
                  Text(
                    "Beli Barang",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Pelanggan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
            ),
            const SizedBox(height: 15),
            const Text("Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: "Kode",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: productController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: "Harga",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 15),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: "Jumlah",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(height: 15),
            const Divider(
              color: Colors.grey,
              thickness: 1.5,
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String code = codeController.text;
                  String product = productController.text;
                  int price = int.tryParse(priceController.text) ?? 0;
                  int amount = int.tryParse(amountController.text) ?? 0;

                  if (name.isEmpty ||
                      code.isEmpty ||
                      product.isEmpty ||
                      price <= 0 ||
                      amount <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Semua field harus diisi dengan benar!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    int totalPrice = price * amount;
                    double discount = 0.0;

                    if (totalPrice >= 10000000) {
                      discount = totalPrice * 0.10;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutputPage(
                          name: name,
                          code: code,
                          product: product,
                          price: price,
                          amount: amount,
                          totalPrice: totalPrice,
                          discount: discount,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_shopping_cart, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Beli",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ));
  }
}
