import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/infra/models/order_model.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

import 'cart_controller.dart';

class Cart extends StatefulWidget {
  final Map<String, dynamic> cartParams;
  Cart({@required this.cartParams});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends ModularState<Cart, CartController> {
  Map<String, Map<String, dynamic>> selectedItems = {};

  @override
  void initState() {
    super.initState();
  }

  Future<bool> initializeComponents() async {
    OrderInfo openedOrder = await controller
        .getOpenedOrder(int.parse(widget.cartParams['restaurantId']));

    bool getCart = await controller.getItemsOfCart(
        int.parse(widget.cartParams['restaurantId']), openedOrder.orderId);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: UIThemeColors.whiteTheme,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  color: Colors.grey.shade100,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 18.0,
              color: UIThemeColors.blackTheme,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Limpar',
                style: TextStyle(
                  color: UIThemeColors.orangeTheme,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: initializeComponents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: const CircularProgressIndicator(strokeWidth: 2.0),
            );
          else
            print(snapshot.data);
          return SingleChildScrollView(
            child: SafeArea(
              minimum: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    '${controller.cartItemsInfo.length} Itens no carrinho por R\$ 20.00',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: UIThemeColors.blackTheme,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nome do Restaurante',
                      style: TextStyle(
                        color: UIThemeColors.greyTheme,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.cartItemsInfo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(10.0),
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.0),
                            color: Colors.grey.shade200,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.cartItemsInfo[index].name,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: UIThemeColors.blackTheme,
                              ),
                            ),
                            Text(
                              'R\$0.00',
                              style: TextStyle(
                                color: UIThemeColors.greyTheme,
                                fontSize: 9.0,
                              ),
                            ),
                          ],
                        ),
                        trailing: Container(
                          width: 110.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.grey,
                                iconSize: 13,
                                splashRadius: 18,
                                icon: Icon(
                                  Icons.remove_rounded,
                                ),
                                onPressed: () {
                                  bool existAD = selectedItems.containsKey(
                                      controller.cartItemsInfo[index].itemId);
                                  if (!existAD) {
                                    selectedItems.addAll({
                                      controller.cartItemsInfo[index].itemId: {
                                        'qtd': 1,
                                      }
                                    });
                                  } else {
                                    if (selectedItems[controller
                                            .cartItemsInfo[index]
                                            .itemId]['qtd'] >
                                        0) {
                                      selectedItems[controller
                                              .cartItemsInfo[index].itemId]
                                          .update('qtd', (value) {
                                        return value - 1;
                                      });
                                    }
                                  }

                                  setState(() {});
                                },
                              ),
                              Text(
                                selectedItems.containsKey(
                                        controller.cartItemsInfo[index].itemId)
                                    ? selectedItems[controller
                                            .cartItemsInfo[index].itemId]['qtd']
                                        .toString()
                                    : '0',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              IconButton(
                                iconSize: 13,
                                splashRadius: 18,
                                icon: Icon(Icons.add_rounded),
                                onPressed: () {
                                  bool existAD = selectedItems.containsKey(
                                      controller.cartItemsInfo[index].itemId);
                                  if (!existAD) {
                                    selectedItems.addAll({
                                      controller.cartItemsInfo[index].itemId: {
                                        'qtd': 1,
                                      }
                                    });
                                  } else {
                                    selectedItems[controller
                                            .cartItemsInfo[index].itemId]
                                        .update('qtd', (value) {
                                      return value + 1;
                                    });
                                  }

                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Entrega',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: UIThemeColors.blackTheme,
                        ),
                      ),
                      Text(
                        'Grátis',
                        style: TextStyle(
                          color: UIThemeColors.orangeTheme,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 200.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 30.0,
          top: 15.0,
        ),
        height: 100,
        decoration: BoxDecoration(
          color: UIThemeColors.whiteTheme,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30.0,
              offset: Offset(0, -1),
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Observer(builder: (_) {
          return GestureDetector(
            onTap: () async {},
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: UIThemeColors.orangeTheme,
              ),
              child: Observer(builder: (_) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Pedir por ',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: UIThemeColors.whiteTheme,
                        ),
                      ),
                      TextSpan(
                        text: 1 ==
                                0 // Tratativa para consultar se ja encontrou valor
                            ? ''
                            : 'R\$ 00.00',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: UIThemeColors.whiteTheme,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
