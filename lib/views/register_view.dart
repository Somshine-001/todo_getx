import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/auth_controller.dart';
import 'package:todo_getx/widgets/app_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สมัครสามชิก"),
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
            AppTextField(
              label: "ยืนยันรหัสผ่าน",
              controller: confirmPasswordController,
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
                if (passwordController.text != confirmPasswordController.text) {
                  Get.snackbar("Error", "กรุณากรอกรหัสผ่านให้ตรงกัน");
                  return;
                }
                // logic สมัครสมาชิกจะอยู่นี่
                authController.register(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("สมัคร"),
            ),
          ],
        ),
      ),
    );
  }
}
