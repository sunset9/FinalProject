<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<html>
<head>
<title>JSC Demo</title>

<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/resources/jquery.seat-charts.css">
<!-- <script src="http://code.jquery.com/jquery-1.11.0.js"></script> -->
<script src="/resources/jquery.seat-charts.js"></script>
<style type="text/css">
/*예약좌석*/
div.seatCharts-seat.unavailable {
    background-color: #aaa3a3 !important;
    cursor: not-allowed !important;
}
/*first-class*/
div.seatCharts-seat.first-class{
	background-color: pink;
}

/*economy-class*/
div.seatCharts-seat.economy-class{
	background-color: cyan;
}

/*test-class*/
div.seatCharts-seat.test-class{
	background-color: yellow;
}

/*선택된좌석*/
div.seatCharts-seat.selected {
    background-color: #F2B134 !important;
}

div.seatCharts-row {
        margin: -25px;
    padding-top: 50px;
}
div.seatCharts-cell {
    height: 22px;
    width: 22px;
    margin: 1px;
    font-size: 0px;
    line-height: 21px;
 }   
 
 div.seatCharts-seat {
    background-color: green;
    color: white;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 2px;
    cursor: default;
    margin-right: 2px;
}
		
.front-indicator{
	height: 49px;
    padding: -40px;
    width: 548px;
    border: 3px solid #f8f8f8;
    background: #ececec;
    text-align: center;
    line-height: 42px;
    line-height: -3;
    color: #bbbbbb;
    font-size: 23px;
    
}

.glyphicon-remove:before {
    left: 5px !important;
    font-size: 12px !important;
}

.glyphicon-remove:hover {
	color: #F2B134 !important;
}


.selectSeatsList{
    padding-right: 5px;
    text-align: right;
}
           			
</style>
</head>
<body>
   <div class="wrapper">
      <div class="container">
      <div class="front-indicator">STAGE</div>
         <div id="seat-map">
         </div>
      </div>
   </div>
   <script>
      var firstSeatLabel = 1;
      var sc ;
      $(document).ready(function() {
    	  				//cart  = 선택된 좌석 , counter = 선택된좌석의 갯수, total=총 좌석 갯수  sc = 좌석맵?
    	  				var $cart = $('#selected-seats');
    	  				var $counter = $('#counter');
    	  				var $total = $('#total'); 
    	  				sc = $('#seat-map').seatCharts(
                                 {
									map : [${seatMap.seats }],
                                    seats : {
                                       s : {
                                          price : ${seatMap.pay}, //좌석 가격
                                          classes : '${seatMap.appName}'+' '+'${seatMap.secName}' +' '+"${seatMap.pay}" , //your custom CSS class
                                          category : '${seatMap.appName}'
                                       }
//                                        e : {
//                                           price : 40,
//                                           classes : 'economy-class'+' '+'A', //your custom CSS class
//                                           category : 'Economy Class'
//                                        },
//                                        d : {
//                                           price : 20,
//                                           classes : 'test-class'+' '+'A', //your custom CSS class
//                                           category : 'test Class'

//                                        }

                                    },
                                 
                                    naming : { //이름 지어주는것(id값)
                                       top : false,
//                                        getLabel : function(character, row,column) {
//                                           return firstSeatLabel++;
//                                        },
//    										rows: ['A', 'B', 'C', 'D', 'E','F','G','H','I'],
//    										columns: ['A', 'B', 'C', 'D', 'E'], 로우, 컬럼 이름 지어주기
										getId  : function(character, row, column) {
											return  '${seatMap.secName}'+'_'+row +'_'+column;
										}
										
                                    },
                                    legend : {
                                       node : $('#legend'),
                                       items : [
//                                              [ 'f', 'available','First Class' ],
//                                              [ 'e', 'available','Economy Class' ],
//                                              [ 'f', 'unavailable','Already Booked' ], 
                                             [ 's', 'available','${seatMap.appName}' ] 
                                             ]
                                    },
                                    click : function() {
                                       if (this.status() == 'available') {
                                          //let's create a new <li> which we'll add to the cart items
                                          
                                            var isTempSeat = false;
                                            var seatArr = new Array();
                                            var id= this.settings.id;
    		  								seatArr= id.split("_");
                                         	var area = seatArr[0];
                                          	var row = seatArr[1];
                                          	var col = seatArr[2];
                                          	
                                          	var price =  this.data().price;
                                          	price=price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
											  
                                          	$.ajax({
													type:"GET",
													url:"/ticket/tempTicketing",
													async: false,
													data:{
														"pfmIdx":${param.pfmIdx}
											             , "hallIdx" : ${param.hallIdx}
											             , "secName" : seatArr[0]
											             , "seatRow" : seatArr[1]
											             , "seatCol" : seatArr[2]
														},
													dataType:"json",
													success:function(res){
														if (res.isTempSeat){
															isTempSeat = true;
														}else{
															isTempSeat = false;
														}
													},
													error:function(e){
														console.log(e);
													}
												})
                                          
										 if( isTempSeat == true){
											 alert("이미선택된 좌석입니다.");
											 return "available";
										 }
                                          
                                          var IsSeatSelect = $('#seat-map').find('.selected');
                                          
                                          
                                          if (IsSeatSelect.size() == 4){
                                        	  alert ("좌석은 최대 4개만 선택 가능합니다");
                                    		  return "available";
                                    	  }
                                          
                                          
                                          $(
                                                '<tr><td class="selectSeatsList">'
                                                      + this.data().category
                                                      + '석</td><td class="selectSeatsList">'
//                                                       + this.settings.label 
//                                                       + this.settings.id
                                                      + area + "구역 </td><td class='selectSeatsList' style='width:40px; padding-right: 0px;'>" +row+"행</td><td class='selectSeatsList' style='width:40px; padding-right: 0px;'>"+col+"열</td><td class='selectSeatsList'>"
                                                      + '  </td><td class="selectSeatsList">'
                                                      + price
                                                      + ' 원'
                                                      + ' </td><td class="selectSeatsList"><a href="#" class="cancel-cart-item"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: #F2B134"></span></a></td></tr>')
                                                .attr('id','cart-item-'+ this.settings.id)
                                                .data('seatId',this.settings.id).appendTo($cart);

                                          /*
                                           * Lets update the counter and total
                                           *
                                           * .find function will not find the current seat, because it will change its stauts only after return
                                           * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
                                           */
                                          $counter.text(sc.find('selected').length + 1);
                                          
                                          var total = recalculateTotal(sc)+ this.data().price;
                                          
                                          total=total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                          
                                          $total.text(total);
                                        
                                          return 'selected';
                                       } else if (this.status() == 'selected') {
                                          //update the counter
                                          $counter.text(sc.find('selected').length - 1);
                                          //and total
                                          $total.text(recalculateTotal(sc) - this.data().price);
                                          //remove the item from our cart
                                          $('#cart-item-' + this.settings.id).remove();
                                          //seat has been vacated
                                          return 'available';
                                       } else if (this.status() == 'unavailable') {
                                          //seat has been already booked
                                          return 'unavailable';
                                       } else {
                                          return this.style();
                                       }
                                    }
                                 });
    	  				
                     //[cancel] 클릭시 작동
                     $('#selected-seats').on('click','.cancel-cart-item',function() {
                              //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                              try{
                            	  sc.get($(this).parents('tr:first').data('seatId')).click(); //좌석 클릭햇을때와 똑같은 동작
                              }catch(e){
                              }
                              var id = $(this).parents('tr:first').attr("id"); //클릭된 li의 id 구하기
                              var ids = new Array(); 
                              ids = id.split("-"); 
                              $("tr."+ids[2]).remove() //클릭된 li삭제
                           });

                     //예약된 좌석 목록 
                     //div 아이디
//                      sc.get([ 'e_1_2', '4_1', '7_1', '7_2' ]).status('unavailable');
      
                     sc.get(${seatMap.bookedSeats }).status('unavailable');
                     
                  	var seatArr = new Array();
           		  	seatArr= $cart.text().split("[cancel]");
           		  	var seatArr_2 = new Array();
           		  	var seatSected = new Array();
           		  	
           		  	for (var i=0; i<seatArr.length-1;i++){
           		  		seatArr_2 = seatArr[i].split(" ");
           		  		
           		  		seatSected.push(seatArr_2[4]);
           		  	}
           			 sc.get(seatSected).status('selected');
           			
                     $('div').find('.seatCharts-seat.${seatMap.appName}').css("background-color","${seatMap.color}");
           			 

                     
                     var row = ${seatMap.maxRow};
                     var col = ${seatMap.maxCol};
                     
                     if(row <= 15 || col <= 15 ){
                    	 $("div.seatCharts-cell").css("height","30px");
                    	 $("div.seatCharts-cell").css("width","30px");
                    	 $("div.seatCharts-row").css("margin","-15px");
                     }
                     
                     if(row >=25 || col > 25){
                    	 $("div.seatCharts-cell").css("height","20px");
                    	 $("div.seatCharts-cell").css("width","20px");
                    	 $("div.seatCharts-row").css("margin","-25px");
                    	 
                     }
                     
                     if(row >=30 || col >= 30 ){
                    	 $("div.seatCharts-cell").css("height","13px");
                    	 $("div.seatCharts-cell").css("width","13px");
                    	 $("div.seatCharts-row").css("margin","-35px");
                    	 
                     }
                     
               });

      //총 가격 계산 
      function recalculateTotal(sc) {
         var total = 0;

         //현재 클릭된 좌석가격 총액 구하기
         sc.find('selected').each(function() {
            total += this.data().price;
            
         });
    
         
         return total;
      }
      
      
      //좌석정보 보내기(좌석클릭시마다)
      $('.seatCharts-cell').on('click',function(){
    	  if($(this).hasClass('selected')){
        	  var seat = $(this).attr('id');	
    		  var seatArr = new Array();
    		  seatArr= seat.split("_");
    		  
    		  var str = $(this).attr('class');
    		  var array = new Array(); 
    		  array = str.split(" ");
    		  
    		  console.log(array);
    		  
    		  var pay = ${seatMap.pay};
    		  pay=pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    		  $(".nth2_1").append("<tr class='seatInfo "+seat+"'><td class='selectSeatsList' style='padding-left: 35px;'>"+array[2]+"석</td><td class='selectSeatsList'>" +array[3]+"구역</td><td class='selectSeatsList'>"+seatArr[1]+"행</td><td class='selectSeatsList'>"+seatArr[2]+"열</td><td class='selectSeatsList'>"+pay+" 원</td></tr>")

    		  
    	  }else{
  			  var seat = $(this).attr('id');	
	   		  var seatArr = new Array();
	   		  seatArr= seat.split("_");
	   		  
	   		  var str = $(this).attr('class');
	   		  var array = new Array(); 
	   		  array = str.split(" ");
	   		  
	   		  $("tr."+seat).remove()
    		  
    	  } 
    	  
		  var resultPay = $('#total').text();
		  resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  $('#ticketPriceTotal').text(resultPay);
      
      });
   </script>
   
</body>
</html>