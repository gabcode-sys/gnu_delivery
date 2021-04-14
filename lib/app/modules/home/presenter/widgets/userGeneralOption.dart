import 'package:flutter/material.dart';

class UserGeneralOption {
  BuildContext context;
  UserGeneralOption({@required this.context})
      : assert(
          context != null,
          'É necessário informar um contexto',
        );

  Widget generalOption({
    @required Icon icon,
    @required Text title,
  }) {
    return Column(
      children: [
        FlatButton(
          padding: const EdgeInsets.only(
              left: 0.0, right: 15.0, top: 4.0, bottom: 4.0),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade100,
                        child: icon,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      title,
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFBEBEC7),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
