[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# 2022_ESQL

## 가계부 관리(MYSql & JavaProgram & JSP)

가계부 관리를 프로젝트 주제로 설정하고 추가 기능으로 바자회 기부를 생각하게 되었다.
먼저 account_book 데이터베이스를 테이블들을 생성하고 데이터베이스를 jsp파일과 연동시켰다.

<img width="600" alt="데이터베이스 정의" src="https://user-images.githubusercontent.com/81062538/130538204-332be06a-f939-4a2b-885e-abf154ac2884.png">

1. JSP: 가계부 전체 메뉴 페이지 만들기
첫페이지는 accountbook_user.jsp파일에서 코드를 작성하여 전체 메뉴가 나오도록 하였고 각각의 메뉴를 누르면 그 메뉴와 이어진 jsp로 새 창이 뜨면서 넘어가도록 하였다.

<img width="600" alt="가계부 전체 메뉴 페이지" src="https://user-images.githubusercontent.com/81062538/177778457-490629b6-1c0d-4e56-9295-6df40a09a053.png">

2. 회원가입 정보를 입력하면 insert_user.jsp파일로 넘어가서 새 회원의 정보가 데이터베이스의 userinfo 테이블에 저장되게 된다.

<img width="600" alt="insert_user.jsp" src="https://user-images.githubusercontent.com/81062538/177778882-a19a4189-d2d6-475a-8474-6c35667de20e.png">

3. JSP: 수입 및 지출 내역 입력란
가계부 전체 페이지에서 나의 수입 및 지출 내역 입력 메뉴를 클릭하면 나의 수입과 지출내역 입력하는 페이지로 넘어간다. 해당 페이지의 디자인은 income_expenses.jsp파일에 작성하였다. 수입 또는 지출 정보를 입력하면 insert_Income_expenses.jsp 파일로 넘어가서 해당 아이디 사용자의 지출또는 수입 정보가 데이터베이스의 income_expenses 테이블에 저장되게 된다.

<img width="600" alt="수입 및 지출 내역 입력란" src="https://user-images.githubusercontent.com/81062538/177779176-3260c8a2-d4d7-4a22-8449-3e37bf7a1104.png">

4. JSP: 가계부 전체 내역 확인하기
가계부 전체 메뉴 페이지에서 특정 아이디 가계부 내역 삭제하기 메뉴를 클릭시 가계부 전체 내역을 확인할 수 있도록 하였다. 해당 페이지 소스는 List.jsp파일에 코드를 작성하였다.

<img width="600" alt="수입 및 지출 내역 입력란" src="https://user-images.githubusercontent.com/81062538/177779822-71db30eb-f158-40a5-a090-3149e668ad2d.png">

5. JSP: 아이디로 내역 확인하기
위의 전체 가계부 내역 확인하기 페이지에서 아이디로 내역 확인하기 버튼을 클릭하면 특정 아이디의 가계부 내역만을 확인할 수 있다. search_list_id.jsp에 특정 아이디를 입력할 수 있는 디자인이 코드로 작성되어 있고, each_id_list.jsp 파일에서  입력된 아이디를 income_expenses 테이블에서 select하여 입력한 특정 아이디의 가계부 내역을 보여준다.

<img width="600" alt="아이디로 내역 확인하기" src="https://user-images.githubusercontent.com/81062538/177780127-6e1499e8-fb3b-4b09-9345-1255f2768fc9.png">

6. JSP: 바자회 기부금 입금/명단 확인
전체 가계부 메뉴 페이지에서 바자회 기부 메뉴를 클릭하면 바자회 기부를 하기 위한 메뉴 페이지가 나온다. 이 페이지는 Donate.jsp파일에서 코드를 작성하였다.

<img width="600" alt="바자회 기부금 입금/명단 확인" src="https://user-images.githubusercontent.com/81062538/177780482-bcffe8e4-3f04-4729-9fd3-d761c10b9cb5.png">
<img width="600" alt="바자회 기부금 입금/명단 확인1" src="https://user-images.githubusercontent.com/81062538/177780702-120d4c4c-fabc-4d31-9a6f-13ed6fac19dd.png">



## Cross Check 웹 DB 수정-->JAVA program에도 결과가 반영

웹에서 새로운 회원으로 가입 
<img width="600" alt="웹에서 새로운 회원으로 가입" src="https://user-images.githubusercontent.com/81062538/177781094-e4c4add9-f44c-4d59-b801-e04366002fed.png">


고급언어 프로그램에서 회원 정보를 확인해보면 아이디 12의 사용자가 추가된 것이 상호로 확인된다.

<img width="600" alt="데이터모델링" src="https://user-images.githubusercontent.com/81062538/177781269-23e846e1-6071-4fa4-92fa-13650d2bd115.png">
