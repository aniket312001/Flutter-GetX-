import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/cart_controller.dart';
import 'package:learn_getx/controller/shopping_controller.dart';

class ShopingPage extends StatelessWidget {
  // dependency injection
  final shopingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return controller.products.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  controller.products[index].productName + " "),
                              Text(controller.products[index].price.toString()),
                              Spacer(),
                              ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: Text("add"))
                            ],
                          ),
                        );
                      }));
            }),
          ),
          GetX<CartController>(builder: (myCartController) {
            return Text(
                "Total Amount " + myCartController.totalAmount.toString());
          }),
          SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: GetX<CartController>(builder: (controller) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: Icon(Icons.add_shopping_cart_rounded),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                      child: Text(
                        "${controller.cartCount}",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )),
              ],
            );
          })),
    );
  }
}
