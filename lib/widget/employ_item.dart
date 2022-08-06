
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gac/data_provider/model/employ_model.dart';
import 'package:gac/provider/user_provider.dart';
import 'package:gac/screen/details_screen.dart';
import 'package:gac/widget/dialogs.dart';
import 'package:provider/provider.dart';

class EmployItem extends StatefulWidget {
  EmployModel employ;
   EmployItem({Key? key,required this.employ}) : super(key: key);

  @override
  State<EmployItem> createState() => _EmployItemState();
}

class _EmployItemState extends State<EmployItem> {
  bool isFavorite=false;
  bool isHovering=false;
  @override
  Widget build(BuildContext context) {
    var mWidth =MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration:  BoxDecoration(
          color: isHovering?Colors.white12:Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Row(
             children: [
               Container(
                 width: 40,
                 height: 40,
                 decoration: const BoxDecoration(
                     // image: DecorationImage(image: AssetImage("assets/images/user.png"))
                 ),
                 child: Icon(Icons.person,color: Colors.indigo),
               ),
               const SizedBox(width: 20,),
                // Text(widget.employ.empFullName),
                SizedBox(
                  width: mWidth*0.55,
                    child: Text(widget.employ.name,
                        style: TextStyle(fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontStyle: FontStyle.italic),overflow: TextOverflow.ellipsis)),
             ],
           ),
            InkWell(
              child: Container(
                width: 27,
                height: 27,
                decoration:  BoxDecoration(
                    // image: DecorationImage(image: (Provider.of<UserProvider>(context, listen: true).isFavorite(employModel: widget.employ))?
                    // AssetImage("assets/images/is_favorites.png"):AssetImage("assets/images/add_to_favorites.png"))
                ),
                child: Provider.of<UserProvider>(context, listen: true).isFavorite(employModel: widget.employ)?
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.favorite_outlined,color: Colors.indigo),
                ):
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Icon(Icons.favorite_border,color: Colors.indigo),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Icon(Icons.add,size: 20,color: Colors.yellow),
                    ),

                  ],
                ),

              ),
              onTap: (){
                Provider.of<UserProvider>(context, listen: false).favoriteAction(employModel: widget.employ);
              },
            )


          ],
        ),

      ),
      onHover: (hovering) {
        print(isHovering);
      setState(() => isHovering = hovering);
    },
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(employee: widget.employ ),));

      },
    );
  }
}
