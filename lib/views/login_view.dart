import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/views/register_view.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เข้าสู่ระบบ"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            AppTextField(label: "อีเมล", controller: emailController),
            SizedBox(height: 10),
            AppTextField(
              label: "รหัสผ่าน",
              controller: passwordController,
              hideText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (!GetUtils.isEmail(emailController.text)) {
                  Get.snackbar("Error", "กรุณากรอกอีเมลให้ถูกต้อง");
                  return;
                }
                if (passwordController.text.length < 6) {
                  Get.snackbar("Error", "กรุณากรอกรหัสผ่านอย่างน้อย 6 ตัว");
                  return;
                }
                // logic
                authController.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("เข้าสู่ระบบ"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(RegisterView());
              },
              child: Text("สมัครสมาชิก"),
            ),
          ],
        ),
      ),
    );
  }
}
