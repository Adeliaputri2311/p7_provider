import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),

      appBar: AppBar(
        title: const Text(
          'Keranjang',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),

      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          // Jika keranjang kosong
          if (cart.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.pink,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Keranjang kosong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Silakan tambahkan produk terlebih dahulu'),
                ],
              ),
            );
          }

          // Jika keranjang berisi produk
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final product = cart.items[index];

              return Card(
                color: Colors.white,
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),

                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFFFD6E7),
                    child: Icon(
                      Icons.shopping_bag,
                      color: Colors.pink,
                    ),
                  ),

                  title: Text(
                    product.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    'Rp ${product.harga}',
                    style: const TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  trailing: ElevatedButton(
                    onPressed: () {
                      // Menghapus produk berdasarkan index
                      cart.remove(index);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Produk berhasil dihapus'),
                          backgroundColor: Colors.pink,
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: const Text('Hapus'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}