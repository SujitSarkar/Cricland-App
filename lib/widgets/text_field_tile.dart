import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../variables/color_variable.dart';
import '../../variables/config.dart';

class TextFieldTile extends StatefulWidget {
  const TextFieldTile({Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.onTap,
    this.obscure=false,
    this.readOnly=false,
    this.textInputType,
    this.textCapitalization,
    this.prefixIcon, this.maxLine}) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final bool obscure;
  final bool readOnly;
  final int? maxLine;
  final Function()? onTap;

  @override
  _TextFieldTileState createState() => _TextFieldTileState();
}

class _TextFieldTileState extends State<TextFieldTile> {
  bool _obscure=true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextField(
      controller: widget.controller,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      obscureText: widget.obscure? _obscure:false,
      keyboardType: widget.textInputType??TextInputType.text,
      textCapitalization: widget.textCapitalization??TextCapitalization.none,
      maxLines:  widget.maxLine??1,
      minLines: 1,
      style: TextStyle(
        color: AllColor.textColor,
        fontSize: dSize(.04),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey,width: .5),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueGrey,width: .5),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AllColor.primaryColor,width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.03)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: AllColor.hintColor,
            fontSize:dSize(.04),
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
        color: AllColor.hintColor,
        fontSize:dSize(.04),
        fontWeight: FontWeight.w500,
      ),
          prefixIcon: widget.prefixIcon!=null?Padding(
            padding: EdgeInsets.only(right: dSize(.02),left: dSize(.02)),
            child: Icon(widget.prefixIcon,size: dSize(.06)),
          ):null,
          suffixIconConstraints: BoxConstraints.loose(size),
          prefixIconConstraints: BoxConstraints.loose(size),
          suffixIcon: widget.obscure
              ? InkWell(
            onTap: ()=>setState(()=> _obscure=!_obscure),
            child: Padding(
              padding: EdgeInsets.only(right:dSize(.08)),
              child: Icon(_obscure?LineAwesomeIcons.eye_slash:LineAwesomeIcons.eye,
                  size: dSize(.06),
                  color: Colors.grey.shade600),
            ),
          ) : null
      ),
    );
  }
}




class LoginTextFieldTile extends StatefulWidget {
  const LoginTextFieldTile({Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.onTap,
    this.obscure=false,
    this.readOnly=false,
    this.textInputType,
    this.textCapitalization,
    this.prefixIcon, this.maxLine}) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final bool obscure;
  final bool readOnly;
  final int? maxLine;
  final Function()? onTap;

  @override
  _LoginTextFieldTileState createState() => _LoginTextFieldTileState();
}

class _LoginTextFieldTileState extends State<LoginTextFieldTile> {
  bool _obscure=true;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextField(
      controller: widget.controller,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      obscureText: widget.obscure? _obscure:false,
      keyboardType: widget.textInputType??TextInputType.text,
      textCapitalization: widget.textCapitalization??TextCapitalization.none,
      maxLines:  widget.maxLine??1,
      minLines: 1,
      style: TextStyle(
        color: AllColor.textColor,
        fontSize: dSize(.04),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide:  BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide:  BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: dSize(.04),vertical: dSize(.03)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: AllColor.hintColor,
            fontSize:dSize(.04),
            fontWeight: FontWeight.w500,
          ),
          hintStyle: TextStyle(
            color: AllColor.hintColor,
            fontSize:dSize(.04),
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: widget.prefixIcon!=null?Padding(
            padding: EdgeInsets.only(right: dSize(.02),left: dSize(.02)),
            child: Icon(widget.prefixIcon,size: dSize(.06)),
          ):null,
          suffixIconConstraints: BoxConstraints.loose(size),
          prefixIconConstraints: BoxConstraints.loose(size),
          suffixIcon: widget.obscure
              ? InkWell(
            onTap: ()=>setState(()=> _obscure=!_obscure),
            child: Padding(
              padding: EdgeInsets.only(right:dSize(.08)),
              child: Icon(_obscure?LineAwesomeIcons.eye_slash:LineAwesomeIcons.eye,
                  size: dSize(.06),
                  color: Colors.grey.shade600),
            ),
          ) : null
      ),
    );
  }
}