class User {
  String name;
  int age;
  late Set<Product> products;
  Role? role;

  User(this.name, this.age, this.role) {
    products = {};
  }
}

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product &&
        other.productName == productName &&
        other.price == price;
  }

  @override
  int get hashCode => productName.hashCode ^ price.hashCode;
}

enum Role { Admin, Customer }

class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age, Role.Admin);

  void tambahProduk(Product product) {
    if (product.inStock) {
      products.add(product);
      print("\nINFO LAPORAN TAMBAH PRODUK");
      print('${product.productName} berhasil ditambahkan ke daftar produk.');
    } else {
      print(
          '${product.productName} tidak tersedia dalam stok dan tidak dapat ditambahkan.');
    }
  }

  void hapusProduk(Product product) {
    products.remove(product);
    print("\nINFO LAPORAN HAPUS PRODUK");
    print('${product.productName} berhasil dihapus dari daftar produk.');
  }
}

class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age, Role.Customer);

  void lihatProduk() {
    print('\nDaftar Produk Tersedia:');
    for (var product in products) {
      print(
          '${product.productName} - Rp${product.price} - ${product.inStock ? "Tersedia" : "Habis"}');
    }
  }
}

Future<void> fetchProductDetails() async {
  print('Mengambil detail produk...');
  await Future.delayed(Duration(seconds: 2));
  print('Detail produk berhasil diambil.');
}

void main() {
  AdminUser admin = AdminUser('Gufran', 20);
  CustomerUser customer = CustomerUser('Upan', 25);

  Product product1 = Product('Laptop Lenovo', 15000000.0, true);
  Product product2 = Product('HP Samsung', 8000000.0, false);
  Product product3 = Product('HP Xiaomi', 8000000.0, true);
  Product product4 = Product('Laptop Lenovo', 15000000.0, true);

  try {
    admin.tambahProduk(product1);
    admin.hapusProduk(product2);
    admin.tambahProduk(product3);
    admin.tambahProduk(product4);
  } on Exception catch (e) {
    print('Kesalahan: $e');
  }

  customer.products.addAll(admin.products);
  customer.lihatProduk();
  print('');

  fetchProductDetails();

  Map<String, Product> productMap = {
    product1.productName: product1,
    product2.productName: product2,
    product3.productName: product3,
    product4.productName: product4,
  };

  productMap.forEach((key, value) {
    print(
        '${key} - Harga: Rp${value.price} - Stok: ${value.inStock ? "Tersedia" : "Habis"}');
  });

  Set<Product> productSet = {product1, product2, product3, product4};
  print('\nDaftar Produk dari Set:');
  productSet.forEach((product) {
    print(
        '${product.productName} - Harga: Rp${product.price} - Stok: ${product.inStock ? "Tersedia" : "Habis"}');
  });
}
