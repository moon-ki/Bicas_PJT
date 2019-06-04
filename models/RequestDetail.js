var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var RequestSchema = new Schema({
    user_id : String,
    name : String,
    form_type: String,
    form_name: String,
    created_at : {
        type : Date,
        default : Date.now()
    },
    fee_yn : {
        type: String,
        default: 'N'
    },
    accept_yn : {
        type: String,
        default: 'N'
    },
    ipfs_hash:String,
    fee_tx:String,
    accept_tx:String,
    accept_at:{
        type : Date
        // default : Date.now()
    },
    file_name:String,
    xml_string:String,
    form_type : String
});

// 회원정보 id 자동증가
RequestSchema.plugin( autoIncrement.plugin,
    {
        model : "requestdetail",
        field : "seq",
        startAt : 1
    }
);

// numberFormat 적용
RequestSchema.virtual('getCreatedTime').get(function(){

    function pad(n, width) {
        n = n + '';//string 변환
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }   

    // 변수 date에 Date객체를 생성하고 해당 스키마의 create_at라는 데이터를 받아온다.
    var date = new Date(this.created_at);
    // 받아온 값을 return
    return {
        year : date.getFullYear()+'.',
        month : pad(date.getMonth()+1,2)+'.',
        day : pad(date.getDate(),2),
        hour : pad(date.getHours(),2)+':',
        minute : pad(date.getMinutes(),2),
        // second : pad(date.getSeconds(),2)
    };
});

RequestSchema.virtual('getAcceptTime').get(function(){

    function pad(n, width) {
        n = n + '';//string 변환
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }   

    // 변수 date에 Date객체를 생성하고 해당 스키마의 accept_at 라는 데이터를 받아온다.
    var date = new Date(this.accept_at);
    var result;

    console.log(date.getFullYear());
    if(isNaN(date.getFullYear())){
        result = {
            year : '',
            month : '',
            day : '',
            hour : '',
            minute : '',
            second : ''
        };
    }else{
        result = {
            year : date.getFullYear()+'.',
            month : pad(date.getMonth()+1,2)+'.',
            day : pad(date.getDate(),2),
            hour : pad(date.getHours(),2)+':',
            minute : pad(date.getMinutes(),2),
            // second : pad(date.getSeconds(),2)
        };
    }
    // 받아온 값을 return
    // console.log(result);
    return result;
});


module.exports = mongoose.model('requestdetail', RequestSchema);