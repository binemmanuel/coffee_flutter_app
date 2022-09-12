import 'package:coffee_app/src/model/product.dart';

class ProductService {
  static List<Product> get demoProducts => [
        Product(
          id: 1,
          title: 'Cappuccino',
          subtitle: 'With Oat Milk',
          category: 'cappuccino',
          featuredImage:
              'https://images.unsplash.com/photo-1468418143278-41595b1a4c89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2671&q=80',
          images: [],
          price: 40.3,
          rate: 3.5,
          description:
              'A cappuccino is a coffee-based drink made primarily from espresso and milk',
          sizes: ['S', 'M', 'L'],
        ),
        Product(
          id: 2,
          title: 'Cappuccino',
          subtitle: 'With Chocolate',
          category: 'cappuccino',
          featuredImage:
              'https://images.unsplash.com/photo-1507133750040-4a8f57021571?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
          images: [],
          price: 50.5,
          rate: 4.5,
          description:
              'A cappuccino is a coffee-based drink made primarily from espresso and milk',
          sizes: ['S', 'M', 'L'],
        ),
        Product(
          id: 3,
          title: 'Cappuccino',
          subtitle: 'With Oat Milk',
          category: 'cappuccino',
          featuredImage:
              'https://images.unsplash.com/photo-1517958911667-09c05f6cd698?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1288&q=80',
          images: [],
          price: 40.3,
          rate: 3.5,
          description:
              'A cappuccino is a coffee-based drink made primarily from espresso and milk',
          sizes: ['S', 'M', 'L'],
        ),
        Product(
          id: 4,
          title: 'Cappuccino',
          subtitle: 'With Chocolate',
          category: 'cappuccino',
          featuredImage:
              'https://images.unsplash.com/photo-1513267126281-013f1948f7d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
          images: [],
          price: 50.5,
          rate: 4.5,
          description:
              'A cappuccino is a coffee-based drink made primarily from espresso and milk',
          sizes: ['S', 'M', 'L'],
        ),
      ];

  static List<Product> getProductByCategory(String category) {
    return demoProducts
        .where((product) =>
            product.category!.toLowerCase() == category.toLowerCase())
        .toList();
  }
}
