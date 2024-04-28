import 'package:cloud_firestore/cloud_firestore.dart';

create(String CollName ,DocName ,Username,Email, ImageUrl ,Address)async{
  await FirebaseFirestore.instance.collection(CollName).doc(DocName).set({'name':Username,'email': Email,'imageUrl': ImageUrl,'address': Address });
  print('Database Created');
}


update(String CollName , DocName ,Feild ,var NewFeildValue  )async{
  await FirebaseFirestore.instance.collection(CollName).doc(DocName).update({Feild : NewFeildValue });
print('Database Updated');
}

delete(String Collname ,DocName)async{
  await  FirebaseFirestore.instance.collection(Collname).doc(DocName).delete();

}