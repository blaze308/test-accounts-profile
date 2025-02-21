import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:test/api/api_service.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final ImagePicker picker = ImagePicker();
  File? _image;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildImagePicker(double width, double height) {
    return DottedBorder(
      color: Colors.black, // Dotted border color
      strokeWidth: 1,
      dashPattern: [6, 3], // Pattern of the dotted border
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: Container(
        width: double.infinity,
        height: height * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: InkWell(
          onTap: _pickImage,
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/document_download.svg",
                      width: width * 0.06,
                      height: width * 0.06,
                    ),
                    SizedBox(height: height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Drag and drop or ',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: width * 0.035,
                          ),
                        ),
                        Text(
                          'Select',
                          style: TextStyle(
                            color: const Color(0xFF102340),
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.008),
                    Text(
                      'Supported formats: png, jpg, jpeg, apple format.',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: width * 0.03,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required double width,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isRequired = true,
    Widget? prefix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: width * 0.035,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            if (isRequired)
              Text(
                ' *',
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: width * 0.035,
                ),
              ),
          ],
        ),
        SizedBox(height: width * 0.02),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(fontSize: width * 0.035),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: width * 0.03,
                horizontal: width * 0.04,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey[500], // Light color for hint text
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              prefixIcon: prefix,
              filled: true,
              fillColor: Colors.white,
            ),
            validator: isRequired
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return "$label is required";
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField(double width) {
    return _buildTextField(
      label: 'Phone number',
      controller: phoneNumberController,
      width: width,
      hintText: "0244123456",
      keyboardType: TextInputType.phone,
      prefix: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: width * 0.03,
        ),
        margin: EdgeInsets.only(right: width * 0.02),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),
        child: Text(
          '+233',
          style: TextStyle(
            fontSize: width * 0.035,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[80],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.08),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title: Text(
            "Update profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile photo',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          _buildImagePicker(width, height),
                          SizedBox(height: height * 0.025),
                          _buildTextField(
                            label: 'Full name',
                            controller: fullNameController,
                            width: width,
                            hintText: "Kweku Asante",
                          ),
                          SizedBox(height: height * 0.025),
                          _buildPhoneField(width),
                          SizedBox(height: height * 0.025),
                          _buildTextField(
                            label: 'Email',
                            controller: emailController,
                            width: width,
                            hintText: "kweku@mailinator.com",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    List<String> nameParts =
                        fullNameController.text.trim().split(" ");
                    String firstName = nameParts.isNotEmpty ? nameParts[0] : "";
                    String lastName = nameParts.length > 1
                        ? nameParts.sublist(1).join(" ")
                        : "";

                    await ApiService().updateAccount(
                      context: context,
                      firstName: firstName,
                      lastName: lastName,
                      address: emailController.text,
                      phoneNumber: phoneNumberController.text,
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Please fill al required fields"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.maxFinite, 50),
                  backgroundColor: const Color(0xFF102340),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Save changes",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
