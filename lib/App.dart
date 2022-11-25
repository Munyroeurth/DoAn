import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/Login/Home/qrcode/loginQrcode/loginscreen.dart';

import 'Admin/Login/splashScreen.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blueGrey
      // ),
         home:  SplashScreen(),
        // home: LoginScreen(),
        // home: WidgetTree(),
        //  home:Myphone(),
        // home:InputCountry(),
        // home: ViduAPI(),
        // home: vidu(),
        // home: viduCat(),
        // home: CatBoySay(),
        // home: EndPointAPI(),
        /*****User******/
        // home:QrCodeScreen(),
        // home: ProgressIndicatorApp(),
        // home: LinearProgressBar(),
        // home: MyCustomForm(),
        // home: apicall(),
        // home: WidgetTree(),

        /*****Call Api With Dio GET */
        // home: customdialog(),
        // home: WebviewTest(),
        // home:MyHomePage(),

        /**************POST*************/
        // home:PostDio(),
        // home: ImagUploadpicker(),
        // home: customdialog(),
        /********firesbase********/
        // home:FiresBaseSetup(),
        // home:ScanPage(),

        /*******Provider*****/
        // home: providerApi(),
        );
  }
}

// ChangeNotifierProvider(
//         create: (context) => TodoProvider(),
//         child: const MaterialApp(
//           // home: ForgetPassSreen(),
//           //  home: SplashScreen(),
//           // home: Splash(),

//           // home:InputCountry(),

//           //  home: SignInHR(),
//           //  home:HRMScreen(),
//           //  home:EmployeeManagement(),
//           //  home:EmptyEmployee(),
//           // home:AddEmployee(),
//           // home: EmployeeList(),

//           // home: HRMUserScreen(),

//           // home: ViduAPI(),
//           // home: vidu(),
//           // home: viduCat(),
//           // home: CatBoySay(),
//           // home: EndPointAPI(),

//           /*****Call Api With Dio GET */
//           // home: DioButton(),

//           /**************POST*************/
//           // home:PostDio(),
//           home: ImagUploadpicker(),

//           /*******Provider*****/
//           // home: providerApi(),
// ));
