const mongoose=require('mongoose');
const orderSchema=mongoose.Schema({

   products:[{
           product:productSchema,
           quantity:{
               type:Number,
               required:true,
           },
       },
   ],
   totalPrice:{
      type:Number,
      require:true,
   },
   address:{
         type:String,
         require:true,
   },
   userId:{
      type:String,
      require:true,
   },
   orderAt:{
       type:Number,
       require:true,
   },
   status:{
      type:Number,
      default:0,
   },
});
const Order=mongoose.model('Order',orderSchema);
module.exports=Order;