import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_poemrogaman4_rayhan/input.dart';

class OutputPage extends StatelessWidget {
  static const routeName = '/output';

  final String name;
  final String code;
  final String product;
  final int price;
  final int amount;
  final int totalPrice;
  final double discount;

  const OutputPage({
    super.key,
    required this.name,
    required this.code,
    required this.product,
    required this.price,
    required this.amount,
    required this.totalPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    double totalPay = totalPrice - discount;
    final formatter = NumberFormat("#,##0", "en_US");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_bag, size: 24),
                  SizedBox(width: 10),
                  Text(
                    "Transaksi Pembelian",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Nama Pelanggan : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$name",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, thickness: 1.5),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Kode Produk : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$code",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Nama Produk : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$product",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Harga Satuan : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp. ${formatter.format(price)}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Jumlah Beli : ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$amount",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey, thickness: 1.5),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Total Harga : Rp. ${formatter.format(totalPrice)}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right),
            ),
            const SizedBox(height: 10),
            if (discount > 0)
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Anda mendapatkan diskon 10%",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.right,
                ),
              ),
            if (discount > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        "Total Diskon : Rp. ${formatter.format(discount)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey, thickness: 1.5),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        "Total Bayar : Rp. ${formatter.format(totalPay)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Terima Kasih telah Berbelanja ;)",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, InputPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
