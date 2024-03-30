import 'package:flutter/material.dart';
import 'package:tripbooking/pages/showTrip.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name = '';
  TextEditingController nameCtl = TextEditingController();
  TextEditingController telCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController pwdCtl = TextEditingController();
  TextEditingController authPwdCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สมัครสมาชิก'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ชื่อ-นามสกุล'),
                  TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: nameCtl,
                    // onChanged: (value) {
                    //   name = value;
                    // },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('หมายเลขโทรศัพท์'),
                  TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: telCtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('อีเมล'),
                  TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: emailCtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('รหัสผ่าน'),
                  TextField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: pwdCtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(70, 10, 70, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ยืนยันรหัสผ่าน'),
                  TextField(
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    controller: authPwdCtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 250,
                child: FilledButton(
                    onPressed: () {
                      if (nameCtl.text.isNotEmpty &&
                          telCtl.text.isNotEmpty &&
                          emailCtl.text.isNotEmpty &&
                          pwdCtl.text.isNotEmpty &&
                          authPwdCtl.text.isNotEmpty) {
                        if (pwdCtl.text == authPwdCtl.text) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ShowTrip()));
                        }
                      }
                    },
                    child: const Text('สมัครสมาชิก')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('หากมีบัญชีอยู่แล้ว?'),
                  TextButton(onPressed: () {}, child: const Text('เข้าสู่ระบบ'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
