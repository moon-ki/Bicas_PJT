﻿var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var TransactionSchema = new Schema({
    blockHash : String,
    user_id : String,
    name : String,
    from : String,
    to : String,
    ether : String,
    t_hash : String,
    gas : String,
    gasPrice : String,
    input : String,
    r : String,
    s : String,
    v : String,
    transactionIndex : String,
    Nonce : String,
    time : {
        type : Date,
        default : Date.now()
    }
});

// 회원정보 id 자동증가
TransactionSchema.plugin( autoIncrement.plugin,
    {
        model : "transaction",
        field : "id",
        startAt : 1
    }
);

// numberFormat 적용
TransactionSchema.virtual('getAmountFormat').get(function(){
    // 1000원을 1,000원으로 바꿔준다.
    return new Intl.NumberFormat().format(this.price);
});


module.exports = mongoose.model('transaction', TransactionSchema);

