var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 트랜잭션 스키마를 정의한다.
var RequestSchema = new Schema({
    user_id : String,
    // {
    //     type: mongoose.Schema.Types.ObjectId,
    //     ref:'user'
    // },
    
    name : String,
    form_type: String,
    form_name: String,
    // ##################################################
    //                  0. 신청업무
    //신청 xmlString
    apply_xml:String,
    //신청 ipfs
    apply_ipfs:String,
    //신청 xmlString
    accept_xml:String,
    // ##################################################
    //                  1. 납부업무
    //수수료납부여부
    fee_yn : {
        type: String,
        default: 'N'
    },
    //수수료 납부거래 트랜젝션
    fee_tx:String,
    // ##################################################
    //                  2. 승인업무
    // 승인여부
    accept_yn : {
        type: String,
        default: 'N'
    },
    //승인 컨트랙트 생성 트랜젝션
    accept_tx:String,
    // ##################################################
    //                  3. 증명업무
    //증명서승인여부
    certi_yn : {
        type: String,
        default: 'N'
    },
    //증명 컨트랙트 생성 트랜젝션
    certi_tx:String,
    //증명 컨트랙트 xmlString
    certi_xml:String,
    //증명 ipfs
    certi_ipfs:String,
    //증명서 승인여부
    certi_yn:{
        type: String,
        default: 'N'
    },
    // ##################################################
    // 신청시간
    created_at : {
        type : Date,
        default : Date.now()
    },
    // 납부시간
    certi_at:{
        type : Date
        // default : Date.now()
    },
    file_name:String,
    form_type : String,
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
    var date = new Date(this.certi_at);
    var result;

    if(isNaN(date.getFullYear())){
        result = {
            year : '',
            month : '',
            day : '',
            hour : '',
            minute : ''
            // second : ''
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