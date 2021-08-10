import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/core/components/body_component.dart';
import 'package:t_truck_web/core/components/responsive.dart';
import 'package:t_truck_web/core/components/title_component.dart';
import 'package:t_truck_web/core/styles/style_colors.dart';
import 'package:t_truck_web/core/styles/styles_button.dart';
import 'package:t_truck_web/core/styles/styles_fonts.dart';
import 'package:t_truck_web/features/login/ui/components/app_input.dart';

import './config_controller.dart';

class ConfigPage extends GetView<ConfigController> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Visibility(
          visible: Responsive.isNotMobile(context),
          child: const TitleComponent(
            title: 'Configurações',
          ),
        ),
        BodyComponent(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Flex(
                  direction: Responsive.when(
                    context,
                    mobile: Axis.vertical,
                    orOther: Axis.horizontal,
                  ),
                  children: [
                    pageDescribe(context),
                    const Spacer(),
                    formPage(_formKey, context),
                  ],
                ),
              ),
              Spacer(
                flex: Responsive.when(
                  context,
                  mobile: 1,
                  orOther: 2,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Expanded formPage(GlobalKey<FormState> _formKey, BuildContext context) {
    return Expanded(
      flex: Responsive.when(
        context,
        mobile: 25,
        orOther: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: StylesColors.grayWhite.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 26,
          horizontal: Responsive.when(
            context,
            mobile: 12,
            orOther: 32,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: const [
                              Expanded(child: AppInput(label: 'Nome')),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(child: AppInput(label: 'Sobrenome')),
                            ],
                          ),
                          Row(
                            children: const [
                              Expanded(child: AppInput(label: 'Sobrenome')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: Responsive.when(
                          context,
                          mobile: CrossAxisAlignment.center,
                          orOther: CrossAxisAlignment.start,
                        ),
                        children: [
                          Visibility(
                            visible: Responsive.isNotMobile(context),
                            child: Expanded(
                              child: Text(
                                'Resetar senha',
                                style: Responsive.when(context,
                                    mobile: StylesTypography.h16Bold,
                                    orOther: StylesTypography.h18wBold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: Responsive.when(
                              context,
                              mobile: 2,
                              orOther: 1,
                            ),
                            child: Text(
                              'Você pode alterar a senha do usuário clicando abaixo',
                              style: Responsive.when(context,
                                  mobile: StylesTypography.h16,
                                  orOther: StylesTypography.h18),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: StylesButton.grayButtonCirc14.copyWith(
                                backgroundColor: MaterialStateProperty.all(
                                  StylesColors.grayAlmostWhite,
                                ),
                              ),
                              icon: Icon(
                                FeatherIcons.lock,
                                color: StylesColors.black,
                              ),
                              label: Text(
                                "Alterar senha",
                                style: StylesTypography.h16.copyWith(
                                  color: StylesColors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded pageDescribe(BuildContext context) {
    return Expanded(
      flex: Responsive.when(
        context,
        mobile: 3,
        orOther: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: Responsive.isNotMobile(context),
            child: Expanded(
                child: Text(
              'Informações',
              style: StylesTypography.h18wBold,
            )),
          ),
          Expanded(
              child: Text(
            'Insira as informações de cadastro do usuário.',
            style: StylesTypography.h18,
          )),
          Visibility(
            visible: Responsive.isNotMobile(context),
            child: const Spacer(
              flex: 5,
            ),
          )
        ],
      ),
    );
  }
}
