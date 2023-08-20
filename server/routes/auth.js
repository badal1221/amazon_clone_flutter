const express=require("express");
const User=require("../models/user");
const bcryptjs=require("bcryptjs");
const jwt=require("Jsonwebtoken");

const authRouter=express.Router();

authRouter.post("/api/signup",async (req,res)=>{
    //get data from client
    try{
            const {name,email,password}=req.body;
            const existingUser= await User.findOne({email});
            if(existingUser){
              return res.status(400).json({msg:"User with same email already exists!"});
            }
            const hashedpassword=await bcryptjs.hash(password,8);
            //post data in database
            let user=new User({
               name,
               email,
               password:hashedpassword,
            });
            user= await user.save();
            res.json(user);
            //return data to user
    }catch(e){
      res.status(500).json({error:e.message});
    }
});

authRouter.post("/api/signin",async(req,res)=>{
  try{
     const {email,password}=req.body;
     const user=await User.findOne({email});
     if(!user){
         return res.status(400).json({msg:"This email does not exists"});
     }
     const isMatch=await bcryptjs.compare(password,user.password);
     if(!isMatch){
        return res.status(400).json({msg:"Incorrect password"});
     }
     const token=jwt.sign({id:user._id},"passwordKey");
     res.json({token,...user._doc});

  }catch(e){
    res.status(500).json({error:e.message});
  }
});

authRouter.post('/tokenIsValid',async(req,res)=>{
  try{
     const token=req.header('x-auth-token');
     if(!token)return res.json(false);
     const verified=jwt.verify(token,"passwordKey");
     if(!isVerified) return res.json(false);
     const user=await User.findById(verified.id);
     if(!user) return res.json(false);
     res.json(true);
  }catch(e){
    res.status(500).json({error:e.message});
  }
});

//get user data
const auth=require("../middlewares/auth");
authRouter.get('/',auth,async (req,res)=>{
   const user=await User.findById(req.user);
   res.json({...user._doc,token:req.token});
});

module.exports=authRouter;
