//imports from packages
const express=require('express');//import 'package:express/express.dart
const mongoose=require('mongoose');

//imports from other files
const authRouter=require('./routes/auth');//importing auth.js

//init
const PORT=process.env.PORT||3000;
const app=express();
const DB=
"mongodb+srv://Badal:kyunbatau@cluster0.3gqq5r8.mongodb.net/?retryWrites=true&w=majority";

//middleware
//CLINT->middleware->SERVER->CLINT
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

//connection
mongoose.connect(DB).then(() => {
    console.log("Connection Successful");
  }).catch((e) => {
    console.log(e);
  });

//localhost
app.listen(PORT,'0.0.0.0',()=>{
   console.log(`Connected at port ${PORT}`);
});
