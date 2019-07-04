const request = require("request");


var inXML = "<root><test>H_root/test</test></root>";
var calXML = "H_root/test##^^##testing||^^||";


request({
    // uri: "http://xmlapi.datafarm.co.kr/soaxmlEngineApi.jsp?apiKey=5acda40a5de6a72c70b12679",
    uri: "http://220.76.95.91:8011",
    method: "POST",
    form: {
        s_inXML: inXML,
        s_calXML: calXML
    }
}, function (error, response, body) {
    console.log(body);
});
