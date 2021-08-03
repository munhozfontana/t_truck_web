import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/app_input.dart';
import 'components/background_logo.dart';
import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            const BackgroundLogo(),
            Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 143,
                        ),
                        SvgPicture.asset(
                          "images/logo.svg",
                          height: 52,
                        ),
                        const Spacer(flex: 52),
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
                        const Spacer(flex: 20),
                        const AppInput(label: "E-mail"),
                        const Spacer(flex: 16),
                        const AppInput(label: "Senha"),
                        const Spacer(flex: 16),
                        Flexible(
                          flex: 24,
                          child: Row(
                            children: [
                              const Flexible(
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
                        const Spacer(flex: 16),
                        ConstrainedBox(
                          constraints: const BoxConstraints.tightFor(
                            width: double.infinity,
                            height: 56,
                          ),
                          child: ElevatedButton(
                            onPressed: () => controller.login(),
                            child: Text(
                              "Entrar",
                              style: Get.textTheme.headline2!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        const Spacer(flex: 19),
                        Text(
                          "Esqueci minha senha",
                          style: Get.textTheme.headline5,
                        ),
                        const Spacer(flex: 19),
                        const Divider(),
                        const Spacer(flex: 19),
                        Flexible(
                          flex: 42,
                          child: Column(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 10,
                                child: Text(
                                  "Precisa de ajuda? Entre em contato\n com o telefone (00) 0 0000-0000",
                                  style: Get.textTheme.headline5,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        const Spacer(
                          flex: 147,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
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
