<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<title>JSC Demo</title>

<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/resources/jquery.seat-charts.css">
<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script src="/resources/jquery.seat-charts.js"></script>
<style type="text/css">
/*예약좌석*/
div.seatCharts-seat.unavailable {
    background-color: #aaa3a3;
    cursor: not-allowed;
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
    font-size: 12px;
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
    height: 34px;
    padding: -40px;
    width: 452px;
    border: 3px solid #CCC;
    background: #DCDCDC;
    text-align: center;
    line-height: -3;
    
}
           			
</style>
</head>
<body>
   <div class="wrapper">
      <div class="container">
         <div id="seat-map">
            <div class="front-indicator" >Screen</div>

         </div>
<!--          <div class="booking-details"> -->
<!--             <h2>Booking Details</h2> -->

<!--             <h3> -->
<!--                Selected Seats (<span id="counter">0</span>): -->
<!--             </h3> -->
<!--             <ul id="selected-seats"></ul> -->

<!--             Total: <b>$<span id="total">0</span></b> -->

<!--             <button class="checkout-button">Checkout &raquo;</button> -->

<!--             <div id="legend"></div> -->
<!--          </div> -->
      </div>
   </div>



   <script>
   
      var firstSeatLabel = 1;
      
      $(document).ready(function() {
    	  				//cart  = 선택된 좌석 , counter = 선택된좌석의 갯수, total=총 좌석 갯수 sc = 좌석맵?
                     var $cart = $('#selected-seats'), $counter = $('#counter'), $total = $('#total'), sc = $('#seat-map')
                           .seatCharts(
                                 {
									map : [${seatMap.seats }],
                                    seats : {
                                       s : {
                                          price : ${seatMap.pay}, //좌석 가격
                                          classes : '${seatMap.appName}'+' '+'${seatMap.secName}' +' '+"${seatMap.pay}" , //your custom CSS class
                                          category : '${seatMap.appName}'
                                       },
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
                                            var seatArr = new Array();
                                            var id= this.settings.id;
    		  								seatArr= id.split("_");
                                         	var area = seatArr[0];
                                          	var row = seatArr[1];
                                          	var col = seatArr[2];
                                          
                                          $(
                                                '<li>'
                                                      + this.data().category
                                                      + ' 석 '
//                                                       + this.settings.label 
//                                                       + this.settings.id
                                                      + area + "구역 " +row+"행 "+col+"열"
                                                      + ' : '
                                                      + this.data().price
                                                      + '<b> 원'
                                                      + '</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
                                                .attr('id','cart-item-'+ this.settings.id)
                                                .data('seatId',this.settings.id).appendTo($cart);

                                          /*
                                           * Lets update the counter and total
                                           *
                                           * .find function will not find the current seat, because it will change its stauts only after return
                                           * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
                                           */
                                          $counter.text(sc.find('selected').length + 1);
                                          $total.text(recalculateTotal(sc)+ this.data().price);
                                       
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

                     //this will handle "[cancel]" link clicks
                     $('#selected-seats').on('click','.cancel-cart-item',function() {
                              //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
                              console.log(sc.get($(this).parents('li:first').data('seatId')));
                              sc.get($(this).parents('li:first').data('seatId')).click();
//                               console.log(sc.get($(this).parents('li:first').data('seatId')));
//                               $('#cart-item-' + this.settings.id).remove();
                           });

                     //예약된 좌석 목록 
                     //let's pretend some seats have already been booked
                     //div 아이디
                     sc.get([ 'e_1_2', '4_1', '7_1', '7_2' ]).status('unavailable');
                     
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
           			 

               });

      //총 가격 계산 
      function recalculateTotal(sc) {
         var total = 0;

         //basically find every selected seat and sum its price
         sc.find('selected').each(function() {
            total += this.data().price;
            
         });

         return total;
      }
      
      
      //좌석정보 보내기(좌석클릭시마다)
      $('.seatCharts-cell').on('click',function(){
    	  var seat = $(this).attr('id');	
		  
		  var seatArr = new Array();
		  seatArr= seat.split("_");
		  
		  var str = $(this).attr('class');
		  var array = new Array(); 
		  array = str.split(" ");
		  console.log(); // 무슨좌석인지
		  console.log() ;
		  $(".nth2").append(array[2]+"석 " +array[3]+"구역 "+" "+seatArr[1]+"행 "+seatArr[2]+"열"+" : "+${seatMap.pay});
		  $(".nth2").append('<br>');
		  
		  var resultPay = $('#total').text();
		  resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  $('#ticketPriceTotal').text(resultPay);
      
      });
      
      
      function btnClick() {
    	  $('#seat-map').find('.selected').each(function() {
    		  
    		  var seat = $(this).attr('id');
    		  
    		  var seatArr = new Array();
    		  seatArr= seat.split("_");
    		  
    		  var str = $(this).attr('class');
    		  var array = new Array(); 
    		  array = str.split(" ");
    		  console.log(); // 무슨좌석인지
    		  console.log() ;
    		  $(".nth2").append(array[2]+" 석" +array[3]+" 구역 "+" "+seatArr[1]+" 행 "+seatArr[2]+" 열"+" : "+${seatMap.pay});
    		  $(".nth2").append('<br>');
    	  });
    	  
//     	  console.log("가격: "+$('#total').text());
		  
		  var resultPay = $('#total').text();
		  resultPay=resultPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  $('#ticketPriceTotal').text(resultPay);
    	  
	}
      
      
   </script>
   
<!--    <button onclick="btnClick()">좌석정보 보내기</button> -->
</body>
</html>