import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:t_truck_web/features/login/ui/components/app_input.dart';
import 'package:t_truck_web/features/login/ui/components/background_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            BackgroundLogo(),
            Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Spacer(
                            flex: 143,
                          ),
                          SvgPicture.asset(
                            "images/logo.svg",
                            height: 52,
                          ),
                          Spacer(flex: 52),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Entrar",
                                  style: Get.textTheme.headline2,
                                ),
                                Text(
                                  "Faça Login",
                                  style: Get.textTheme.headline1,
                                ),
                              ],
                            ),
                          ),
                          Spacer(flex: 20),
                          AppInput(label: "E-mail"),
                          Spacer(flex: 16),
                          AppInput(label: "Senha"),
                          Spacer(flex: 16),
                          Flexible(
                            flex: 24,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Opacity(
                                    opacity: .2,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: print,
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Text(
                                  "Lembrar acesso",
                                  style: Get.textTheme.headline5,
                                ))
                              ],
                            ),
                          ),
                          Spacer(flex: 16),
                          ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                              width: double.infinity,
                              height: 56,
                            ),
                            child: ElevatedButton(
                              onPressed: () => {},
                              child: Text(
                                "Entrar",
                                style: Get.textTheme.headline2!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          Spacer(flex: 19),
                          Text(
                            "Esqueci minha senha",
                            style: Get.textTheme.headline5,
                          ),
                          Spacer(flex: 19),
                          Divider(),
                          Spacer(flex: 19),
                          Flexible(
                            flex: 42,
                            child: Wrap(
                              children: [
                                Spacer(),
                                Text(
                                  "Precisa de ajuda? Entre em contato\n com o telefone (00) 0 0000-0000",
                                  style: Get.textTheme.headline5,
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Spacer(
                            flex: 147,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
