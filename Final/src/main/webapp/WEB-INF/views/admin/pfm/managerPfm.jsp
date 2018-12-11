<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
 /*TAB CSS*/
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px; /*--Set height of tabs--*/
    border-bottom: 1px solid #999;
    border-left: 1px solid #999;
    width: 100%;
}
ul.tabs li {
    float: left;
    margin: 0;
    padding: 0;
    height: 31px; /*--Subtract 1px from the height of the unordered list--*/
    line-height: 31px; /*--Vertically aligns the text within the tab--*/
    border: 1px solid #999;
    border-left: none;
    margin-bottom: -1px; /*--Pull the list item down 1px--*/
    overflow: hidden;
    position: relative;
    background: #e0e0e0;
}
ul.tabs li a {
    text-decoration: none;
    color: #000;
    display: block;
    font-size: 1.2em;
    padding: 0 20px;
    /*--Gives the bevel look with a 1px white border inside the list item--*/
    border: 1px solid #fff; 
    outline: none;
}
ul.tabs li a:hover {
    background: #ccc;
}

</style>

<script>

</script>

<h1>공연 관리 - 전체 목록 조회</h1>

<ul class="tabs">
    <li><a href="#tab1">콘서트</a></li>
    <li><a href="#tab2">뮤지컬&연극</a></li>
    <li><a href="#tab3">가족&아동</a></li>
</ul>