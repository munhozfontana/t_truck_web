import 'package:flutter/material.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class ChatListComponent extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final double height;
  final double width;

  final void Function(int)? onTap;

  const ChatListComponent({
    Key? key,
    required this.padding,
    required this.decoration,
    required this.height,
    required this.width,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: decoration,
      child: Column(
        children: [
          Text(
            'Mensagens',
            style: StylesTypography.h18wBold,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => Card(
                        elevation: 6,
                        margin: EdgeInsets.all(10),
                        child: Material(
                          child: InkWell(
                            onTap: () => onTap ?? onTap!(index),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(index.toString()),
                                backgroundColor: Colors.purple,
                              ),
                              title: Text(index.toString()),
                              subtitle: Text(index.toString()),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 2,
                      ),
                  itemCount: 18))
        ],
      ),
    );
  }
}
