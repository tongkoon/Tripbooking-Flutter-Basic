import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tripbooking/pages/camare.dart';
import 'package:tripbooking/pages/showTrip.dart';
import 'package:tripbooking/shared/appData.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int tel = 0615144133;
  String pwd = '1234';
  String result = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetStorage gs = GetStorage();
    result = gs.read('data') ?? 'Sawaddee';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Tripbooking App'),
        // ),
        body: SizedBox(
          width: MediaQuery.of(context)
              .size
              .width, //ดูข้อมูลหน้าจอเพื่อ set ขนาดหน้าจอให้เต็ม fullwidth
          child: Container(
            // color: Colors.amber,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Image.network(
                      'https://www.shutterstock.com/image-vector/flights-logo-260nw-495138385.jpg',
                      width: 200,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(70, 40, 70, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('หมายเลขโทรศัพท์'),
                        TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('รหัสผ่าน'),
                        TextField(
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  Text(result),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 20, 70, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {


                              // GetStorage gs = GetStorage();
                              // gs.write('data', 'Hello Word!!!');
                             
                              // Get.back();
                              // Get.snackbar('ข้อความเตือน', 'คุณกำลังโดนไวรัส',
                              //     duration: const Duration(seconds: 5));

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const RegisterPage()),
                              // );
                            },
                            child: const Text('ลงทะเบียนใหม่')),
                        FilledButton(
                            onPressed: () async {
                              // login success
                              context.read<AppData>().userName = 'admin';
                              context.read<AppData>().isAdmin = true;
                              Get.to(() => const ShowTrip());
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ShowTrip()));

                              //  String url = 'https://cslab.it.msu.ac.th/tripbooking/trip';
                              //   var res = await http.get(Uri.parse(url));
                              //   List<TripGetResponse> trips = tripGetResponseFromJson(res.body);
                              //   log(trips.length.toString());
                              // log(res.body);
                              // setState(() {
                              // result = 'Success';

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const ShowTrip()));
                              // });
                            },
                            child: const Text('เข้าสู่ระบบ'))
                      ],
                    ),
                  ),
FilledButton(onPressed: (){
  Get.to(()=> const CameraPage());
}, child: const Text('Camere'))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
