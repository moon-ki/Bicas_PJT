var express = require('express');
var router = express.Router();
var request = require('request');
// var StudentsModel = require('../models/StudentsModel');
// 댓글을 작성해야 하므로 코멘트를 라우트로 불러와야 한다.
var CommentsModel = require('../models/CommentsModel');
var repleModel = require('../models/RepleModel');
var loginRequired = require('../libs/loginRequired');
var adminRequired = require('../libs/adminRequired');
var CheckoutModel = require('../models/CheckoutModel');
var UserModel = require('../models/UserModel');
var passwordHash = require('../libs/passwordHash');
var RequestDetailModel = require('../models/RequestDetail');
var CertiYnModeil=require('../models/certiYnModel');
// 콜백헬 개선
var co = require('co');
var paginate = require('express-paginate');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var session = require('express-session');

// csrf 셋팅
var csrf = require('csurf');
var csrfProtection = csrf({ cookie: true });
//이미지 저장되는 위치 설정
var path = require('path');
var uploadDir = path.join( __dirname , '../uploads' ); // 루트의 uploads위치에 저장한다.
var fs = require('fs');
// multer 셋팅
var multer = require('multer');
var storage = multer.diskStorage({
    destination : function (req, file, callback){
        callback(null, uploadDir);
    },
    filename : function (req, file, callback){
        callback(null, 'students-' + Date.now() + '.' + file.mimetype.split('/')[1]);
    }
});
var upload = multer({ storage : storage });



// 관리자 로그인 성공시 먼저 실행되고 디시리얼이 실행된다. 
passport.serializeUser(function (user, done){

    console.log('serializeUser');
    done(null, user);
});
// 관리자 로그인 성공했을 때 콘솔화면에 나오는 메서드
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
// 관리자 로그인 처리 프로세스 및 로그인관련 passport 정책설정
passport.use(new LocalStrategy({

    usernameField : 'user_id',
    passwordField : 'password',
    passReqToCallback : true
    }, function(req, user_id, password, done){
        
        UserModel.findOne(
            {
                user_id : user_id,
                password : passwordHash(password)
            }, function(err, user){
                
                UserModel.findOne({
                    user_id : user_id,
                    password : passwordHash(password)
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


// GET 어드민 홈 로그인 페이지
router.get('/adminlogin', function(req, res){

    res.render('admin/adminlogin');
});

// POST 로그인 처리 프로세스
router.post('/adminlogin', 
    passport.authenticate('local', 
        {
            failureRedirect : '/admin/adminlogin',
            failureFlash : true
        }), function(req, res){
            res.send('<script>alert("로그인 성공");location.href="/admin/products/productslist";</script>');
        }
);

// GET 로그아웃
router.get('/logout', function(req, res){
    req.logout();
    res.redirect('/admin/adminlogin');
});

// GET 관리자 home 페이지
// router.get('/adminhome', function(req, res){

//     res.render('admin/adminhome');
// });


// 제품 등록 페이지 및 url
router.get('/products/write', adminRequired, csrfProtection, function(req, res){
    
    // 디렉토리 및 확장자가 ejs인 파일명
    res.render('admin/form',

        {
            product : "",
            csrfToken : req.csrfToken()
        }
    );
});


// POST form 작성 후 post 방식으로 데이터 저장을 수행할 메서드
router.post('/products/write', loginRequired, upload.single('thumbnail'), csrfProtection, function(req, res){
    // products.ejs form의 데이터를 req.body.x로 받는다.
    var product = new ProductsModel({

        name : req.body.name,
        thumbnail : (req.file) ? req.file.filename : "",
        price : req.body.price,
        description : req.body.description,
    });
    // 밸리데이션 싱크를 걸어놓는다.
    var validationError = product.validateSync();
    // 제목을 입력하지 않으면 밸리데이션 에러를 발생시킨다.
    if(validationError){
        res.send(validationError);
    }else{ // 제목입력되면 정보저장 후 프로덕트 페이지로 이동
        product.save(function(err){
            res.redirect('/admin/products');
        });
    }
    // 데이터를 받고 저장
    // product.save(function(err){
    //     // 저장 후 해당 url로 리다이렉트
    //     res.redirect('/admin/products');
    // });
});


// GET 어드민 제품 등록 페이지 및 url
router.get('/products/productsregist', adminRequired, csrfProtection, function(req, res){
    
    // 디렉토리 및 확장자가 ejs인 파일명
    res.render('admin/adminproductsregist',

        {
            user : req.user,
            product : "",
            csrfToken : req.csrfToken()
        }
    );
});

// POST 어드민 제품정보 등록 후 post 방식으로 데이터 저장을 수행할 메서드
router.post('/products/productsregist', loginRequired, upload.single('thumbnail'), csrfProtection, function(req, res){
    // products.ejs form의 데이터를 req.body.x로 받는다.
    var product = new ProductsModel({

        category : req.body.category,
        productname : req.body.productname,
        thumbnail : (req.file) ? req.file.filename : "",
        price : req.body.price,
        quantity : req.body.quantity,
        description : req.body.description,
        user_name : req.body.user_name,
        productgun : req.body.productgun,
        productweight : req.body.productweight,
        productspec : req.body.productspec,
        productmaker : req.body.productmaker,
        productusing : req.body.productusing,
        customercall : req.body.customercall,
        productdelivery : req.body.productdelivery,
        productredelivery : req.body.productredelivery 
        // name : req.body.name,
        // thumbnail : (req.file) ? req.file.filename : "",
        // price : req.body.price,
        // description : req.body.description,
    });
    // 밸리데이션 싱크를 걸어놓는다.
    var validationError = product.validateSync();
    // 제목을 입력하지 않으면 밸리데이션 에러를 발생시킨다.
    if(validationError){

        res.send(validationError);
    }else{ // 제목입력되면 정보저장 후 프로덕트 페이지로 이동
        
        product.save(function(err){
            
            res.redirect('/admin/products/studentslist');
        });
    }
    // 데이터를 받고 저장
    // product.save(function(err){
    //     // 저장 후 해당 url로 리다이렉트
    //     res.redirect('/admin/products');
    // });
});

// 접수목록 페이지
router.get('/products/productslist', paginate.middleware(10, 50), async (req,res) => {
    const [ results, itemCount ] = await Promise.all([
        // sort : minus 하면 내림차순(날짜명)이다.
        RequestDetailModel.find({"fee_yn" : 'Y'}).sort('-seq').limit(req.query.limit).skip(req.skip).exec(),
        RequestDetailModel.count({"fee_yn" : 'Y'})
    ]);

    const pageCount = Math.ceil(itemCount / req.query.limit);
    const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);

    res.render('admin/adminproductslist', 
        { 
            requestdetail : results , 
            pages: pages,
            pageCount : pageCount,
            user: req.user
        });
});

// 접수목록 페이지
router.get('/acceptList/:formatFilter/:userName', paginate.middleware(10, 50), async (req,res) => {
    console.log(req.params.formatFilter+','+req.params.userName);
    // const [ results, itemCount ] = await Promise.all([
    //     // sort : minus 하면 내림차순(날짜명)이다.
    //     RequestDetailModel.find({"fee_yn" : 'Y'}).sort('-seq').limit(req.query.limit).skip(req.skip).exec(),
    //     RequestDetailModel.count({"fee_yn" : 'Y'})
    // ]);

    // const pageCount = Math.ceil(itemCount / req.query.limit);
    // const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);

    // res.render('admin/adminproductslist', 
    //     { 
    //         requestdetail : results , 
    //         pages: pages,
    //         pageCount : pageCount,
    //         user: req.user
    //     });
});

// 증명서 출력
router.get('/cetificate/:seq', async (req,res)=>{
    const txInfo = await Promise.all([
        RequestDetailModel.findOne({"seq" : req.params.seq}).limit(req.query.limit).skip(req.skip).exec()
    ]);
    const userInfo = await Promise.all([
        UserModel.findOne({"user_id" : txInfo[0].user_id}).limit(req.query.limit).skip(req.skip).exec()
    ]);

    //동적으로 증명서 화면을 호출함
    await res.render('formats/'+txInfo[0].form_type, {
        user : userInfo[0], 
        txInfo : txInfo[0]
    }); 
    
});

// 신청서 반려
router.post('/reject/:seq', async (req,res)=>{
    console.log('reject called!!');
    const txInfo = await Promise.all([
        RequestDetailModel.findOne({"seq" : req.params.seq}).limit(req.query.limit).skip(req.skip).exec()
    ]);
    const userInfo = await Promise.all([
        UserModel.findOne({"user_id" : txInfo[0].user_id}).limit(req.query.limit).skip(req.skip).exec()
    ]);

    var Web3 = require('web3');
    var provider = 'http://220.76.95.91:8485';
    var web3 = new Web3(new Web3.providers.HttpProvider(provider));
    var unlocked = await web3.eth.personal.unlockAccount('0xf963d99d7635c604b132dc495476d931ac642ed1','moonki',600).then(console.log('반려 Account unlocked!'));
    if(unlocked){
        web3.eth.sendTransaction({
            from: '0xf963d99d7635c604b132dc495476d931ac642ed1', //관리자 계정(고정)
            to:userInfo[0].blockchainid,
            value:web3.utils.toWei('0.1','ether')
        },function(err, res){
            console.log('rejectTX: '+res);
            console.log('err: '+err);
            RequestDetailModel.update(
                {seq : req.params.seq},
                {   $set : {
                        // accept_at : Date.now(),
                        reject_tx : res,
                        reject_yn : 'Y'
                    }
                }, function(err){
                }
            );
        });
    }



    //동적으로 증명서 화면을 호출함
    await res.render('formats/'+txInfo[0].form_type, {
        user : userInfo[0], 
        txInfo : txInfo[0]
    }); 
    
});


router.post('/callAPI',  async (req,res)=> {
    var s_inXML = req.body.s_inXML;
    var s_calXML = req.body.s_calXML.replace(/ /gi, "+");
    var spot = req.body.spot;
    var ipfsClient = require('ipfs-http-client');
    var ipfs = ipfsClient('220.76.95.91', '5001', {protocol:'http'});

    // console.log('file_name:'+file_name+', form_name:'+form_name+', spot: '+spot);
    
    console.log('-----------------------------------------------s_inXML Start!!!!');
    console.log(s_inXML);
    console.log('-----------------------------------------------s_inXML End!!!!');
    console.log('-----------------------------------------------s_calXML Start!!!');
    console.log(s_calXML);
    console.log('-----------------------------------------------s_calXML End!!!');
    
    await request({
        // uri: "http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp?apiKey=5acda40a5de6a72c70b12679",
        uri:'http://220.76.95.91:8011',
        // uri:'http://192.168.0.159:8001',
        method: "POST",
        enctype: 'multipart/form-data',
        form: {
            s_inXML: s_inXML,
            s_calXML: s_calXML
        }
    }, function (error, response, xmlResult){
            // fs.exists('./xmldata/'+req.body.file_name, async(exists)=>{
                var xmlString =  xmlResult.trim();
                
                // if(!exists){
                    // await fs.writeFile('./xmldata/'+req.body.file_name, xmlString, 'utf8', function(error){
                    //     if (error) {throw error};
                    // });
                    console.log('-------------seq:'+req.body.seq);
                    console.log('-----------------------------------------------XML 완성');
                    console.log(xmlString);
                    ipfs.add({
                        // path: './xmldata/'+file_name,
                        content: Buffer.from(xmlString)
                    },async (err,res)=>{
                        // await setTimeout(function(){
                            console.log('----------------------------------------IPFS hash: '+res[0].hash);
                        // },3000);
                        if(spot=='admin'){
                            //승인시간 업데이트
                            await RequestDetailModel.update(
                                {seq : req.body.seq},
                                {   $set : {
                                        // accept_at : Date.now(),
                                        certi_yn : 'Y',
                                        certi_ipfs:res[0].hash,
                                        certi_xml:xmlString
                                    }
                                }, function(result){
                                    //#####################################################################################

                                    //#####################################################################################
                                }
                            );
                        }else{
                            console.error('정의되지 않은 spot!!');
                        }
                        // res.send('<script>alert("내역저장 성공");\
                        // location.href="/accounts/songguem";</script>');
                    });
                // }else{
                //     console.error('동일한 파일명이 있습니다.');
                // }
        // });

                    
    });
    //비동기적인 특징으로 인한, certi_xml업데이트 되기전 select하여 undefinded 되는 문제 해결
    // await setTimeout(function(){
    //     console.log('####callAPI: redirect to createContract START!!!');
    //     res.redirect(307,'/admin/createContract/certi/'+req.body.seq);
    // },8000);
    // res.send('<script>alert("증명서 발급 완료");</script>');
    setTimeout(()=>
        res.redirect(307,'/admin/createContract/certi/'+req.body.seq)
    ,3000);

});


// 서식을 이더리움에 업로드!
//1.신청서 업로드할 경우, App_form.xsl에서 호출
//2.증명서 업로드할 경우, 
router.post('/createContract/:from/:seq', async (req,res) =>{
    // 0. web3 초기화
    console.log('createContract 시작!!!!');
    var Web3 = require('web3');
    var abi = [
                {
                    "constant": false,
                    "inputs": [
                        {
                            "name": "_contractFile",
                            "type": "string"
                        },
                        {
                            "name": "_contractHash",
                            "type": "bytes32"
                        }
                    ],
                    "name": "issue",
                    "outputs": [],
                    "payable": false,
                    "type": "function",
                    "stateMutability": "nonpayable"
                },
                {
                    "constant": true,
                    "inputs": [],
                    "name": "getContracts",
                    "outputs": [
                        {
                            "name": "",
                            "type": "bytes32[]"
                        }
                    ],
                    "payable": false,
                    "type": "function",
                    "stateMutability": "view"
                },
                {
                    "constant": true,
                    "inputs": [
                        {
                            "name": "_contractHash",
                            "type": "bytes32"
                        }
                    ],
                    "name": "getContract",
                    "outputs": [
                        {
                            "name": "",
                            "type": "address"
                        },
                        {
                            "name": "",
                            "type": "string"
                        },
                        {
                            "name": "",
                            "type": "bytes32"
                        }
                    ],
                    "payable": false,
                    "type": "function",
                    "stateMutability": "view"
                }
            ];
    var addr = '0xEF61b96F9dE577af72fD4FfcA1dB999B3E2Eb521';
    var provider = 'http://220.76.95.91:8485';
    var web3 = new Web3(new Web3.providers.HttpProvider(provider));
    var contract = new web3.eth.Contract(abi,addr);
    web3.eth.defaultAccount = '0xf963d99d7635c604b132dc495476d931ac642ed1'; //Fixed 관리자 계정

    // 1.xmlString 가져오기
    const results = await Promise.all([
        RequestDetailModel.findOne({"seq" : req.params.seq}).limit(req.query.limit).skip(req.skip).exec()
    ]);

    //2.이더리움 관리자 계정 unlock
    var unlocked = await web3.eth.personal.unlockAccount(web3.eth.defaultAccount,'moonki',600).then(console.log('Account unlocked!'));
    console.log('web3.eth.personal.unlockAccoun result===>'+unlocked);
    //3.블록체인 write
    if(unlocked){
        //4.신청서를 이더리움에 업로드
        // console.log('---------------------------------------------------req.params.from: '+req.params.from);
        if(req.params.from=='accept'){
            // console.log('------------------------------------신청서 컨트렉트 생성로직 시작!')
            await contract.methods.issue(results[0].file_name, web3.utils.sha3(results[0].apply_xml)).send({from:web3.eth.defaultAccount, gas: 500000}, 
                function(err, hash){
                    // console.log('------------------------------------컨트렉트 생성: '+hash)
                    RequestDetailModel.update(
                        {seq : req.params.seq},
                        {
                            $set : {
                                accept_yn: 'Y',
                                accept_tx: hash
                            }
                        }, function(err){
                            if(err){ throw err;}
                        }
                    );
                }
            );
        //4.증명서를 이더리움에 업로드    
        }else if(req.params.from=='certi'){
            await contract.methods.issue(results[0].file_name, web3.utils.sha3(results[0].certi_xml)).send({from:web3.eth.defaultAccount, gas: 500000}, 
                function(err, hash){
                    // console.log('--------------------------------------------certi_hash: '+hash);
                    RequestDetailModel.update(
                        {seq : req.params.seq},
                        {
                            $set : {
                                certi_yn: 'Y',
                                certi_tx: hash,
                                certi_at:Date.now()

                            }
                        }, function (err, result){
                            
                            //certiYn 업데이트!
                            // console.log('+++++++++++++++++++++++++++++++++++++++++++results[0].form_type: '+results[0].form_type);
                            // console.log('+++++++++++++++++++++++++++++++++++++++++++user_id:results[0].user_id: '+results[0].user_id);
                            if( results[0].form_type=='graduate'){
                                console.log('graduate 업데이트!!!!');
                                // setTimeout(()=> 
                                    CertiYnModeil.update(
                                        {user_id:results[0].user_id},
                                        {
                                            $set : {
                                                graduate_yn: 'Y',
                                                graduate_ipfs: results[0].certi_ipfs
                                            }
                                        }
                                    , function(err){
                                        console.log('graduate update 완료');
                                    })
                                // ,3000);
                            }else if( results[0].form_type=='attend'){
                                console.log('attend 업데이트!!!!');
                                console.log('user_id: '+results[0].user_id+', certi_ipfs:'+results[0].certi_ipfs);
                                // setTimeout(()=> 
                                     CertiYnModeil.update(
                                        {user_id:results[0].user_id},
                                        {
                                            $set : { 
                                                attend_yn: 'Y',
                                                attend_ipfs: results[0].certi_ipfs
                                            }
                                        }
                                    , function(err){
                                        console.log('attend_ipfs update 완료');
                                    })
                                // ,3000);
                            }else if( results[0].form_type=='score'){
                                console.log('score 업데이트!!!!');
                                console.log('user_id: '+results[0].user_id+', certi_ipfs:'+results[0].certi_ipfs);
                                // setTimeout(()=> 
                                    CertiYnModeil.update(
                                        {user_id:results[0].user_id},
                                        {
                                            $set : {
                                                score_yn: 'Y',
                                                score_ipfs: results[0].certi_ipfs
                                            }
                                        }
                                    , function(err){
                                        console.log('score_ipfs update 완료');
                                    })
                                // ,3000);
                            }else{
                                console.error('잘못된 증명서 타입!');
                            }
                        }
                    );
                }//send callback 함수 끝!
            );//send 끝!
        }
    }
    
    
});

// GET 어드민 홈 전체 학생목록 불러오기 
router.get('/adminstudentlist', paginate.middleware(5, 10), async (req,res) =>{
    
    const [ results, itemCount ] = await Promise.all([
        // sort : minus 하면 내림차순(날짜명)이다.
        UserModel.find().sort('-seq').limit(req.query.limit).skip(req.skip).exec(),
        UserModel.count()
    ]);

    const pageCount = Math.ceil(itemCount / req.query.limit);
    const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);
    console.log(pageCount, pages);
    res.render('admin/adminstudentlist', 
        { 
            stulist : results , 
            pages: pages,
            pageCount : pageCount
        });
});
   


// 상세페이지 /admin/products/detail/:id
router.get('/products/detail/:id' , function(req, res){

    var getData = async() => {
        // async()함수를 만들고 return 반환 후 처리가 다 되면 getData().then이 실행된다.
        return {
            
            product : await ProductsModel.findOne( { 'id' :  req.params.id }).exec(),
            comments : await CommentsModel.find( { 'product_id' :  req.params.id }).exec(),
            reple : await repleModel.find( { 'products_id' :  req.params.id }).exec()
        };
    };
    getData().then( function(result){
        
        res.render('admin/productsdetail', { product: result.product , comments : result.comments, reples : result.reple });
    });
});


// GET 어드민 등록제품 상세페이지
router.get('/products/productsdetail/:id' , function(req, res){

    var getData = async() => {
        // async()함수를 만들고 return반환 후 처리가 다 되면 getData().then이 실행된다.
        return {
            
            product : await ProductsModel.findOne( { 'id' :  req.params.id }).exec(),
            comments : await CommentsModel.find( { 'product_id' :  req.params.id }).exec(),
            reple : await repleModel.find( { 'products_id' :  req.params.id }).exec()
        };
    };
    getData().then( function(result){
        
        res.render('admin/adminproductslistdetail', { product: result.product , comments : result.comments, reples : result.reple });
    });
});

// GET 어드민 Chart
router.get('/products/productschart' , function(req, res){

    var date = new Date();
    date.setDate(date.getDate() - 7);
    date.setHours(0, 0, 0);
      // 체크아웃 모델에서 검색, orderList 파라미터로 전달
      CheckoutModel.find(
        {
          created_at: {
            '$gte': date
          }
        },
        function(err, orderList){
    // 체크아웃 모델에서 검색, orderList 파라미터로 전달
    // CheckoutModel.find( function(err, orderList){ 

        var barData = [];   // 넘겨줄 막대그래프 데이터 초기값 선언
        var pieData = [];   // 원차트에 넣어줄 데이터 삽입
        // orderList에서 반복문을 돌려 order 파라미터로 전달
        orderList.forEach(function(order){
            // 08-10 형식으로 날짜를 받아온다
            var date = new Date(order.created_at); // 현재 대한민국 표준시
            var monthDay = (date.getMonth()+1) + '-' + date.getDate();
            console.log(monthDay + 'monthDay');
            // 날짜에 해당하는 키값으로 조회
            if(monthDay in barData){

                barData[monthDay]++; // 있으면 더한다
                console.log('barData[monthDay]++' + barData[monthDay]++);
            }else{

                barData[monthDay] = 1; // 없으면 초기값 1넣어준다.
                console.log('barData[monthDay] = 1')
                console.log(barData[monthDay] = 1);
            }
            // 결제 상태를 검색해서 조회
            if(order.status in pieData){

                pieData[order.status]++; // 있으면 더한다
                console.log('pieData[order.status]++' + pieData[order.status]++);
            }else{

                pieData[order.status] = 1; // 없으면 결제상태+1
                console.log(pieData[order.status] = 1);
            }
        });
        res.render('admin/adminproductschart', { barData : barData, pieData:pieData })
    });
});


// 제품 수정페이지
router.get('/products/edit/:id', loginRequired, csrfProtection, function(req, res){
    // 수정할 제품을 찾는다.
    ProductsModel.findOne(
        {   // 아이디 값으로 찾는다.
            id : req.params.id
        }, function(err, product){

            res.render('admin/formedit', 
        {
            product : product,
            csrfToken : req.csrfToken()
        });
    });
});

router.get('/products/adminproductedit/:id', loginRequired, csrfProtection, function(req, res){
    // 수정할 제품을 찾는다.
    ProductsModel.findOne(
        {   // 아이디 값으로 찾는다.
            id : req.params.id
        }, function(err, product){

            res.render('admin/adminproductedit', 
        {
            product : product,
            csrfToken : req.csrfToken()
        });
    });
});

// 제품 수정처리 라우트
router.post('/products/edit/:id', loginRequired, upload.single('thumbnail'), csrfProtection, function(req, res){

    ProductsModel.findOne( 
            {
                id : req.params.id
            }, function(err, product){
                
                if(req.file && product.thumbnail){  //요청중에 파일이 존재 할시 이전이미지 지운다.
                    
                    fs.unlinkSync( uploadDir + '/' + product.thumbnail );
                }
                // req.file[0] 첫번째 -> upload.single말고 이미지가 여러개일 때 upload.array            
        // query 변수값을 세팅한다.
        var query = {

            name : req.body.name,
            // 파일요청이면 새로운 파일을 파일요청이 아니면 기존 디비에 저장된 이미지 파일경로를 불러온다.
            thumbnail : (req.file) ? req.file.filename : product.thumbnail,
            price : req.body.price,
            description : req.body.description
        };
            // update의 첫 번째 인자는 조건, 두 번째 인자는 바뀔 값들
            ProductsModel.update(
                {   // query 변수를 적용할 제품의 아이디
                    id : req.params.id
                },
                {   // query 변수로 해당 업데이트 수행
                    $set : query
                }, function(err){
                
                    // 제품 수정 후 수정된 제품의 상세페이지 이동
                    res.redirect('/admin/products/detail/' + req.params.id);
                }
            ); 
    });      
});

// 학생 삭제 처리
router.get('/adminstudentlist/delete/:id', function(req, res){
    // 모델객체에서 데이터 삭제
    UserModel.remove(
        {   // 페이지에서 제품 아이디값 전달받는다
            id : req.params.id
        }, function(err){
            // 삭제 후 제품목록으로 이동
            // res.redirect('/admin/products');
            res.redirect('/admin/adminstudentlist');
        }
    );
});

// 제품 삭제 처리
router.get('/products/delete/:id', function(req, res){
    // 모델객체에서 데이터 삭제
    ProductsModel.remove(
        {   // 페이지에서 제품 아이디값 전달받는다
            id : req.params.id
        }, function(err){
            // 삭제 후 제품목록으로 이동
            // res.redirect('/admin/products');
            res.redirect('/admin/products/studentslist');
        }
    );
});

// 댓글작성, 자바스크립트 ajax url과 매핑되면서 처리되는 객체
router.post('/products/ajax_comment/insert', function(req, res){
    
    // 디비객체 변수
    var comment = new CommentsModel({
        // 디비 타입 및 받아오는 데이터
        content : req.body.content,
        // 댓글 product_id에 제품정보 아이디값을 받는다., product_id는 폼의 name
        product_id : parseInt(req.body.product_id)
    });

    // 코멘트도 save 메서드로 저장처리
    comment.save(function(err, comment){

        res.json({
            // 향후에 삭제하기 위해 댓글 id를 불러온다.
            id : comment.id,
            content : comment.content,
            message : "success"
        });
    });
});

// 리플작성, 자바스크립트 ajax url과 매핑되면서 처리되는 객체
router.post('/products/ajax_comment/repleinsert', function(req, res){
    console.log(req.body.product_id+'product_idproduct_idproduct_idproduct_id');
    // 디비객체 변수
    var reple = new repleModel({
        // 디비 타입 및 받아오는 데이터
        content : req.body.reple2,
        // 댓글에 리플을 달고 이를 View화면에 출력해주기 위해서 제품의 아이디값도 받아온다.
        products_id : parseInt(req.body.product_id),
        // 댓글 comment_id에 댓글 아이디값을 받는다.
        comments_id : parseInt(req.body.comment_id),
        limit_reple : 1
    });
    
    // 리플도 save 메서드로 저장처리
    reple.save(function(err, reple){

        res.json({
            // 향후에 삭제하기 위해 댓글 id를 불러온다.
            id : reple.id,
            content : reple.content,
            products_id : reple.products_id,
            comments_id : reple.comments_id,
            limit_reple : reple.limit_reple,
            message : "success"
        });
    });
});

// 댓글삭제 라우트
router.post('/products/ajax_comment/delete', function(req, res){

    CommentsModel.remove(
        {
            id : req.body.comment_id
        }, function(err){

            res.json(
                {
                    message : "success"
                }
            );
        });
});


// 리플삭제 라우트
router.post('/products/ajax_comment/repledelete', function(req, res){

    repleModel.remove(
        {
            id : req.body.reple_id
        }, function(err){

            res.json(
                {
                    message : "success"
                }
            );
        });
});

// 위지윅에디터 이미지 업로드 라우팅 구현
router.post('/products/ajax_summernote', loginRequired, upload.single('thumbnail'), function(req, res){

    res.send('/uploads/' + req.file.filename);
});

// 결제정보 리스트
router.get('/order', function(req, res){

    CheckoutModel.find( function(err, orderList){ //첫번째 인자는 err, 두번째는 받을 변수명
    
        res.render( 'admin/orderList' ,   
            { orderList : orderList }
        );
    });
});

// GET 어드민 결제정보 리스트
router.get('/products/orderlist', function(req, res){

    CheckoutModel.find( function(err, orderList){ //첫번째 인자는 err, 두번째는 받을 변수명
    
        res.render( 'admin/adminorderlist' , 
            { orderList : orderList }
        );
    });
});

// 결제 상세정보
router.get('/order/edit/:id', function(req, res){

    CheckoutModel.findOne(
        {   // 결제정보의 아이디를 받아와서 상세정보를 출력한다.
            id : req.params.id
        }, function(err, order){

            res.render('admin/orderForm', { order : order } );
        }
    );
});
// 배송조회
router.post('/order/edit/:id', function(req, res){

    var query = {
        // 결재상태를 변경 및 송장번호 저장하는 쿼리로직
        status : req.body.status,
        song_jang : req.body.song_jang
    };

    CheckoutModel.update({ id : req.params.id }, { $set : query }, function(err){
    
        res.redirect('/admin/order');
    });
});




// GET 통계 차트
// router.get('/statistics', adminRequired, function(req,res){
   
//     res.render('admin/statistics');
// });
router.get('/statistics', function(req, res){
    // 체크아웃 모델에서 검색, orderList 파라미터로 전달
    CheckoutModel.find( function(err, orderList){ 

        var barData = [];   // 넘겨줄 막대그래프 데이터 초기값 선언
        var pieData = [];   // 원차트에 넣어줄 데이터 삽입
        // orderList에서 반복문을 돌려 order 파라미터로 전달
        orderList.forEach(function(order){
            // 08-10 형식으로 날짜를 받아온다
            var date = new Date(order.created_at);
            var monthDay = (date.getMonth()+1) + '-' + date.getDate();
            
            // 날짜에 해당하는 키값으로 조회
            if(monthDay in barData){

                barData[monthDay]++; //있으면 더한다
                console.log('barData[monthDay]++' + barData[monthDay]++);
            }else{

                barData[monthDay] = 1; //없으면 초기값 1넣어준다.
                console.log(barData[monthDay] = 1);
            }

            // 결재 상태를 검색해서 조회
            if(order.status in pieData){

                pieData[order.status]++; //있으면 더한다
                console.log('pieData[order.status]++' + pieData[order.status]++);
            }else{

                pieData[order.status] = 1; //없으면 결재상태+1
                console.log(pieData[order.status] = 1);
            }

        });

        res.render('admin/statistics', { barData : barData , pieData:pieData } );
    });
});

// GET 어드민 홈 통계
router.get('/adminhome', adminRequired, function(req, res) {

        // 어드민 홈에 보낼 데이터 (통계, 등록제품 목록)
        // StudentsModel.find(function(err, products){
            
        //     res.render('admin/adminhome', 
        //         { 
        //             products : products 
        //         } );
        // });
        // const [ results, itemCount ] = await Promise.all([
        //     // sort : minus 하면 내림차순(날짜명)이다.
        //     RequestDetailModel.find({"fee_yn" : 'Y'}).sort('-seq').limit(req.query.limit).skip(req.skip).exec(),
        //     RequestDetailModel.count({"fee_yn" : 'Y'})
        // ]);
    
        // const pageCount = Math.ceil(itemCount / req.query.limit);
        // const pages = paginate.getArrayPages(req)( 4 , pageCount, req.query.page);
    
        // res.render('admin/adminproductslist', 
        //     { 
        //         requestdetail : results , 
        //         pages: pages,
        //         pageCount : pageCount,
        //         user: req.user
        //     });

        var getData = async() => {
            // async()함수를 만들고 return반환 후 처리가 다 되면 getData().then이 실행된다.
            return {
                
                requestdetails : await RequestDetailModel.find( { "fee_yn" : 'Y' }).exec(),
                // stulist : await UserModel.find( { 'user_name' :  req.user.user_name }).exec(),
                stulist : await UserModel.find().exec(),
            };
        };
        getData().then( function(result){
            
            res.render('admin/adminhome', 
                { 
                    requestdetail : result.requestdetails,
                    stulist : result.stulist
                });
        });
        // UserModel.find( function(err, stuList){ //첫번째 인자는 err, 두번째는 받을 변수명
    
        //     res.render( 'admin/adminhome' ,   
        //         { stulist : stuList }
        //     );
    });


// 회원가입 페이지
router.get('/studentregedit', function(req, res){
    res.render('admin/studentregidit');
});

// 회원가입 처리 프로세스
router.post('/studentregedit', function(req, res){
    // 정의한 유저모델 형식과 동일한 데이터를 리퀘스트로 입력받는다.
    var User = new UserModel({

        user_id : req.body.user_id,
        // 비밀번호는 패스워드해쉬 라이브러리 js 파일로 암호화시킨다.
        password : passwordHash(req.body.password),
        major : req.body.major,
        blockchainid : req.body.blockchainid,
        blockchainpwd : passwordHash(req.body.blockchainpwd),
        user_name : req.body.user_name,
        user_phone : req.body.user_phone,
        user_sex : req.body.user_sex,
        user_birth : req.body.user_birth,
        user_email : req.body.user_email,
        user_addr : req.body.user_addr,
        user_addr2 : req.body.user_addr2,
        user_post : req.body.user_post
    });
    User.save(function(err){
        res.send('<script>alert("학생등록 완료");\
        location.href="/admin/adminstudentslist";</script>');
    });
});

module.exports = router;