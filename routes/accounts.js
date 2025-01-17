var express = require('express');
var router = express.Router();

//DB Schema Load
var UserModel = require('../models/UserModel');
var CertiYnModeil=require('../models/certiYnModel');
var TransactionModel = require('../models/Transaction');
var RequestDetailModel = require('../models/RequestDetail');
var TransactionListModel = require('../models/TransactionList');

// 상세 페이지를 위해 transaction DB를 로드한다.
var passwordHash = require('../libs/passwordHash');

// 로그인 설정관련 모듈
var co = require('co');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var session = require('express-session');
var loginRequired = require('../libs/loginRequired');
var paginate = require('express-paginate');

//엔진 API호출 및 파일생성을 위한 모듈 호출
var request = require('request');
var fs = require('fs');

// var async = require('async');
// const ipfsAPI = require('ipfs-api');

// serialize, deserialize : 실질적으로 session은 done에 담긴다.
// 시리얼, 디시리얼은 나누는 이유는 시리얼에서 아이디를 받아와서 디시리얼에서 분기정책을 정해준다.
// 로그인 성공시 먼저 실행되고 디시리얼이 실행된다. 
passport.serializeUser(function (user, done){

    console.log('serializeUser');
    done(null, user);
});
// 로그인 성공했을 때 콘솔화면에 나오는 메서드
passport.deserializeUser(function (user, done) {
    var result = user;
    result.password = user.password;
    console.log('deserializeUser');

    UserModel.findOne(
        {
            _id : user._id
        }, function(err, result){
            done(null, result);
        }
    );  
});
// 로그인 처리 프로세스 및 로그인관련 passport 정책설정
passport.use(new LocalStrategy({

    usernameField : 'user_id',
    passwordField : 'password',
    passReqToCallback : true
    }, function(req, user_id, password, done){
        
        UserModel.findOne(
            {
                user_id : user_id,
                password : password
            }, function(err, user){
                
                UserModel.findOne({
                    user_id : user_id,
                    password : password
                }, function(err, user){
                    
                    if(!user){
                        return done(null, false, { message : '아이디 또는 비밀번호 오류'});
                    }else{
                        return done(null, user);
                    }   
                });
            }
        );
    }
));

// account app 출력(페이지 확인)
router.get('/', function(req, res){
    res.send('account app');
});

// 회원가입 페이지
router.get('/join', function(req, res){
    res.render('accounts/join');
});

// 회원가입 처리 프로세스
router.post('/join', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다
    console.log(req.body.user_id);
    var User = new UserModel({
        user_id : req.body.user_id,
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        password : req.body.password,
        major : req.body.major,
        blockchainid : req.body.blockchainid,
        blockchainpwd : req.body.blockchainpwd,
        user_name : req.body.user_name,
        // user_phone : req.body.user_phone,
        // user_sex : req.body.user_sex,
        user_birth : req.body.user_birth,
        // user_email : req.body.user_email,
        // user_addr : req.body.user_addr,
        // user_addr2 : req.body.user_addr2,
        // user_post : req.body.user_post
    });
    User.save(function(err){
        res.send('<script>alert("회원가입 성공");\
        location.href="/accounts/login";</script>');
    });

    var CertiYn = new CertiYnModeil({
        user_id : req.body.user_id
    });
    CertiYn.save();
});

// 로그인 페이지
router.get('/login', function(req, res){
    
    res.render('accounts/login',
        {
            flashMessage : req.flash().error
        }
    );
});

// 로그인 처리 프로세스
router.post('/login', 
    passport.authenticate('local', 
        {
            failureRedirect : '/accounts/login',
            failureFlash : true
        }), function(req, res){
            res.send('<script>alert("로그인 성공");location.href="/home";</script>');
        }
);

router.get('/success', function(req, res){
    res.send(req.user);
});

router.get('/logout', function(req, res){
    req.logout();
    res.redirect('/accounts/login');
});


// GET 내 정보 수정 페이지
router.get('/myinfo', loginRequired, function(req, res){

    console.log('myinfo 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/myinfo.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/myinfo.ejs', { user : req.user });
        }
    }   
});

// POST 내 정보 수정처리
router.post('/myinfo', loginRequired, function(req, res){
    // 수정 된 내 정보 데이터 받기
        var _id = req.user._id;
        var user_id = req.body.user_id;
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        var password = req.body.password;
        var major = req.body.major;
        var blockchainid = req.body.blockchainid;
        var blockchainpwd = passwordHash(req.body.blockchainpwd);
        var user_name = req.body.user_name;
        var user_phone = req.body.user_phone;
        var user_sex = req.body.user_sex;
        var user_birth = req.body.user_birth;
        var user_email = req.body.user_email;
        var user_addr = req.body.user_addr;
        var user_addr2 = req.body.user_addr2;
        var user_post = req.body.user_post;
        // var cur_balance = req.body.cur_balance;
    
        // 업데이트 처리 
    UserModel.update(
        // 로그인한 사용자의 몽고디비 아이디를 받는다.
        {
            _id : _id
        },
        {   // 몽고디비 아이디에 맞는 회원정보 데이터베이스를 일치하는 doc대로 수정한다.
            $set : {
                
                user_id : user_id,
                // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
                password : password,
                major : major,
                blockchainid : blockchainid,
                blockchainpwd : blockchainpwd,
                user_name : user_name,
                user_phone : user_phone,
                user_sex : user_sex,
                user_birth : user_birth,
                user_email : user_email,
                user_addr : user_addr,
                user_addr2 : user_addr2,
                user_post : user_post
            }
        }, function(err){
            // 에러가 발생하면 Error
            if(err){
                throw err;
            }else{  // 발생하지 않으면 회원정보 수정페이지로 이동한다.
                res.redirect('/accounts/myinfo');
            }
        }
    );

});

// get 내 wallet보기 페이지
router.get('/wallet', loginRequired, async(req, res)=>{

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');

    }else{
        // if(Array.isArray(req.user)){
        //     res.render('accounts/wallet.ejs', { user : req.user[0]._id });
        // }else{
        //     res.render('accounts/wallet.ejs', { user : req.user });
        // }

        var result = await CertiYnModeil.findOne({"user_id" : req.user.user_id}).limit(req.query.limit).skip(req.skip).exec();
        console.log(result);
        var Web3 = require('web3');
        var provider = 'http://220.76.95.91:8485';
        var web3 = new Web3(new Web3.providers.HttpProvider(provider));
        web3.eth.getBalance(req.user.blockchainid, 
            function(err, balance){
                res.render('accounts/wallet', { user:req.user, 
                                                balance : balance/1000000000000000000,
                                                certiData:result});  
            });
    }   
});

// get 내 songguem보기 페이지
router.get('/songguem', loginRequired, function(req, res){

    console.log('songguem 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/songguem.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/songguem.ejs', { user : req.user });
        }
    }   
});

router.post('/songguem', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다
    var Transaction = new TransactionModel({
        blockHash : req.body.blockHash,
        user_id : req.body.user_id,
        name : req.body.user_name,
        from : req.body.blockchainid,
        to : req.body.otherblockchainid,
        t_hash : req.body.t_hash,
        gas : req.body.gas,
        gasPrice : req.body.gasPrice,
        input : req.body.input,
        r : req.body.r,
        s : req.body.s,
        v : req.body.v,
        transactionIndex : req.body.transactionIndex,
        // Nonce : req.body.gas,
        // block_No : req.body.block_No,
        // IPFS_hash : passwordHash(req.body.IPFS_hash),
        ether : req.body.ether
        // Nonce : req.body.Nonce,
    });
    Transaction.save(function(err){
        res.send('<script>alert("내역저장 성공");\
        location.href="/accounts/songguem";</script>');
    });
});

//사용자 ID check 프로세스
router.post('/checkUser', async (req,res) => {

    await Promise.all([
        UserModel.count({"user_id" : req.body.user_id},function(err, count){
            if(count==0){
                console.log('0000000000000000000');
                res.send('<script>alert("사용가능한 ID입니다."); </script>');
            }else{
                console.log('1111111111111111111');
                res.send('<script>alert("이미 존재하는 ID 입니다. 다시 입력해주세요.");</script>');
            }
        })
    ]);
});

//get 내 승인조회 보기 페이지
router.get('/studentlist', loginRequired, function(req, res){

    console.log('studentlist 페이지 경로요청');
    console.log(req.user);

    if(!req.user){

        console.log('사용자 인증불가');
        res.redirect('/accounts/login');
    }else{

        if(Array.isArray(req.user)){
            res.render('accounts/studentlist.ejs', { user : req.user[0]._id });
        }else{
            res.render('accounts/studentlist.ejs', { user : req.user });
        }
    }
});


// 서식 호출
router.get('/apply/:type', loginRequired, function(req, res){
    console.log(req.params.type);
    var form_name='';
    if(req.params.type=='graduate'){
        form_name = '졸업';
    }else if(req.params.type=='attend'){
        form_name = '재학';
    }else if(req.params.type=='score'){
        form_name = '성적';
    }

    res.render('formats/App_form', { user : req.user, form_type:req.params.type, form_name:form_name }); 
});

// 이더리움 트랜젝션 팝업 호출
router.get('/getTransaction/:txHash', function(req, res){
    console.log('txHash: '+req.params.txHash);
    var Web3 = require('web3');
    var provider = 'http://220.76.95.91:8485';
    var web3 = new Web3(new Web3.providers.HttpProvider(provider));
    web3.eth.getTransaction(req.params.txHash, 
        function(err, txInfo){
            res.render('txPop', { txInfo : txInfo });  
    });
});

// 이더리움 트랜젝션 팝업 호출
router.get('/txHashPop/:seq', async(req, res)=>{

    var result = await RequestDetailModel.findOne({"seq" : req.params.seq}).limit(req.query.limit).skip(req.skip).exec();

    res.render('txHashsPop', { txHashs : result });  
});

// 내 증명서 화면 호출
router.get('/myCerti/:user_id', async(req, res)=>{

    console.log('req.params.user_id: '+req.params.user_id);
    var result = await CertiYnModeil.findOne({"user_id" : req.params.user_id}).limit(req.query.limit).skip(req.skip).exec();
    console.log(result);
    res.render('certiButton', { myCerti : result });  
});

// 졸업증명서 호출
router.get('/graduate', loginRequired, function(req, res){
    console.log(req.params.type);
    res.render('formats/BOKSOO', { user : req.user, property:req.params.type }); 
});
//신청내역 조회 화면 로드
router.get('/acceptList', paginate.middleware(10, 50), async (req,res) => {

    const [ results, itemCount ] = await Promise.all([
        // sort : minus 하면 내림차순(날짜명)이다.
        RequestDetailModel.find({"user_id" : req.user.user_id}).sort('-seq').limit(req.query.limit).skip(req.skip).exec(),
        RequestDetailModel.count({"user_id" : req.user.user_id})
    ]);
    const pageCount = Math.ceil(itemCount / req.query.limit);
    const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);

    res.render('accounts/acceptList', 
        {
            requestdetail : results , 
            pages: pages,
            pageCount : pageCount,
            user: req.user //user 세션 정보
        });

});

//트랜젝션 내역 저장
router.post('/createTranLog', function(req,res){
    
    var TransactionList = new TransactionListModel({
        user_id : req.user.user_id,
        name : req.user.name,
        from : req.body.from,
        to : req.body.to,
        ether:req.body.ether,
        t_hash: req.body.t_hash,
        cur_balance:req.body.cur_balance
    });
    TransactionList.save(function(err){
        console.log(err);
    });
});
 
//신청내역 조회 화면 로드
router.get('/transactionList', paginate.middleware(100, 100), async (req,res) => {

    const [ results, itemCount ] = await Promise.all([
        // sort : minus 하면 내림차순(날짜명)이다.
        TransactionListModel.find({"user_id" : req.user.user_id}).sort('-create_at').limit(req.query.limit).skip(req.skip).exec(),
        TransactionListModel.count({"user_id" : req.user.user_id})
    ]);
    const pageCount = Math.ceil(itemCount / req.query.limit);
    const pages = paginate.getArrayPages(req)( 10 , pageCount, req.query.page);

    res.render('accounts/transactionList', 
        {
            transactionList : results , 
            pages: pages,
            pageCount : pageCount,
            user: req.user //user 세션 정보
        });

});

// 수수료 납부 시, 플래그 업데이트
router.post('/updateLog', function(req, res){
        // 업데이트 처리 
    RequestDetailModel.update(
        {
            seq : req.body.seq
        },
        {   // seq를 키로 fee_yn을 업데이트 한다.
            $set : {
                fee_yn : 'Y',
                fee_tx : req.body.fee_tx
                // cur_balance: req.body.cur_balance
            }
        }, function(err){
            // 에러가 발생하면 Error
            if(err){
                throw err;
            }
            // else{  
                // res.redirect('/accounts/acceptList');
            // }
        }
    );

    // UserModel.update(
    //     {
    //         user_id : req.user.user_id
    //     },
    //     {
    //         $set : {
    //             cur_balance: (req.body.cur_balance)/1000000000000000000 //wei->Ether로 환산
    //         }
    //     }, function(err){
    //         // 에러가 발생하면 Error
    //         if(err){
    //             throw err;
    //         }
    //     }
    // );
    
});

router.post('/callAPI',  function (req,resp) {
    var s_inXML = req.body.s_inXML;
    
    var spot = req.body.spot;
    var ipfsClient = require('ipfs-http-client');
    var ipfs = ipfsClient('220.76.95.91', '5001', {protocol:'http'});

    // console.log('file_name:'+file_name+', form_name:'+form_name+', spot: '+spot);
    var s_calXML = req.body.s_calXML.replace(/ /gi, "+");
    // console.log('-----------------------------------------------s_inXML Start!!!!');
    // console.log(s_inXML);
    // console.log('-----------------------------------------------s_inXML End!!!!');
    // console.log('-----------------------------------------------s_calXML Start!!!');
    // console.log(s_calXML);
    // console.log('-----------------------------------------------s_calXML End!!!');
    
    request({
        // uri: "http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp?apiKey=5acda40a5de6a72c70b12679",
        // uri:'http://220.76.95.91:8011',
        uri:'http://192.168.0.159:8001',
        method: "POST",
        enctype: 'multipart/form-data',
        form: {
            s_inXML: s_inXML,
            s_calXML: s_calXML
        }
    }, async (error, response, xmlResult)=>{
            // fs.exists('./xmldata/'+req.body.file_name, async(exists)=>{
                var xmlString = xmlResult.trim();
                
                // if(!exists){
                //     await fs.writeFile('./xmldata/'+req.body.file_name, xmlString, 'utf8', function(error){
                //         if (error) {throw error};
                //     });
                    
                    // console.log('-----------------------------------------------XML 완성');
                    // await setTimeout(function(){
                    //     console.log(xmlString);
                    // },5000);
                    
                    await ipfs.add({
                        // path: './xmldata/'+file_name,
                        content: Buffer.from(xmlString)
                    },async (err,res)=>{
                         await setTimeout(function(){
                            console.log(res);
                            console.log('----------------------------------------IPFS hash: '+res[0].hash);
                        },0);
                        // console.log('----------------------------------------err: '+err);
                        // console.log('----------------------------------------spot: '+spot);

                        if(typeof res =='undefined'||res==null||res==""){
                            console.log("IPFS too many load files 에러 예외처리");
                        }else{
                            if(err==null && spot=='user'){
                                // console.log('ipfsHash: '+res[0].hash);
                                // console.log('--------------------------------------------저장로직 실행');
                                
                                var RequestDetail = await 
                                    new RequestDetailModel({
                                        user_id : req.user.user_id,
                                        name : req.user.user_name,
                                        form_type : req.body.form_type,
                                        form_name : req.body.form_name,
                                        apply_ipfs : res[0].hash,
                                        file_name : req.body.file_name,
                                        apply_xml: xmlString
                                        // spot:req.body.spot
                                    });
                                await RequestDetail.save(
                                    function(err){
                                        // resp.send('<script>alert("신청완료");\
                                        // location.href="/admin/adminstudentslist";</script>');
                                    }
                                );
                            }else{
                                console.error('IPFS '+err);
                            }
                        }
                        // res.send('<script>alert("내역저장 성공");\
                        // location.href="/accounts/songguem";</script>');
                    }
                    );//ipfs.add END
                // }else{
                //     console.error('동일한 파일명이 있습니다.');
                // }
        // });
    }); //request END

    // resp.redirect('/accounts/acceptList');
});



router.get('/history', paginate.middleware(5, 50), async (req,res) => {

    if(!req.isAuthenticated()){

        res.send('<script>alert("로그인이 필요한 서비스입니다.");location.href="/accounts/login"</script>');
    }else{
        
        const [ results, itemCount ] = await Promise.all([
            // sort : minus 하면 내림차순(날짜명)이다.
            TransactionModel.find({"user_id" : req.user.user_id}).sort('-created_at').limit(req.query.limit).skip(req.skip).exec(),
            TransactionModel.count({})
        ]);
        const pageCount = Math.ceil(itemCount / req.query.limit);
        const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);

        res.render('accounts/history', 
            { 
                transaction : results , 
                pages: pages,
                pageCount : pageCount,
            });
    }
});

// GET 어드민 등록제품 상세페이지
router.get('/history/:id', function(req, res){
    
        var getData = async() => {
            // async()함수를 만들고 return반환 후 처리가 다 되면 getData().then이 실행된다.
            return {
                
                transaction : await TransactionModel.findOne( { 'id' :  req.params.id }).exec()
                // comments : await CommentsModel.find( { 'product_id' :  req.params.id }).exec(),
                // reple : await repleModel.find( { 'products_id' :  req.params.id }).exec()
            };
        };
        getData().then( function(result){
            
            res.render('accounts/historydetail', 
                { 
                    transact : result.transaction,
                    // comments : result.comments,
                    // reples : result.reple 
                });
        });
});

// TransactionDetail 뿌리기
router.get('/transactionDetail/:id', function(req, res){
    
    
        
    res.render('accounts/historydetail', 
        { 
            transact : result.transaction,
            // comments : result.comments,
            // reples : result.reple 
        });
});

module.exports = router;