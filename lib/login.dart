import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './input_widget.dart';
import './register.dart';
import '../controller/authentication.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Login', style: TextStyle(fontSize: size * 0.08)),
            const SizedBox(height: 30),
            InputWidget(
              hintText: 'UserName',
              controller: userNameController,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            InputWidget(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  await authenticationController.login(
                    username: userNameController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
                child: Obx(() {
                  return authenticationController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : const Text('login');
                })),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Get.to(() => Register());
                },
                child: Text('Register',
                    style:
                        TextStyle(color: Colors.black, fontSize: size * 0.05)))
          ]),
        ),
      ),
    );
  }
}
