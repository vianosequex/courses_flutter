import 'package:flutter/material.dart';

class AsyncSample extends StatefulWidget {
  const AsyncSample({Key? key}) : super(key: key);

  @override
  State<AsyncSample> createState() => _AsyncSampleState();
}

class _AsyncSampleState extends State<AsyncSample> {

  SandGlass clock = SandGlass();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clock.tick();
  }

  _reDrawTime() async{
    if (clock.time() == 0) {
      return;
    }
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      //print('_reDrawTime()');
    });
  }

  @override
  Widget build(BuildContext context) {
    /*if (clock.time()== 0 ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('End tick', textAlign: TextAlign.center,), backgroundColor: Colors.green,
      ));
    }*/ //???????????????????????????????
    _reDrawTime();
     return Center(
       child: Text('Time is: ${clock.time()}'),
    );
  }
}

class SandGlass {
  int _sand = 0;

  time(){
    return _sand;
  }

  tick() async{
    _sand = 50;
    print('Start tick!');

    while (_sand > 0){
      print('tick $_sand');
      _sand--;

      await Future.delayed(Duration(milliseconds: 100));
    }
  }
}
