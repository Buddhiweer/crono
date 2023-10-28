import 'package:crono/pages/youInhealthy.dart';
import 'package:flutter/material.dart';
import '../drawer/drawer_widget.dart';
import 'DetailsShow.dart';

class FormScreen extends StatefulWidget{
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}
  bool passTogle = true;
  final _formfield = GlobalKey<FormState>();

  class _FormScreenState extends State<FormScreen>{

    void clearText(){
      _controller[0].clear();
      _controller[1].clear();
      _controller[2].clear();
      _controller[3].clear();
    }

  List<String> imageList = [
    'assets/images/heart.jpg',
    'assets/images/temperature.jpg',
    'assets/images/respi.jpg',
    'assets/images/blood.jpg'
    ];
  List<String> textList = [
    'Heart Rate',
    'Temperature',
    'Respiration Rate',
    'Blood Pressure'
  ];
  // ignore: prefer_final_fields
  List<TextEditingController> _controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()

  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar:  AppBar(
            leading: const DrawerWidget(),
          title: const Text("Enter Your"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 600,
                    width: 600,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: GridView.builder(
                            itemCount: imageList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 275,
                            ), itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: AssetImage(imageList[index]),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _controller[index],
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    labelText: textList[index],labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (value){
                                    bool emailValid = RegExp(r"^[0-9]{1,4}").hasMatch(value!);
                                    if (value.isEmpty){
                                      return "Enter ${textList[index]}";
                                    }else if (!emailValid){
                                      return "Enter Valid ${textList[index]}";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),),
                ],
              ),
            ) ,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton.extended(
                label: const Text('Reset'),
                onPressed: () {
                  clearText();
                },
              ),
              FloatingActionButton.extended(
                label: const Text('Submit'),
                onPressed: () {
                  int heartValue = int.parse(_controller[0].text);
                  int tempValue = int.parse(_controller[1].text);
                  int respireValue = int.parse(_controller[2].text);
                  int bloodValue = int.parse(_controller[3].text);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailShow(name1: _controller[0].text, email1: _controller[1].text, phone1 : _controller[2].text)));
                  if(  heartValue>140 ){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailShow(
                        heart: _controller[0].text,
                        temp: _controller[1].text,
                        resp : _controller[2].text,
                        blood : _controller[3].text)));
                  }
                  else if(tempValue>99 ){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailShow(
                        heart: _controller[0].text,
                        temp: _controller[1].text,
                        resp : _controller[2].text,
                        blood : _controller[3].text)));
                  }
                  else if(respireValue>20){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailShow(
                        heart: _controller[0].text,
                        temp: _controller[1].text,
                        resp : _controller[2].text,
                        blood : _controller[3].text)));
                  }
                  else if( bloodValue>129){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Processing Data')),);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailShow(
                        heart: _controller[0].text,
                        temp: _controller[1].text,
                        resp : _controller[2].text,
                        blood : _controller[3].text)));
                  }
                  else if(heartValue<140 && tempValue<99 && respireValue<20 && bloodValue<129){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InHealthy()));
                  }
                },
              )
            ],
          ),
        )
    );
  }
}