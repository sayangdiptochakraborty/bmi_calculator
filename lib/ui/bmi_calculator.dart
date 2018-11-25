import 'package:flutter/material.dart';

class BMI extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new BMICalculator();
  }
}
class BMICalculator extends State<BMI>
{
  final TextEditingController _weight=new TextEditingController();
  final TextEditingController _height=new TextEditingController();
  var _bmi=21.05;
  String _situ="";
  void bmiCalculate()
  {
    setState(() {
      _bmi=double.parse(_weight.text)/(double.parse(_height.text)*double.parse(_height.text));
      _bmi=_bmi*100*100; //converting to metres
      if(_bmi<15)
        {
          _situ="Very Severly UnderWeight";
        }
       else if(_bmi<16)
         {
           _situ="Severely UnderWeight";
         }
         else if(_bmi<18.5)
           {
             _situ="UnderWeight";
           }
           else if(_bmi<25)
             {
               _situ="Normal - Healthy Weight";
             }
             else if(_bmi<30)
               {
                 _situ="OverWeight";
               }
               else if(_bmi<35)
                 {
                   _situ="Moderately Obese";
                 }
                 else if(_bmi<40)
                   {
                     _situ="Severely Obese";
                   }
                   else
                     {
                       _situ="Very Severely Obese";
                     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI Calculator",style: new TextStyle(color: Colors.black,fontSize: 25.0),),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent.shade200,
      ),
      backgroundColor: Colors.purpleAccent.shade50,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(5.0),
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                      controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your Weight in kg",
                      hintText: 'Example: 63.5',
                      icon: new Icon(Icons.airline_seat_recline_normal)
                    ),
                  ),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your height in cms",
                      hintText: "Example: 173",
                      icon: new Icon(Icons.accessibility)
                    ),
                  )
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(5.0),
              child: new Column(
                children: <Widget>[
                  new RaisedButton(onPressed: bmiCalculate, padding: const EdgeInsets.all(5.0),textColor: Colors.white70,color: Colors.purpleAccent,child: new Text("Calculate"),),
                  new Text("Your BMI is ${_bmi.toStringAsFixed(2)}",style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: (_bmi<18.5 || _bmi>25)?Colors.red:Colors.green),),
                  new Text("You're $_situ",style: new TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: (_bmi<18.5 || _bmi>25)?Colors.red:Colors.green),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}