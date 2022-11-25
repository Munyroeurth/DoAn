import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
class LinearProgressBar extends StatefulWidget {
  const LinearProgressBar({super.key});

  @override
  State<LinearProgressBar> createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> with TickerProviderStateMixin {

  late AnimationController controller;
  static const maxSeconds = 10;
  int seconds = maxSeconds;
  // Timer? _timer;
 
  void resetTimer() => seconds = maxSeconds;
/*******XAY DUNG MOT HAM CHO INDICATOR MOI KHI THAY DOI GIA TRI******** */
  double percent = 0;
  void PercentIndicactor(){ if(percent<1){
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      setState(() {
        percent+=0.25;
        if(percent>=0){
          timer!.cancel();
        }
        else{
          timer!.cancel();
        };
      });
      if(percent>=0.25){

      }
      setState(() {
        percent+=0.25;
        if(percent>=0.25){
          timer!.cancel();
        }
        
      });
     });
  }
  }
  @override
  void initState(){
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      )..addListener(() {
        setState(() {
        });
        controller.repeat(reverse: true);
        super.initState();
      }
    ); 
  }

  @override
  void dispose (){
    controller.dispose();
    super.dispose();
  }

  Widget _buildTimer (){
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children:  [
         SizedBox(
          height: 150,
          width: 150,
           child: CircularPercentIndicator(
            radius: 50,
            lineWidth: 10,
            animation: true,
            // animationDuration: 1000,
            percent: percent,
            center: Text(
              percent.toString() + '%',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            backgroundColor: Colors.blueAccent,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.redAccent,
            ),
         )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LinearProgressBar')),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('This is a Indicator', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(50.0),
            //   child: CircularProgressIndicator(
            //     backgroundColor: Colors.amber,
            //     strokeWidth: 4,
            //     semanticsLabel: 'Linear Progress Indictor',
            //   ),
            // ),
            // const LinearProgressIndicator(
            //   backgroundColor: Colors.amber,
            //   semanticsLabel: 'Linease Progress Indictor',
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 80, top: 20),
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: 50,
                lineWidth: 10,
                percent: 0.7,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center:
                const Text('70%', style: TextStyle(fontSize: 20),)
                
                ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: LinearPercentIndicator(
                
            //     animation: true,
            //     animationDuration: 1000,
            //     lineHeight: 40,
            //     percent: 0.9,
            //     progressColor: Colors.deepPurple,
            //     backgroundColor: Colors.deepPurple.shade200,
            //   ),
            // // ),
            // CountdownTimer(
            //   //  controller :_timercontroller,
            // ),
            _buildTimer(),
            Padding(
              padding: const EdgeInsets.only(left: 200, top:0),
              child: FloatingActionButton(onPressed: (() {
                // Print(PercentIndicactor());
                PercentIndicactor();
              }), child: const Icon(Icons.add),),
            ),
            
          ],
        ),
      ),
    );
  }
}