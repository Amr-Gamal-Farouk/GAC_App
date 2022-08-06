import 'package:flutter/material.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/widget/employ_item.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _textEditingController;
  late UserProvider _userState;
  @override
  void initState() {
    super.initState();
    _textEditingController=TextEditingController();
    _userState = Provider.of<UserProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Row(children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(

                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        const BorderSide(width: 0.8, color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(width: 0.8, color: Colors.white
                        ),                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(width: 0.8, color: Colors.white
                        ),                      ),
                      hintText: "Search",

                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                          // color: Colors.indigo,
                        ),
                        onPressed: () async {

                        },
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _textEditingController.clear();
                            _userState.resetSearch();
                          });
                        },
                      )),
                  cursorColor: Colors.indigo,

                  onChanged: (value) {
                    if(_textEditingController.text.isEmpty||_textEditingController.text==" ") {
                      _userState.resetSearch();
                      _textEditingController.clear();

                      }else{

                      _userState.searchAction(
                          searchKey: _textEditingController.text.trim());
                    }
                    },
                ),
              ),

               Padding(
                   padding: const EdgeInsets.only(left: 12.0),
                 child: InkWell(
                   onTap: (){
                     Navigator.pop(context);
                   },

                    child: Text("Cancel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic)),


              ),
               )


            ],),
          ),
          
          Consumer<UserProvider>(
  builder: (context, provider, child) {
  return Expanded(child: ListView.builder(
    itemCount: provider.employeeSearchList.length,
              itemBuilder: (context, index) => EmployItem(employ: provider.employeeSearchList[index],), ));
  },
)
        ],
      ),
    ));
  }
}
