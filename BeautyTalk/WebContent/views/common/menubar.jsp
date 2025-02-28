<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .wrap>div{width: 100%;}
    #header>div{height: 100%; float: left;}
    #header_1{width: 20%;}
    #header_2{width: 65%;}
    #header_3{width: 15%;}

            /* 검색창 스타일 */
            #header_2{position: relative;} /*기준! 이라는 뜻*/

#search_form{width: 80%; height: 20%;}

#search_form{
    margin: auto;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;/* 상하좌우로 극단으로 가려고 해서 결국 가운대 배치*/

}

#search_form>div{
    height: 100%;
    float: left;
}

#search_text{width: 80%;}
#search_btn{width: 20%;}

#search_form input{width: 100%; height: 100%;}


</style>
</head>
<body>

    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2">

                <form action="" id="search_form">
                    <div id="search_text">
                        <input type="text" name="keyword">
                    </div>
                    <div id="search_btn">
                        <input type="submit" value="검색">
                    </div>
        
                </form>
        

            </div>
            <div id="header_3"></div>
        </div>
    </div>

</body>
</html>