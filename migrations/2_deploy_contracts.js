//프로젝트가 제대로 작동하는지 검증할 "Smoke Test"

//migrations 디렉토리에 생성하는 파일들은 모두 숫자로 넘버링해야 
//Truffle이 순서를 인식하고 실행해줌.

//우리가 작성한 계약을 요청하여 Election이라는 변수에 할당
var Election = artifacts.require("./Election.sol"); 

//Election을 manifest에 추가하여 우리가 migrations를 실행할 때 우리 계약이 배포되게 하자
module.exports = function(deployer) {
  deployer.deploy(Election);
};