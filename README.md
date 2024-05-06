# cashier_mate

A new Flutter project.

## Features
- Home Page
- Add Menu
- Order Menu
- Settings

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
https://pub.dev/packages/idempiere_rest/example
https://github.com/devcoffee/idempiere_rest

## Create new class from json 

1) from postman get json from {{protocol}}://{{host}}:{{port}}/api/v1/models/table
2) copy json to
   https://javiercbk.github.io/json_to_dart/,
   https://json2csharp.com/code-converters/json-to-dart ,
   https://dart-quicktype.netlify.app/
   name of genarated class 'tablename'  (modeltablename),
       ? replace ADClientID with ReferenceID ? ( be careful case sensitive)
3) create dart file 'tablename' in ../models/ and copy generated class into it
4) in models create model class for generated table. It is class with custom methods/functions over table 