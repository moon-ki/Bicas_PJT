var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var autoIncrement = require('mongoose-auto-increment');

// 증명서 스키마를 정의한다.
var CertiYn = new Schema({

    user_id : {
        type : String
    },
    graduate_yn : {
        type: String,
        default: 'N'
    },
    attend_yn : {
        type: String,
        default: 'N'
    },
    score_yn : {
        type: String,
        default: 'N'
    },
    graduate_ipfs : String,
    attend_ipfs : String,
    score_ipfs : String
});

// 회원정보 id 자동증가
CertiYn.plugin( autoIncrement.plugin,
    {
        model : "certiYn",
        field : "id",
        startAt : 1
    }
);


module.exports = mongoose.model('certiYn', CertiYn);

