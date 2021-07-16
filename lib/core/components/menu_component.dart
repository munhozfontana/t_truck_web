import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';

class MenuComponent extends StatefulWidget {
  const MenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  _MenuComponentState createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  double? maxHeight;

  @override
  Widget build(BuildContext context) {
    maxHeight = MediaQuery.of(context).size.height;
    return Container(
      color: StylesColors.white,
      child: Column(
        children: [
          Expanded(
            flex: 88,
            child: logo(),
          ),
          Expanded(
            flex: 764,
            child: itemsMenu(),
          ),
          Expanded(
            flex: 48,
            child: linkExit(),
          ),
        ],
      ),
    );
  }

  Container linkExit() => Container(
        child: Center(
          child: Text(
            'Sair',
            style: TextStyle(
              color: StylesColors.orange,
            ),
          ),
        ),
      );

  ListView itemsMenu() {
    double height = maxHeight! * .05398;
    return ListView(
      children: [
        Item(
          height: height,
          icon: Icons.add_box_outlined,
          text: 'Painel',
        ),
        Item(
          height: height,
          icon: Icons.carpenter_outlined,
          text: 'Motoristas',
        ),
        Item(
          height: height,
          icon: Icons.backup_outlined,
          text: 'Devoluções',
        ),
        Item(
          height: height,
          icon: Icons.card_travel_outlined,
          text: 'Mensagens',
        ),
        Item(
          height: height,
          icon: Icons.engineering_outlined,
          text: 'Configurações',
        ),
      ],
    );
  }

  Center logo() => Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SvgPicture.asset(
              'images/logo.svg',
              height: constraints.maxHeight * .6,
              semanticsLabel: 'Acme Logo',
            );
          },
        ),
      );
}

class Item extends StatefulWidget {
  final double height;
  final IconData? icon;
  final String text;

  const Item({
    Key? key,
    required this.height,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> with SingleTickerProviderStateMixin {
  Duration durationAnimation = Duration(milliseconds: 300);
  Color colorIcon = Colors.black;
  Color colorText = Colors.black;
  List<Color> degradeItem = [
    StylesColors.blue.withOpacity(.69),
    StylesColors.white
  ];
  double fontSizeText = 16;
  bool onHover = false;

  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 16, end: 17),
        weight: 17,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    ));

    _controller.addListener(() {
      print(_sizeAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        return MouseRegion(
          onHover: hover,
          onExit: exit,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: select,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: durationAnimation,
                  curve: Curves.easeInOutExpo,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.1, 1],
                          colors: degradeItem)),
                  height: widget.height,
                  width: onHover ? constraints.maxWidth : 0,
                ),
                Container(
                  height: widget.height,
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          widget.icon,
                          color: onHover ? Colors.white : StylesColors.gray,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Text(
                              widget.text,
                              style: StylesTypography.h16.copyWith(
                                fontSize: _sizeAnimation.value,
                                color: colorIcon,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void select() {
    _controller.forward().whenComplete(() => _controller.reverse());
  }

  void hover(_) {
    onHoverStyle();
  }

  void exit(_) {
    offHoverStyle();
  }

  void onHoverStyle() {
    setState(() {
      colorIcon = Colors.white;
      colorText = Colors.white;
      // fontSizeText = 17;
      degradeItem = [
        StylesColors.blue,
        StylesColors.blue.withOpacity(.69),
      ];
      onHover = true;
    });
  }

  void offHoverStyle() {
    setState(() {
      colorIcon = StylesColors.gray;
      colorText = StylesColors.gray;
      // fontSizeText = 16;
      degradeItem = [
        StylesColors.white,
        StylesColors.blue.withOpacity(.69),
      ];
      onHover = false;
    });
  }
}
