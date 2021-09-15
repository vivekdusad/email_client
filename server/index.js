const express = require('express')();
const contacts = require('./contacts.json');

express.get("/contacts",(req,res)=>{
    var q = req.query.name;
    console.log(q);
    let contact = contacts;
    if(q){
       contact= contacts.filter(({name})=>name.match(q));
    }
    res.send(contact);
})

express.listen(3000,()=>{
    console.log("server is running");
})