import 'package:flutter/material.dart';
import 'package:gnu_delivery/app/modules/home/presenter/widgets/store.dart';
import 'package:gnu_delivery/app/utils/theme/color_theme.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int selectedIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Store _store = Store(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.tune_rounded),
          color: UIThemeColors.blackTheme,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Container(
          width: 300,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: TextField(
            style: TextStyle(fontSize: 12.0, color: UIThemeColors.blackTheme),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            color: UIThemeColors.blackTheme,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Restaurantes\nFavoritos',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: UIThemeColors.blackTheme,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  _store.store(
                      image:
                          'https://i.pinimg.com/originals/46/5f/26/465f269591e4c811e19a2a5b49e15c00.jpg',
                      minWaitingTime: 40,
                      maxWaitingTime: 60,
                      avaliation: 4.7,
                      priceNivel: 2,
                      categories: new List<String>(),
                      storeTitle: 'Usina Food Truck',
                      onPressed: () {
                        // Go to Store
                      }),
                  _store.store(
                      image:
                          'https://image.freepik.com/fotos-gratis/hamburguer-de-vista-frontal-em-um-carrinho_141793-15542.jpg',
                      minWaitingTime: 15,
                      maxWaitingTime: 30,
                      avaliation: 4.7,
                      priceNivel: 1,
                      categories: new List<String>(),
                      storeTitle: "Barto's Burger",
                      onPressed: () {
                        // Go to Store
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
