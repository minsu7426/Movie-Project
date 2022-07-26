<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<style>
    /* menu start */
    * {
        margin: 0;
        padding: 0;
        text-decoration: none;
        list-style: none;
        box-sizing: border-box;
    }

    .ticketing>.ticketing_title>h1 {
        margin-left: 20px;
    }

    .ticketing>.ticketing_movie {
        position: relative;
        margin-top: 50px;
        background-color: white;
        display: flex;
    }

    .ticketing>.ticketing_movie>.ticketing_menu {
        background-color: white;
        min-width: 14%;
        text-align: center;
        border-right: 1px solid rgb(233, 224, 224);
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p {
        font-size: 18px;
        font-weight: 700;
        padding: 30px 0;
        height: 160px;
        line-height: 100px;
        margin: 0;
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p:not(:first-child) {
        border-top: 1px solid rgb(233, 224, 224);
    }

    .ticketing>.ticketing_movie>.ticketing_menu>p:nth-child(3) {
        background-color: skyblue;
        color: darkslategrey;
    }

    .ticketing>.ticketing_movie>button {
        position: absolute;
        display: inline-block;
        right: 100px;
        font-weight: 700;
        bottom: 60px;
        color: white;
        padding: 10px 25px;
        border-radius: 20px;
        background-color: #393b39;
        border: 3px solid transparent;
        text-decoration: none;
        opacity: 0.9;
        transition: all 0.3s;
    }

    .ticketing>.ticketing_movie>button:hover {
        background-color: white;
        border: 3px solid #393b39;
        color: black;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div{
        display: flex;
        width: 100%;
        margin : 20px 50px 20px;
    }

    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter{
        display: flex;
        height: 50px;
        align-items: center;
        margin-right: 40px;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter > h3{
        margin: 0 10px 0 0;
        font-size: 18px;
        font-weight: 700;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter > .radio-group {
        display: flex;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter > .radio-group > div > label{
        width: 40px;
        border: 1px solid hsla(0, 0%, 67.8%, .5);
        padding: 8px 0 8px;
        border-radius: 4px;
        text-align: center;
        cursor: pointer;
        margin: 0;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter > .radio-group > div > input{
        display: none;
    }

    .ticketing > .ticketing_movie > .ticketing_select > div > .selecter > .radio-group > div > input:checked ~ label{
        background-color: #393b39;
        color: white;
        font-weight: 700;
        transition: all 0.3s;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .price{
        display: flex;
        align-items: center;
    }

    .ticketing > .ticketing_movie > .ticketing_select > div > .price > h3{
        font-size: 18px;
        font-weight: 700;
        margin: 0;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .price > div{
        font-size: 18px;
        font-weight: 700;
    }
    .ticketing > .ticketing_movie > .ticketing_select > div > .price > div > input{
        border: 0;
        width: 150px;
        height: 50px;
        color: red;
        padding-left: 50px;
    }


    .ticketing > .ticketing_movie > .ticketing_select > .seat{
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > h4{
        font-size: 24px;
        width: 430px;
        line-height: 28px;
        text-align: center;
        height: 40px;
        border: solid 5px black;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container{
        display: flex;
        flex-direction: column;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container > div{
        display: flex;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container > .seat_row > div > input{
        display: none;
    }

    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container > .seat_row > div > label{
        width: 60px;
        height: 60px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
        border: 3px solid black;
        margin: 7px;
        text-align: center;
        font-size: 20px;
        line-height: 60px;
        transition: all 0.3s;
        cursor: pointer;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container > .seat_row > div > label:hover{
        background-color: #aaaaaa;
        transition: all 0.3s;
    }
    .ticketing > .ticketing_movie > .ticketing_select > .seat > .seat_container > .seat_row > div > input:checked~label{
        background-color: #444451;
        color: white;
    }

    .selecter > select{
        width: 100px;
        height: 30px;
        text-align: center;
        font-weight: 700;
        font-size: 16px;
        border: 2px #aaaaaa solid;
        border-radius: 10px;
    }
</style>
<script>
    $(document).ready(function(){
        $(":checkbox").change(function(){
            var total = Number($("#adult").val()) + Number($("#teen").val());
            if(total == $(":checkbox:checked").length){
                $(":checkbox:not(:checked)").attr("disabled", "disabled");
            }
            else{
                $(":checkbox").removeAttr("disabled");
            }
        });
        $("#adult").change(function(){
            $(":checkbox").removeAttr("checked");
            $(":checkbox").removeAttr("disabled");
        });
        $("#teen").change(function(){
            $(":checkbox").removeAttr("checked");
            $(":checkbox").removeAttr("disabled");
        });
    });

    function calc(){
        var a = (Number($("#adult").val()) * Number($("#adultprice").val())) + (Number($("#teen").val()) * Number($("#teenprice").val()));
        document.getElementById("price").value = a;
    }
</script>
<body>
    <div class="ticketing container">
        <div class="ticketing_title">
            <h1>예매</h1>
            <hr />
        </div>
        <form class="ticketing_movie">
            <div class="ticketing_menu">
                <p>영화선택</p>
                <p>상영시간</p>
                <p>좌석</p>
                <p>결제</p>
            </div>
            <div class="ticketing_select">
                <div>
                    <div class="selecter">
                        <h3>성인</h3>
                        <input id="adultprice" value="15000" type="hidden">
                        <select id="adult" class="radio-group" onclick="calc()">
                            <option value="0">0명</option>
                            <option value="1">1명</option>
                            <option value="2">2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                            <option value="5">5명</option>
                        </select>
                    </div>
                    <div class="selecter">
                        <h3>청소년</h3>
                        <input id="teenprice" value="10000"  type="hidden">
                        <select id="teen" class="radio-group" onclick="calc()">
                            <option value="0">0명</option>
                            <option value="1">1명</option>
                            <option value="2">2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                            <option value="5">5명</option>
                        </select>
                    </div>
                    <div class="price">
                        <h3>결제 금액</h3>
                        <div>
                            <input id="price" type="text" value="0" readonly>원
                        </div>
                    </div>
                </div>
                <div class="seat">
                    <h4>screen</h4>
                    <div class="seat_container">
                        <div class="seat_row">
                            <div>
                                <input type="checkbox" name="seat" id="seat1">
                                <label for="seat1">A1</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat2">
                                <label for="seat2">A2</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat3">
                                <label for="seat3">A3</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat4">
                                <label for="seat4">A4</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat5">
                                <label for="seat5">A5</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat6">
                                <label for="seat6">A6</label>
                            </div>
                        </div>
                        <div class="seat_row">
                            <div>
                                <input type="checkbox" name="seat" id="seat7">
                                <label for="seat7">B1</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat8">
                                <label for="seat8">B2</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat9">
                                <label for="seat9">B3</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat10">
                                <label for="seat10">B4</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat11">
                                <label for="seat11">B5</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat12">
                                <label for="seat12">B6</label>
                            </div>
                        </div>
                        <div class="seat_row">
                            <div>
                                <input type="checkbox" name="seat" id="seat13">
                                <label for="seat13">C1</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat14">
                                <label for="seat14">C2</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat15">
                                <label for="seat15">C3</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat16">
                                <label for="seat16">C4</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat17">
                                <label for="seat17">C5</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat18">
                                <label for="seat18">C6</label>
                            </div>
                        </div>
                        <div class="seat_row">
                            <div>
                                <input type="checkbox" name="seat" id="seat19">
                                <label for="seat19">D1</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat20">
                                <label for="seat20">D2</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat21">
                                <label for="seat21">D3</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat22">
                                <label for="seat22">D4</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat23">
                                <label for="seat23">D5</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat24">
                                <label for="seat24">D6</label>
                            </div>
                        </div>
                        <div class="seat_row">
                            <div>
                                <input type="checkbox" name="seat" id="seat25">
                                <label for="seat25">E1</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat26">
                                <label for="seat26">E2</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat27">
                                <label for="seat27">E3</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat28">
                                <label for="seat28">E4</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat29">
                                <label for="seat29">E5</label>
                            </div>
                            <div>
                                <input type="checkbox" name="seat" id="seat30">
                                <label for="seat30">E6</label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <button type="submit">결제하기 >></button>
        </form>
    </div>
</body>
</html>