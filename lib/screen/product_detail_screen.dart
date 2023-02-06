import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../controller/product_controlller.dart';
import '../model/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final List<ProductModel> listProduct;
  final int index;
  const ProductDetailScreen(
      {super.key, required this.listProduct, required this.index});

  @override
  Widget build(BuildContext context) {
   final controller = Get.put<ProductController>(ProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          listProduct[index].title!,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              margin: const EdgeInsets.all(0),
              height: 300,
              width: double.maxFinite,
              child: PageView.builder(
                onPageChanged: (value) {
                  controller.getIndex(value);
                },
                  itemCount: listProduct[index].images!.length,
                  itemBuilder: ((context, i) {
                    return Image.network(
                        listProduct[index].images![i].toString());
                  })),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child:Obx(()=> Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    listProduct[index].images!.length,
                    (i) => Container(
                          margin: const EdgeInsets.only(left: 3),
                          height: 6,
                          // ignore: unrelated_type_equality_checks
                          width:controller.index==i?18:6,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(6), color: Colors.deepOrange),
                        ))
              )),
            ),
          ]),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Brand: ${listProduct[index].brand}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("\$ ${listProduct[index].price.toString()}"),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rating: ${listProduct[index].rating}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    RatingBar.builder(
                      initialRating:
                          double.parse(listProduct[index].rating.toString()),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(listProduct[index].description.toString()),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    minimumSize: const Size(double.maxFinite, 40)),
                onPressed: () {},
                child: const Text("Buy Now")),
          )
        ],
      ),
    );
  }
}
