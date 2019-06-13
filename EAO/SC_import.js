<script src="http://220.76.95.91:3000/EAO/web3.js"></script>

    //세션정보
    const blockchainid = $('#blockchainid').val();
    const blockchainpwd = $('#blockchainpwd').val();

    //web3 정보
    // const provider = 'http://220.76.95.91:8546';
    const provider = 'http://220.76.95.91:8485';
    var Web3 = require('web3');
    var web3 = new Web3(new Web3.providers.HttpProvider(provider));
    

    // 이더리움 계정 언락
    function unlockAccount(callback){
        $.ajax({
            url: provider,
            type: 'post',
            datatype: 'application/json',
            contentType: 'application/json',
            dataType: 'JSON',
            data: JSON.stringify({
                id: 8,
                jsonrpc: '2.0',
                method: 'personal_unlockAccount',
                params: [blockchainid, blockchainpwd]
            }),
            success: function(data) {
                if(data.result == true) {
                    callback(null);
                } else {
                    callback('fail auth');
                }
            },
            error: function(error) {
                callback(error);
            }
        });   
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //1.authXML 엔진에 입력데이터와 구조데이터를 post로 request
    //2.서버사이드:  - autoxml 엔진 request & response
    //              - 결과값으로 파일생성
    //              - 해당 파일을 IPFS에 업로드
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    function createXML(file_name, spot){
        bxfXmlSaveCspPrepare();
        bxfSearchTextPrepare();

        var inXML = $('#inXMLcontent').val();
        var calXML= $('#calXMLcontent').val();
        var params ='';

        // 홈에서 증명서 신청
        if(spot=='user'){ //App_form.ejs에서 받아옴
            var form_name = $('#title1').val();
            var form_type = $('#form_type').val();
            params = 's_inXML='+inXML+
                     '&s_calXML='+calXML+
                     '&file_name='+file_name+
                     '&form_name='+form_name+
                     '&form_type='+form_type+
                     '&spot='+spot;
        // 관라자 승인
        }else if(spot=='admin'){
            var seq=$('#seq');  //업데이트 위한 키값
            params = 's_inXML='+inXML+
                     '&s_calXML='+calXML+
                     '&spot='+spot+
                     '&seq='+seq;
        }else{
            alert('정의되지 않은 spot');
        }
        // alert('createXML spot: '+spot);
        // console.log('----------------+++++++++++++++++++++++++++++++++++++++++++');
        // console.log(calXML);
        var client = new XMLHttpRequest();

        //API 호출!
        client.open('POST','/accounts/callAPI/', true);
        client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        client.send(params);

        // client.onreadystatechange = function(){
        //     if(client.readyState == 4 && client.status == 200){
        //         var result = client.responseText;
        //         alert(result);
        //         // callback(result);
        //     }
        // };
    }

    function adminAccept(seq, file_name){
        var answer = confirm('해당 증명서를 승인하겠습니까?');

        // if(answer){
        //     //1. authXML엔진을 통해 xml파일생성 및 IPFS 업로드
        //     createXML(file_name, 'admin');
        //     // alert(ipfs_hash);
        //     // saveSysLog(ipfs_hash);
        //     // self.close();
            
        //     //이더리움 write
        //     // etherAccept(seq, file_name);

        //     alert('신청서를 성공적으로 승인했습니다.');
        //     parent.opener.location.href='/admin/products/productslist';
        //     // location.href='/accounts/acceptList';
        // }
    }

    function adminReject(){
        var answer = confirm('해당 증명서를 반려하겠습니까?');
    }

    function ontx(){
        var answer = confirm('신청서를 제출하겠습니까?');
        if(answer){
            //1. authXML엔진을 통해 xml파일생성 및 IPFS 업로드
            var filename = getFileName();
            createXML(filename,'user');
            // alert(ipfs_hash);
            // saveSysLog(ipfs_hash);

            self.close();
            parent.opener.location.href='/accounts/acceptList';
            // location.href='/accounts/acceptList';
        }
    }

    // function txpop(txHash){

    //     var client = new XMLHttpRequest();

    //     params = 'txHash='+txHash;

    //     client.open('POST','/accounts/getTransaction', true);
    //     client.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    //     client.send(params);
    // }

    // 관리자 승인 메서드
    function etherAccept(seq, file_name) {
       
            var prams = 'seq='+seq+'&file_name='+file_name;
            var client1 = new XMLHttpRequest();
            client1.open("POST",'/admin/acceptContract',true);
            client1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            client1.send(prams);
            
    }

    //수수료를 관리자 계정으로 이체
    function sendFee(recodeSeq){

        //1. 이더리움계정 Unlock
        unlockAccount(function(result){
            if(result=='fail auth'){
                alert('계정이 유효하지 않습니다. 관리자에게 문의하세요.');
            }else{
                var answer = confirm('수수료는 0.1eth 입니다. 진행하겠습니까?');

                if(answer){
                    //2. 관리자 계정으로 수수료 송부
                    web3.eth.sendTransaction({
                        from: blockchainid,         //로그인한 사용자 계정
                        to: web3.eth.accounts[0],   //관리자 계정
                        value: web3.toWei(0.1,'ether')
                        }, 
                        function(err, res){
                            if(err == null){ //에러가 발생하지 않을 때,
                                //3. 수수료납부여부 업데이트
                                var cur_balance = web3.eth.getBalance(blockchainid);
                                var prams = 'seq='+recodeSeq+'&fee_tx='+res+'&cur_balance='+cur_balance;
                                var client1 = new XMLHttpRequest();
                                client1.open("POST",'updateLog',true);
                                client1.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                                client1.send(prams);

                                alert('정상적으로 수수료를 납부하였습니다.');
                                location.href='/accounts/acceptList';

                            }else{
                                alert('이더가 충분하지 않습니다.');
                            }
                        });
                }else{
                    alert('취소했습니다.');
                }
            }
        });
    }

    function getFileName(){
        var curlDate = new Date();
        var file_name = curlDate.getFullYear().toString()+pad((curlDate.getMonth()+1).toString(),2)+pad(curlDate.getDate().toString(),2)+
                    pad(curlDate.getHours(),2)+pad(curlDate.getMinutes(),2)+pad(curlDate.getSeconds(),2)+'.xml';
                    
        return file_name;
    }

    function pad(n, width) {
        n = n + '';//string 변환
        return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
    }   