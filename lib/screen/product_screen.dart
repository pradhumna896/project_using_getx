import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controlller.dart';
import '../model/product_model.dart';
import 'product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<ProductController>(ProductController());
    List<ProductModel> productList = controller.productList;
    return Scaffold(
      appBar: AppBar(title: const Text("Product",style: TextStyle(color: Colors.black),),centerTitle: true,elevation: 0,backgroundColor: Colors.transparent,),
      body: Obx((){
        return controller.isLoading.value?const Center(child: CircularProgressIndicator(
          color: Color(0xffE69023),
        ),):
        ListView.builder(
          itemCount: productList.length,
          itemBuilder: (_,index){
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(()=>ProductDetailScreen(listProduct: productList,index: index,));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    height: 300,
                    width: double.maxFinite,
                    child: PageView.builder(
                      itemCount: productList[index].images!.length,
                      itemBuilder: ((context, i) {
                      return Image.network(productList[index].images![i].toString());
                    })),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('\$${productList[index].price.toString()}'),
                    Text(productList[index].title.toString()),
                  ],),
                )
              ],
            ),
          );
        });
      }),
    );
  }
}