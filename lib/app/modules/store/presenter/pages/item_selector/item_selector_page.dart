import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gnu_delivery/app/modules/store/domain/entities/order_info.dart';
import 'package:gnu_delivery/app/modules/store/presenter/pages/item_selector/item_selector_controller.dart';
import 'package:gnu_delivery/app/modules/store/presenter/widgets/caroussel_selector.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class ItemSelector extends StatefulWidget {
  final Map<String, dynamic> productParams;
  ItemSelector({@required this.productParams});

  @override
  _ItemSelectorState createState() => _ItemSelectorState();
}

class _ItemSelectorState
    extends ModularState<ItemSelector, ItemSelectorController> {
  CarousselSelector _carousselSelector = new CarousselSelector();
  int selectedProductType = 0;
  List<dynamic> categoryList;
  Map<String, Map<String, dynamic>> selectedAditionals = {};

  @override
  Widget build(BuildContext context) {
    controller.searchProductById(widget.productParams['restaurantId'],
        widget.productParams['productId']);
    controller.getProductAditionals(widget.productParams['restaurantId'],
        widget.productParams['productId']);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIThemeColors.whiteTheme,
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
              Icons.expand_more_rounded,
              size: 18.0,
              color: UIThemeColors.blackTheme,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
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
                Icons.more_vert_rounded,
                size: 18.0,
                color: UIThemeColors.blackTheme,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: controller.searchProductById(
              widget.productParams['restaurantId'],
              widget.productParams['productId']),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: const CircularProgressIndicator(strokeWidth: 2.0),
              );
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Stack(
                      children: [
                        Observer(builder: (_) {
                          return Container(
                            padding: const EdgeInsets.all(60.0),
                            child: Image.network(
                                controller.productInfo.first.image),
                          );
                        }),
                        Positioned(
                          bottom: 40,
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              height: 45.0,
                              width: 115.0,
                              decoration: BoxDecoration(
                                color: UIThemeColors.whiteTheme,
                                borderRadius: BorderRadius.circular(40.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 1),
                                    blurRadius: 100.0,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    iconSize: 19.0,
                                    splashRadius: 4.0,
                                    icon: Icon(Icons.remove_rounded),
                                    onPressed: () {
                                      if (controller.itemCount > 1) {
                                        controller.itemCount--;
                                        setState(() {});
                                      }
                                    },
                                    color: controller.itemCount > 1
                                        ? Colors.black87
                                        : Colors.grey.shade200,
                                  ),
                                  Text(controller.itemCount.toString()),
                                  IconButton(
                                    iconSize: 19.0,
                                    splashRadius: 4.0,
                                    icon: Icon(Icons.add_rounded),
                                    onPressed: () {
                                      controller.itemCount++;
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(builder: (_) {
                                return Text(
                                  controller.productInfo.first.name,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                  ),
                                );
                              }),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: UIThemeColors.orangeThemeLight,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Observer(builder: (_) {
                                  return Text(
                                    controller.productInfo.first.calorificValue
                                            .toString() +
                                        ' cal',
                                    style: TextStyle(
                                      fontSize: 9.0,
                                      color: UIThemeColors.orangeTheme,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          Observer(builder: (_) {
                            return Text(
                              controller.productInfo.first.description,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: UIThemeColors.blackTheme,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selecione um tamanho',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: UIThemeColors.blackTheme,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30.0,
                          width: MediaQuery.of(context).size.width,
                          child: Observer(
                            builder: (_) {
                              categoryList = controller
                                  .productInfo[0].type.entries
                                  .map((entry) => entry.value)
                                  .toList();

                              return ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: categoryList.length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        _carousselSelector.item(
                                  colorIndex: selectedProductType == index,
                                  categoryText: categoryList[index],
                                  onPressed: () async {
                                    setState(() {});
                                    selectedProductType = index;
                                  },
                                  onSelectedColor:
                                      UIThemeColors.orangeThemeLight,
                                  notSelectedColor: UIThemeColors.whiteTheme,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Adicionais',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: UIThemeColors.blackTheme,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(top: 8.0),
                              itemCount: controller.productAditionalInfo.length,
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (BuildContext context, int index) {
                                List<dynamic> avaiability = controller
                                    .productAditionalInfo[index]
                                    .availability
                                    .entries
                                    .map((entry) => entry.value)
                                    .toList();

                                var availabilityStatus = avaiability[0];

                                print(controller.productAditionalInfo[index]);

                                return Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .productAditionalInfo[index]
                                                .title,
                                            style: TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Text(
                                            availabilityStatus,
                                            style: TextStyle(
                                              color: UIThemeColors.greyTheme,
                                              fontSize: 9.0,
                                            ),
                                          ),
                                          Text(
                                            'R\$ ${controller.productAditionalInfo[index].price}',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: 110.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              iconSize: 13,
                                              splashRadius: 18,
                                              icon: Icon(Icons.remove_rounded),
                                              onPressed: () {
                                                bool existAD = selectedAditionals
                                                    .containsKey(controller
                                                        .productAditionalInfo[
                                                            index]
                                                        .title);
                                                if (!existAD) {
                                                  selectedAditionals.addAll({
                                                    controller
                                                        .productAditionalInfo[
                                                            index]
                                                        .title: {
                                                      'qtd': 1,
                                                    }
                                                  });
                                                } else {
                                                  if (selectedAditionals[controller
                                                          .productAditionalInfo[
                                                              index]
                                                          .title]['qtd'] >
                                                      0) {
                                                    selectedAditionals[controller
                                                            .productAditionalInfo[
                                                                index]
                                                            .title]
                                                        .update('qtd', (value) {
                                                      return value - 1;
                                                    });
                                                  }
                                                }

                                                setState(() {});
                                              },
                                            ),
                                            Text(
                                              selectedAditionals.containsKey(
                                                      controller
                                                          .productAditionalInfo[
                                                              index]
                                                          .title)
                                                  ? selectedAditionals[controller
                                                          .productAditionalInfo[
                                                              index]
                                                          .title]['qtd']
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
                                                bool existAD = selectedAditionals
                                                    .containsKey(controller
                                                        .productAditionalInfo[
                                                            index]
                                                        .title);
                                                if (!existAD) {
                                                  selectedAditionals.addAll({
                                                    controller
                                                        .productAditionalInfo[
                                                            index]
                                                        .title: {
                                                      'qtd': 1,
                                                    }
                                                  });
                                                } else {
                                                  if (selectedAditionals[controller
                                                          .productAditionalInfo[
                                                              index]
                                                          .title]['qtd'] <
                                                      controller
                                                          .productAditionalInfo[
                                                              index]
                                                          .maxCount) {
                                                    selectedAditionals[controller
                                                            .productAditionalInfo[
                                                                index]
                                                            .title]
                                                        .update('qtd', (value) {
                                                      return value + 1;
                                                    });
                                                  }
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Divider(
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.message_rounded,
                            size: 18.0,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Alguma observação?',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '0/140',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 12.0,
                        color: UIThemeColors.blackTheme,
                      ),
                      controller: controller.textEditingController,
                      onChanged: controller.setOrderObservation(),
                      decoration: InputDecoration(
                        hintText:
                            'Ex.: Tirar a cebola, pouco  bacon, carne ao ponto etc.',
                        hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.shade300,
                        ),
                        hintMaxLines: 2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                  ),
                ],
              ),
            );
          }),
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
            onTap: () async {
              OrderInfo orderInfo = await controller
                  .getOpenedOrder(widget.productParams['restaurantId']);
              if (orderInfo == null)
                orderInfo = await controller
                    .createNewOrder(widget.productParams["restaurantId"]);
              controller.createNewOrderItem(
                orderId: orderInfo.orderId,
                restaurantId: orderInfo.restaurantId,
                productId: controller.productInfo.first.productId,
                name: controller.productInfo.first.name,
                count: controller.itemCount,
                type: categoryList[selectedProductType],
                observation: controller.orderObservation,
                aditionals: selectedAditionals,
              );

              Modular.to.pop();
            },
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
                        text: 'Adicionar ao carrinho por ',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          color: UIThemeColors.whiteTheme,
                        ),
                      ),
                      TextSpan(
                        text: controller.productInfo.length == 0
                            ? ''
                            : 'R\$ ${controller.productInfo.first.price.toString()}',
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
