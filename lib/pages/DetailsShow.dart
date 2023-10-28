import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailShow extends StatefulWidget {
  String heart, temp, resp, blood;
  DetailShow(
      {Key? key, required this.heart, required this.temp, required this.resp, required this.blood})
      : super(key: key);

  @override
  _DetailShowState createState() => _DetailShowState(heart: heart, temp: temp, resp: resp, blood:blood);
}


class _DetailShowState extends State<DetailShow> {

  String heart, temp, resp, blood;
  bool value = false;

  _DetailShowState({ required this.heart, required this.temp, required this.resp, required this.blood});

  final numberController = TextEditingController();
  final nameController = TextEditingController();
  final messageController = TextEditingController();
  final allChecked = CheckBoxModal(title: 'All Checked');

  // List<String> recipents = ["9876543210", "8765432190"];
  // void _sendSMS(String sms, phoneNumber) async {
  //   String phoneNumber =  numberController.text;
  //   String sms = messageController.text;
  //   String _result = await sendSMS(message: sms, recipients: phoneNumber)
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }

  void _openWhatsAppChat() async {
    String phoneNumber =  numberController.text;
    String message = messageController.text;

    var url = 'https://wa.me:/$phoneNumber?text=$message\nHeart Rate: $heart\nTemperature: $temp\nRespiration Rate:$resp\nBlood Pressure: $blood';
    await launch(url);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Form"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Doctor Name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Here...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              const Text('Mobile Number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  prefixText: '+94',
                  hintText: 'Enter Here...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              ListTile(
                leading: Checkbox(
                  value: allChecked.value,
                  onChanged: (value){
                    setState(() {
                      allChecked.value = !allChecked.value;
                    });
                  },
                ),
                title: Text(allChecked.title),
              ),
              const Text('Message :',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10,),
              TextFormField(
                minLines: 2,
                maxLines: 5,
                controller: messageController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    hintText: 'Enter Message Here...',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                _openWhatsAppChat();
              }, child: const Text("Send Whatsapp"),
              ),
               // ElevatedButton(onPressed: (){
               //   _sendSMS("This is a test message!", recipents);
               // }, child: Text('Send SMS'))
            ],
          ),
        ),
      ),
    );
  }

}
class CheckBoxModal{
  String title;
  bool value;
  CheckBoxModal({required this.title, this.value= false});
}
