import 'package:flutter/material.dart';

class InHealthy extends StatefulWidget {
  @override
  _InHealthy createState() => _InHealthy();
}

class _InHealthy extends State<InHealthy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('You are in Good Health'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Image(image: AssetImage('assets/images/health.jpg')),
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'You are Good',
                          style: TextStyle(fontSize: 50, color: Colors.green)
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
