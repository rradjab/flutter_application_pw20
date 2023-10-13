import 'package:flutter/material.dart';
import 'package:task_1/models/product_model.dart';
import 'package:task_1/services/get_products.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> producstList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Inspector'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: producstList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(producstList[index].title!),
            subtitle: CarouselSlider.builder(
              itemCount: producstList[index].images!.length,
              itemBuilder: (context, imgIndex, realIdx) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    producstList[index].images![imgIndex],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          producstList = await getProducts();
          setState(() {});
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
