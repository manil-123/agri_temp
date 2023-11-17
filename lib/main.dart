import 'package:flutter/material.dart';
import 'package:flutter_agriculture/provider/home_provider.dart';
import 'package:flutter_agriculture/provider/product_detail_provider.dart';
import 'package:flutter_agriculture/repository/product_repository.dart';
import 'package:flutter_agriculture/repository/product_repository_impl.dart';
import 'package:flutter_agriculture/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductRepository>(
          create: (_) => ProductRepositoryImpl(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) =>
              HomeProvider(ProductRepositoryImpl())..getProductsList(),
        ),
        ChangeNotifierProvider<ProductDetailProvider>(
          create: (_) => ProductDetailProvider(
            ProductRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Agriculture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
