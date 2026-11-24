import 'package:flutter/material.dart';

class Product {
  final String nama;
  final int harga;

  const Product(this.nama, this.harga);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  // Mengambil data produk dalam keranjang
  List<Product> get items => _items;

  // Menghitung jumlah produk
  int get totalItems => _items.length;

  // Menambahkan produk ke keranjang
  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  // Menghapus produk dari keranjang
  void remove(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // Menghapus semua produk
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}