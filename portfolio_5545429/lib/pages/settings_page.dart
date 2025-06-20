import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, bool> initialSettings;
  // sau this.initialSettings : them de bo tro cho main.dart. tsao them const cho settingspage ??(dong so 6)
  const SettingsPage({required this.initialSettings, Key? key}) : super(key:key);
  // them ca cai phan override nay luon ??
  @override
  _SettingsPageState createState() => _SettingsPageState();
}
  //tao class ????
  class _SettingsPageState extends State<SettingsPage> { 
  // them dinh dang cho 4 cai variable o duoi ? late la gi ??
  late bool newsletter;
  late bool updates;
  late bool darkMode;
  late bool offlineMode;

  //@Override : khong can them ?
  void initState() {
    super.initState();
    // khong nhung cho them vao, con cho thenm ca widget dang truoc , false dang sau ?
    newsletter =widget.initialSettings['Newsletter'] ?? false;
    updates = widget.initialSettings['Updates'] ?? false;
    darkMode = widget.initialSettings['Dunkler Modus'] ?? false;
    offlineMode = widget.initialSettings['Offline-Modus'] ?? false;
}
// bo phan nay di sau khi mo rong
// class _SettingsPageState extends State<SettingsPage> {
  // bool newsletter = false;
  // bool updates = false;
  // bool darkMode = false;
  // bool offlineMode = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Einstelllungen')),
      body: Column(
        children: [
          CheckboxListTile(title: Text('Newsletter abbonieren'),value: newsletter, onChanged:(val) => setState(()=> newsletter = val!),),

          CheckboxListTile(title: Text('Updates erhalten'), value: updates, onChanged: (val) => setState(() => updates = val!),),

          SwitchListTile(title: Text('Dunkler Modus'),value: darkMode,onChanged: (val) => setState(() => darkMode = val ),),

          SwitchListTile(title: Text('Offline-Modus'),value: offlineMode,onChanged: (val) => setState(() => offlineMode = val),),

          Padding(padding: const EdgeInsets.all(16),
          child: Text('Auswahl:\nNewsletter : $newsletter\nUpdates: $updates\nDunkel: $darkMode\nOffline: $offlineMode', textAlign: TextAlign.center,),),
        ],
      ),
    );
  }
}