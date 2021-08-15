<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="author" content="hollan" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans TC', sans-serif;
}
</style>

<base target="_self" />
<title>Welcome Onlyfriends</title>
</head>
<body>

	<c:choose>
		<c:when test="${not empty employee}">
			<%@include file="./commonpages/loginedheader.jsp"%>
		</c:when>
		<c:when test="${not empty member}">
			<%@include file="./membercommonpages/memberloginedheader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="./commonpages/header.jsp"%>
		</c:otherwise>
	</c:choose>



	<!-- main article -->
	<div class="container min-vh-75">
		<div class="row align-items-center">
			<div class="col-6 shadow bg-white p-5">
				<h1 class="card-title">OnlyFriends®</h1>
				<h2 class="card-title mt-3">The Most Popular Dating Web</h2>
				<p class="card-text mt-3">Dating, Make Friends & Meet New People</p>
				<a href="#" class="btn btn-primary mt-3">Go somewhere</a>
			</div>
			<div class="col-6">
				<style>
svg#freepik_stories-couple-floating-with-balloons:not(.animated)
              .animable {
	opacity: 0;
}

svg#freepik_stories-couple-floating-with-balloons.animated
              #freepik--background-complete--inject-99 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) zoomIn;
	animation-delay: 0s;
}

svg#freepik_stories-couple-floating-with-balloons.animated
              #freepik--Shadow--inject-99 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) zoomIn;
	animation-delay: 0s;
}

svg#freepik_stories-couple-floating-with-balloons.animated
              #freepik--Balloons--inject-99 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) zoomOut;
	animation-delay: 0s;
}

svg#freepik_stories-couple-floating-with-balloons.animated
              #freepik--character-1--inject-99 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
		lightSpeedRight;
	animation-delay: 0s;
}

svg#freepik_stories-couple-floating-with-balloons.animated
              #freepik--character-2--inject-99 {
	animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) zoomOut;
	animation-delay: 0s;
}

@
keyframes zoomIn { 0% {
	opacity: 0;
	transform: scale(0.5);
}

100


%
{
opacity


:


1
;


transform


:


scale
(


1


)
;


}
}
@
keyframes zoomOut { 0% {
	opacity: 0;
	transform: scale(1.5);
}

100


%
{
opacity


:


1
;


transform


:


scale
(


1


)
;


}
}
@
keyframes lightSpeedRight {from { transform:translate3d(50%, 0, 0)skewX(-20deg);
	opacity: 0;
}

60


%
{
transform


:


skewX
(


10deg


)
;


opacity


:


1
;


}
80


%
{
transform


:


skewX
(


-2deg


)
;


}
to {
	opacity: 1;
	transform: translate3d(0, 0, 0);
}

}
.animator-hidden {
	display: none;
}
</style>
				<svg class="animated"
					id="freepik_stories-couple-floating-with-balloons"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500"
					version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink"
					xmlns:svgjs="http://svgjs.com/svgjs">
            <g id="freepik--background-complete--inject-99"
						class="animable animator-hidden"
						style="transform-origin: 250px 226.87px">
              <rect y="382.4" width="500" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 250px 382.525px;
                "
						id="elygwwglmsmus" class="animable"></rect>
              <rect x="363" y="398.49" width="86.9" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 406.45px 398.615px;
                "
						id="el4xckgoyh8tx" class="animable"></rect>
              <rect x="357.66" y="389.21" width="8.69" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 362.005px 389.335px;
                "
						id="el8gr5un824r" class="animable"></rect>
              <rect x="280.12" y="397.5" width="19.19" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 289.715px 397.625px;
                "
						id="el0k3xeztvnfls" class="animable"></rect>
              <rect x="52.46" y="390.89" width="21.6" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 63.26px 391.015px;
                "
						id="eli84smxug9fr" class="animable"></rect>
              <rect x="82.96" y="390.89" width="27.93" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 96.925px 391.015px;
                "
						id="elxmu1zw9bmwh" class="animable"></rect>
              <rect x="207.67" y="394.99" width="46.84" height="0.25"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 231.09px 395.115px;
                "
						id="el4vgyy8imwvd" class="animable"></rect>
              <path
						d="M237,337.8H43.91a5.71,5.71,0,0,1-5.7-5.71V60.66A5.71,5.71,0,0,1,43.91,55H237a5.71,5.71,0,0,1,5.71,5.71V332.09A5.71,5.71,0,0,1,237,337.8ZM43.91,55.2a5.46,5.46,0,0,0-5.45,5.46V332.09a5.46,5.46,0,0,0,5.45,5.46H237a5.47,5.47,0,0,0,5.46-5.46V60.66A5.47,5.47,0,0,0,237,55.2Z"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 140.46px 196.4px;
                "
						id="elf041876f62l" class="animable"></path>
              <path
						d="M453.31,337.8H260.21a5.72,5.72,0,0,1-5.71-5.71V60.66A5.72,5.72,0,0,1,260.21,55h193.1A5.71,5.71,0,0,1,459,60.66V332.09A5.71,5.71,0,0,1,453.31,337.8ZM260.21,55.2a5.47,5.47,0,0,0-5.46,5.46V332.09a5.47,5.47,0,0,0,5.46,5.46h193.1a5.47,5.47,0,0,0,5.46-5.46V60.66a5.47,5.47,0,0,0-5.46-5.46Z"
						style="
                  fill: rgb(235, 235, 235);
                  transform-origin: 356.75px 196.4px;
                "
						id="el8bysyka3s6w" class="animable"></path>
              <path
						d="M230.27,92.22c-1.4-6.65-7-11.36-14.58-11.36-8.86,0-17.35,6.49-20.16,15a11.14,11.14,0,0,0-1.95-.17,14.62,14.62,0,0,0-13.83,11.76h60.39a12.83,12.83,0,0,0,.42-1.73C241.82,98.51,237.26,92.65,230.27,92.22Z"
						style="
                  fill: rgb(240, 240, 240);
                  transform-origin: 210.26px 94.155px;
                "
						id="elvitj4j7du3" class="animable"></path>
              <path
						d="M402,146c-2.37-11.28-11.93-19.27-24.73-19.27-15,0-29.42,11-34.19,25.39a19.69,19.69,0,0,0-3.31-.29c-11,0-21.52,8.93-23.45,19.95H418.69a22.73,22.73,0,0,0,.71-2.93C421.53,156.71,413.79,146.77,402,146Z"
						style="
                  fill: rgb(240, 240, 240);
                  transform-origin: 368.036px 149.255px;
                "
						id="elipj8shgw68s" class="animable"></path>
              <path
						d="M163.24,149.26h0c-2.65-10.89-12.07-18.55-24.62-18.55-12.76,0-25.06,7.9-31.43,19.09a29.17,29.17,0,0,0-17.32,11.39,13.92,13.92,0,0,0-2.85-.28c-8.47,0-16.53,6.87-18,15.34a14.66,14.66,0,0,0,0,5.37h109.8a26.57,26.57,0,0,0,3.53-9.21C184.57,159.62,176,149.26,163.24,149.26Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 125.736px 156.165px;
                "
						id="elleaajo81zw" class="animable"></path>
              <path
						d="M227.75,219.44h.05c10.42-17.58,29.95-29.93,50.21-29.93,20.59,0,36,12.75,39.94,30.79a29.45,29.45,0,0,1,21.52,18.39,26.07,26.07,0,0,1,4.75-.44c13.67,0,22.79,11.08,20.4,24.76a27.9,27.9,0,0,1-3.07,8.66H184.35a34.65,34.65,0,0,1-.49-14.87C187.47,236.17,207.12,219.44,227.75,219.44Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 274.14px 230.59px;
                "
						id="elayfmf2a6u36" class="animable"></path>
              <path
						d="M303.4,139.89c-7.58,1.72-9.26-.18-9.26-.18a52.69,52.69,0,0,0,7.12-19.52C310.29,125.81,315.29,133.13,303.4,139.89Z"
						style="
                  fill: rgb(224, 224, 224);
                  transform-origin: 302.268px 130.4px;
                "
						id="el5082fir5c8m" class="animable"></path>
              <path
						d="M301.91,136.74c-4.2,3.46-14.71,4.87-19.64,3.89,6.31,6.35,13.74,9.2,21.2,7.45,5.81-1.36,3.2-8.79,6.81-10.22s4-4.41,1.88-5.87C309.76,130.29,307,132.52,301.91,136.74Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 297.862px 140.002px;
                "
						id="elptqsej25nga" class="animable"></path>
              <path
						d="M312.85,133.87c2-.26,2.78.65,2.78.65l-2.63,1A2.37,2.37,0,0,1,312.85,133.87Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 314.198px 134.672px;
                "
						id="eljvqdmk6rssl" class="animable"></path>
              <path
						d="M283.43,140.81c-6.07-3.44-15.55-9.91-15.55-9.91s-.24,10.35,3.33,12.16c5.22,2.65,12,.08,16.91.47C285.23,140.93,283.43,140.81,283.43,140.81Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 277.998px 137.587px;
                "
						id="el3xl3dwfaca9" class="animable"></path>
              <path
						d="M296.46,142.18c8.41-1.88,8.37-4.45,8.37-4.45a95.58,95.58,0,0,1-22.7-15.2C278.46,132,279.92,141.26,296.46,142.18Z"
						style="
                  fill: rgb(230, 230, 230);
                  transform-origin: 292.651px 132.355px;
                "
						id="elj6g32il2iwk" class="animable"></path>
              <path
						d="M88.06,225.5a20.55,20.55,0,0,1-13.49,1.79c10.14-7.44,3.66-12.1,4.7-16.49C87.55,209.21,94.27,213.49,88.06,225.5Z"
						style="
                  fill: rgb(224, 224, 224);
                  transform-origin: 82.5282px 219.102px;
                "
						id="elbbrgl9t3qn" class="animable"></path>
              <path
						d="M87.11,221.65c-4.27,3.38-14.8,4.6-19.71,3.53,6.19,6.46,13.22,10.34,20.35,7.52,5.15-2,4.07-8.41,7.7-9.78s4-4.33,2-5.82C95.07,215.35,92.31,217.53,87.11,221.65Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 83.0279px 225.062px;
                "
						id="eli8qi8mvbns9" class="animable"></path>
              <path
						d="M98.1,219c2-.21,2.77.71,2.77.71l-2.65.94A2.31,2.31,0,0,1,98.1,219Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 99.4356px 219.809px;
                "
						id="elhx6ft8vysun" class="animable"></path>
              <path
						d="M68.55,225.38c-6-3.55-15.36-10.19-15.36-10.19s-.43,10.34,3.1,12.22c5.17,2.74,12,.29,16.91.78C70.35,225.53,68.55,225.38,68.55,225.38Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 63.1867px 221.961px;
                "
						id="elo72e4kz739f" class="animable"></path>
              <path
						d="M81.56,227c8.44-1.72,8.45-4.3,8.45-4.3s-5.26,24.64-23.37,22.46C72,242.47,65,225.77,81.56,227Z"
						style="
                  fill: rgb(230, 230, 230);
                  transform-origin: 78.325px 233.998px;
                "
						id="elsv2to9ixz6c" class="animable"></path>
              <path
						d="M420.67,220.11a11.16,11.16,0,0,1-7.34-1.07c6.43-2.39,3.73-5.8,4.93-7.94C422.84,211.5,425.72,214.75,420.67,220.11Z"
						style="
                  fill: rgb(224, 224, 224);
                  transform-origin: 418.332px 215.71px;
                "
						id="el9i4k4fwmk74" class="animable"></path>
              <path
						d="M420.75,218c-2.74,1.14-8.44.21-10.86-1.09,2.28,4.31,5.39,7.39,9.54,7,3-.3,3.39-3.8,5.5-4s2.76-1.67,1.91-2.76C425.86,215.84,424.09,216.57,420.75,218Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 418.546px 220.205px;
                "
						id="elf7qufksselu" class="animable"></path>
              <path
						d="M426.9,218.2c1.1.19,1.35.78,1.35.78l-1.53.1A1.24,1.24,0,0,1,426.9,218.2Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 427.476px 218.64px;
                "
						id="eltcz60geahm" class="animable"></path>
              <path
						d="M410.47,217.13c-2.61-2.75-6.53-7.63-6.53-7.63s-1.77,5.35-.2,6.87c2.3,2.2,6.23,1.94,8.74,2.93A5,5,0,0,0,410.47,217.13Z"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 407.785px 214.4px;
                "
						id="elyt2dp8wymib" class="animable"></path>
              <path
						d="M417,219.92c4.68.36,5.07-1,5.07-1s-6.43,12.13-15.6,8.28C409.7,226.6,408.57,216.81,417,219.92Z"
						style="
                  fill: rgb(230, 230, 230);
                  transform-origin: 414.27px 223.437px;
                "
						id="elcgv17pro1k7" class="animable"></path>
            </g>
            <g id="freepik--Shadow--inject-99"
						class="animable animator-hidden"
						style="transform-origin: 250px 416.24px">
              <ellipse id="freepik--path--inject-99" cx="250"
						cy="416.24" rx="193.89" ry="11.32"
						style="
                  fill: rgb(245, 245, 245);
                  transform-origin: 250px 416.24px;
                "
						class="animable"></ellipse>
            </g>
            <g id="freepik--Balloons--inject-99" class="animable"
						style="transform-origin: 254.2px 187.142px">
              <path
						d="M230.55,145.45a.22.22,0,0,1-.15-.06.22.22,0,0,1,0-.3c8.73-9.57,8.67-23.22,8.62-36.41,0-9.78-.08-19.9,3.36-28.52a.2.2,0,0,1,.28-.12.21.21,0,0,1,.12.27c-3.41,8.56-3.37,18.63-3.33,28.37.05,13.28.11,27-8.73,36.7A.26.26,0,0,1,230.55,145.45Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 236.567px 112.735px;
                "
						id="el16navaqxztw" class="animable"></path>
              <path
						d="M267.62,66.53l-.9-.43a25.52,25.52,0,0,0,1.45-3.76l1,.29A28,28,0,0,1,267.62,66.53Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 267.945px 64.435px;
                "
						id="elpzvdrs1190k" class="animable"></path>
              <path
						d="M270,58,269,58a13.36,13.36,0,0,0-2.47-8.92l.8-.6A14.34,14.34,0,0,1,270,58Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 268.287px 53.24px;
                "
						id="elj35lvm173t" class="animable"></path>
              <path
						d="M230,53.62c1.1-11.93,14.69-13.19,20.14-6.62,9.84-3,19.11,3.15,15.68,14.63-3.32,11.16-15.37,19.67-21.47,18.9l.54,1.52a.49.49,0,0,1-.55.65L242,82.27a.49.49,0,0,1-.28-.8l1.05-1.22C238,78.44,228.88,65.22,230,53.62Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 248.227px 62.8813px;
                "
						id="elwc84yb5e93k" class="animable"></path>
              <path
						d="M244.89,81.55h-.07a14.07,14.07,0,0,1-2.69-1.17.22.22,0,0,1,.23-.37A13.59,13.59,0,0,0,245,81.13a.21.21,0,0,1,.14.27A.21.21,0,0,1,244.89,81.55Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 243.601px 80.7733px;
                "
						id="elz4ivwvc8hnk" class="animable"></path>
              <path
						d="M243.32,81.05a8.55,8.55,0,0,1-1.26-.07.21.21,0,0,1-.18-.24.22.22,0,0,1,.24-.19,15.62,15.62,0,0,0,2.89,0,.22.22,0,1,1,.05.43C245,81,244.2,81.05,243.32,81.05Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 243.586px 80.796px;
                "
						id="el9efmdexole" class="animable"></path>
              <path
						d="M143.4,159a.14.14,0,0,1-.09,0c-7.44-5.83-8.54-14.7-9.71-24.08-.81-6.59-1.66-13.4-4.62-20a.15.15,0,0,1,.08-.2.15.15,0,0,1,.2.08c3,6.65,3.82,13.49,4.64,20.1,1.16,9.32,2.26,18.13,9.59,23.88a.16.16,0,0,1,0,.22A.18.18,0,0,1,143.4,159Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 136.25px 136.857px;
                "
						id="eldf0p7ze7b24" class="animable"></path>
              <path
						d="M112.47,102.65c-3.3-7.72,4.65-13,10.2-10.81,5-5.14,12.82-4.43,14.54,3.79,1.67,8-2.91,17.24-6.92,18.8l.84.76a.35.35,0,0,1-.13.58l-1.54.5a.35.35,0,0,1-.45-.4l.24-1.1C125.68,115.27,115.68,110.14,112.47,102.65Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 124.628px 102.434px;
                "
						id="el164edza2edz" class="animable"></path>
              <g id="elcy4by79cksa">
                <path
						d="M112.47,102.65c-3.3-7.72,4.65-13,10.2-10.81,5-5.14,12.82-4.43,14.54,3.79,1.67,8-2.91,17.24-6.92,18.8l.84.76a.35.35,0,0,1-.13.58l-1.54.5a.35.35,0,0,1-.45-.4l.24-1.1C125.68,115.27,115.68,110.14,112.47,102.65Z"
						style="
                    fill: rgb(255, 255, 255);
                    opacity: 0.4;
                    transform-origin: 124.628px 102.434px;
                  "
						class="animable"></path>
              </g>
              <path
						d="M129.17,115.07h-.27a.15.15,0,0,1-.14-.16c0-.09.05-.16.16-.14a11.16,11.16,0,0,0,2-.17.14.14,0,0,1,.18.12.15.15,0,0,1-.12.17A11,11,0,0,1,129.17,115.07Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 129.931px 114.832px;
                "
						id="elc51g8hnt6zj" class="animable"></path>
              <path
						d="M129,115.47a.15.15,0,0,1-.14-.1.16.16,0,0,1,.08-.2,10,10,0,0,0,1.78-1,.16.16,0,0,1,.21,0,.15.15,0,0,1,0,.21,10.61,10.61,0,0,1-1.84,1Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 129.911px 114.8px;
                "
						id="elddof5dxp1tc" class="animable"></path>
              <path
						d="M338.9,331.23a.2.2,0,0,1-.2-.18c-1.65-13,5.88-22.76,13.87-33.13,5.59-7.28,11.38-14.81,14.91-24.19a.21.21,0,1,1,.39.15c-3.55,9.44-9.36,17-15,24.29-7.93,10.3-15.42,20-13.79,32.83a.22.22,0,0,1-.18.23Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 353.182px 302.403px;
                "
						id="elksw67749t7c" class="animable"></path>
              <path
						d="M363.14,245.63c4.25-10.8,17.23-8.3,20.53-.71,10-.16,16.92,8.1,10.63,17.86-6.11,9.47-19.63,14.14-25.09,11.77l.09,1.56a.47.47,0,0,1-.69.45l-2-1a.47.47,0,0,1-.05-.82l1.31-.86C363.86,270.89,359,256.13,363.14,245.63Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 379.134px 257.489px;
                "
						id="el4ymzwph6i1" class="animable"></path>
              <g id="eldab1jhcn0mr">
                <path
						d="M363.14,245.63c4.25-10.8,17.23-8.3,20.53-.71,10-.16,16.92,8.1,10.63,17.86-6.11,9.47-19.63,14.14-25.09,11.77l.09,1.56a.47.47,0,0,1-.69.45l-2-1a.47.47,0,0,1-.05-.82l1.31-.86C363.86,270.89,359,256.13,363.14,245.63Z"
						style="opacity: 0.4; transform-origin: 379.134px 257.489px"
						class="animable"></path>
              </g>
              <path
						d="M369.53,275.67a.21.21,0,0,1-.11,0,14.11,14.11,0,0,1-2.19-1.82.2.2,0,0,1,0-.29.21.21,0,0,1,.29,0,13.37,13.37,0,0,0,2.11,1.75.21.21,0,0,1,.06.29A.22.22,0,0,1,369.53,275.67Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 368.446px 274.59px;
                "
						id="elfk289ur6xp4" class="animable"></path>
              <path
						d="M369.83,275.17h0a15.11,15.11,0,0,1-2.79-.8.2.2,0,0,1-.1-.27.2.2,0,0,1,.27-.11,14.76,14.76,0,0,0,2.7.77.22.22,0,0,1,.17.25A.21.21,0,0,1,369.83,275.17Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 368.501px 274.573px;
                "
						id="el1yjd5l0vjrx" class="animable"></path>
            </g>
            <g id="freepik--character-1--inject-99" class="animable"
						style="transform-origin: 148.634px 287.182px">
              <path
						d="M194.17,225.67c8.15,17.14-28.59,23.33-52.3,35.08-10-9.27-6.19-20-14.64-34.72,1.44-3.68,8.15-12.6,13.45-14.69-4.14.54-11.86,7.63-15.13,14.29-.64-1-1.33-2-2.08-3,1.91-7.7,18.05-20.88,34.41-18s16.73-17.19,27.87-11c7.09-2.84,11.49,4,11,10C196.1,211.66,188.83,214.45,194.17,225.67Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 160.129px 226.594px;
                "
						id="elb3sktq5g4fa" class="animable"></path>
              <path
						d="M86.7,290s0-2.63-3.59-3.81-13.8-2.72-13.8-2.72l-.23.92s9.11,2,10.65,2.82c-4.8-.93-11.61.94-12.75,5.41-.41,1.59,7.69,0,12.23.54s6.11.77,6.11.77Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 76.8325px 288.7px;
                "
						id="el98gayhjnqb9" class="animable"></path>
              <path
						d="M89.14,294.72l-2.51-5.24c-4.94-1-11.57-.44-14.19,1.34a1,1,0,0,0,.55,1.71A81.18,81.18,0,0,1,89.14,294.72Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 80.6368px 291.854px;
                "
						id="el4lirzgl55wo" class="animable"></path>
              <path
						d="M106.75,362.29a3.14,3.14,0,0,0-4,.32,8.39,8.39,0,0,0-1,1.26C99.75,367,95,376.23,95,376.23l.79.52s5.45-8.39,6.57-9.66c-2.12,4.44-5.24,10.55,1.09,14.77,1.37.9,2-7.61,3.74-11.91s2.35-5.79,2.35-5.79Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 102.27px 371.822px;
                "
						id="elk0ry5zlya9h" class="animable"></path>
              <path
						d="M114.62,358.6l-8.51,3.26c-2.28,4.55-3.76,10.89-2.8,14a.91.91,0,0,0,1.73,0A42.22,42.22,0,0,1,114.62,358.6Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 108.816px 367.544px;
                "
						id="elq5k6iv1xbj" class="animable"></path>
              <path
						d="M172.59,265.71s-18.74,32.14-28.41,49.43-34.52,50.08-34.52,50.08l-3.55-3.36s11.75-34.72,27.33-51.37c6.66-38.58,22.27-53.32,22.27-53.32Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 139.35px 311.195px;
                "
						id="el8oict9076uw" class="animable"></path>
              <path
						d="M168,263.42s-27.61,30.22-38.17,44c-3.6,4.7-43.65-12-48.26-15.38l2.69-2.67s23.61,1.43,38.24,5.52c16.49-41.46,30.76-40.23,30.76-40.23Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 124.785px 281.452px;
                "
						id="elowd3ok81nb" class="animable"></path>
              <path
						d="M222.29,242.5l4.11-1.16-1.28,5.91s-4.69,1.61-5.89-1.61l.31-.72A4.23,4.23,0,0,1,222.29,242.5Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 222.815px 244.496px;
                "
						id="elcl534wdmz1v" class="animable"></path>
              <path
						d="M230.2,244.85l-.51,1.48a2,2,0,0,1-2.24,1.32l-2.33-.4,1.28-5.91,2.6,1A2,2,0,0,1,230.2,244.85Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 227.712px 244.51px;
                "
						id="elpch125z6mlm" class="animable"></path>
              <path
						d="M190.59,230.62c.11.19.32.56.51.87l.59,1c.42.64.86,1.28,1.32,1.9a36.36,36.36,0,0,0,2.93,3.61,40.36,40.36,0,0,0,3.35,3.19c.59.49,1.2,1,1.81,1.42l1,.66.23.16c.06,0,0,0,0,0h0l0,0,.09,0a8.56,8.56,0,0,0,1.77.35c.73.08,1.51.12,2.31.14,1.59,0,3.24,0,4.91-.06,3.33-.16,6.74-.38,10.1-.63h0a1.84,1.84,0,0,1,.68,3.6,84.92,84.92,0,0,1-10.21,2.5c-1.74.31-3.5.57-5.33.73-.92.07-1.85.12-2.83.11a13.86,13.86,0,0,1-3.3-.38l-.53-.17-.26-.09-.3-.13c-.19-.09-.45-.21-.57-.28l-.31-.18-1.23-.71c-.8-.49-1.6-1-2.36-1.57a35.81,35.81,0,0,1-4.29-3.67,40.17,40.17,0,0,1-3.69-4.24c-.56-.75-1.09-1.53-1.6-2.33-.25-.4-.51-.8-.75-1.22s-.44-.82-.72-1.39a3.7,3.7,0,0,1,6.54-3.46Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 203.515px 239.304px;
                "
						id="elxpsn1hmcz8o" class="animable"></path>
              <path
						d="M190.16,237.27c-2.38,4.95.29,9.54-6,11.11a172,172,0,0,1-10.94,18c-2.25,1.21-12-3.93-21.13-11.35,4.2-5.31,8.38-15.31,11.27-30.42a6,6,0,0,1,7.65-4.62c.91.27,1.87.59,2.84.94a76.11,76.11,0,0,1,10,4.15c1,.55,2.09,1.15,3.08,1.74A8.12,8.12,0,0,1,190.16,237.27Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 171.51px 243.142px;
                "
						id="el4vzgxqw52ko" class="animable"></path>
              <g id="ela96j5bbks1b">
                <path
						d="M190.16,237.27c-2.38,4.95.29,9.54-6,11.11a172,172,0,0,1-10.94,18c-2.25,1.21-12-3.93-21.13-11.35,4.2-5.31,8.38-15.31,11.27-30.42a6,6,0,0,1,7.65-4.62c.91.27,1.87.59,2.84.94a76.11,76.11,0,0,1,10,4.15c1,.55,2.09,1.15,3.08,1.74A8.12,8.12,0,0,1,190.16,237.27Z"
						style="
                    fill: rgb(255, 255, 255);
                    opacity: 0.3;
                    transform-origin: 171.51px 243.142px;
                  "
						class="animable"></path>
              </g>
              <path
						d="M179.55,210.1c-.71,3.47-2.53,9.6-5.66,10.81,0,0,7.18,6.66,8.37,15.14,5.46-5.79,1.59-11,1.59-11-3.22-2.34-2-5-.36-7.19Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 179.535px 223.075px;
                "
						id="elbq7clbyvd0d" class="animable"></path>
              <path
						d="M173.26,266.36c-5.7,25.51-13.11,67.73-19.5,75.32-8.35,6.23-22.35-.33-25.28-5.59-1.93-3.45-.62-5.52-7.32-7.92s-9.28-6.6-8-10.75c1.71-5.52-.07-12-7.27-16.21s-7.28-10.1-4.91-11.28,14.44,3.11,20.83-3.47c3.84-3.94,14.57-32.89,31-32.3C167.69,262.87,173.26,266.36,173.26,266.36Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 136.425px 299.184px;
                "
						id="el7b8ktbkixtb" class="animable"></path>
              <g id="elkziac7u2zu">
                <path
						d="M151.35,284.38a57.11,57.11,0,0,0-7.6,41.45S146.3,299.82,151.35,284.38Z"
						style="opacity: 0.1; transform-origin: 147px 305.105px"
						class="animable"></path>
              </g>
              <g id="elpm10yv4s2gh">
                <path
						d="M156.69,277.64a34.37,34.37,0,0,0-3,25.17S154.26,287.1,156.69,277.64Z"
						style="opacity: 0.1; transform-origin: 154.617px 290.225px"
						class="animable"></path>
              </g>
              <path
						d="M174.32,264.87a.29.29,0,0,1,.22.34,9.87,9.87,0,0,1-1,2.19s-.14,1.36-9.9-3.85c-8.31-4.43-11.71-8.16-12.54-9.18a.3.3,0,0,1,.08-.45,6.47,6.47,0,0,1,2.07-.8.34.34,0,0,1,.27.1,50.37,50.37,0,0,0,11.68,7.8A49,49,0,0,0,174.32,264.87Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 162.789px 260.339px;
                "
						id="ela51egyxqwxk" class="animable"></path>
              <g id="el58z3eg4fis">
                <path
						d="M181.15,213.27l2.33,4.6a11.56,11.56,0,0,0-1,1.64c-1.28-.77-2.53-3-2.08-4.54A5.31,5.31,0,0,1,181.15,213.27Z"
						style="opacity: 0.2; transform-origin: 181.893px 216.39px"
						class="animable"></path>
              </g>
              <path
						d="M176.36,204.4c.24,5.8.22,8.27,3,11.29,4.23,4.56,11.17,3,12.63-2.78,1.32-5.18.7-13.8-4.82-16.21A7.8,7.8,0,0,0,176.36,204.4Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 184.46px 207.217px;
                "
						id="elt39yyn4ba8j" class="animable"></path>
              <path
						d="M183.31,194.76c5.67,5.41,8,3.71,9.33,6.15C192.51,197.12,187.11,194.48,183.31,194.76Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 187.975px 197.825px;
                "
						id="elgzx268vwnr5" class="animable"></path>
              <path
						d="M186.14,195c5.88,6.37-11,9.82-13,16.49C170.92,201.55,176.4,193.69,186.14,195Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 180.013px 203.173px;
                "
						id="elduwb7vipwjt" class="animable"></path>
              <path
						d="M189.63,211.69a36.16,36.16,0,0,0-6.36-1.51c.37,1.44,1.25,2.71,3.67,3.12S189.63,211.69,189.63,211.69Z"
						style="
                  fill: rgb(255, 255, 255);
                  transform-origin: 186.45px 211.767px;
                "
						id="elbp6a3lllbac" class="animable"></path>
              <path
						d="M185.31,205.81c0,.47.23.86.54.87s.57-.38.58-.85-.24-.86-.55-.86S185.32,205.34,185.31,205.81Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 185.87px 205.825px;
                "
						id="elifnrfhpdd8i" class="animable"></path>
              <path
						d="M191.11,206c0,.47.24.86.54.87s.57-.38.58-.85-.24-.86-.54-.86S191.12,205.53,191.11,206Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 191.67px 206.015px;
                "
						id="el7fubah8jbxr" class="animable"></path>
              <path
						d="M191.55,205.18l1.14-.3S192.09,205.75,191.55,205.18Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 192.12px 205.127px;
                "
						id="elt019shfcv9" class="animable"></path>
              <path
						d="M189.44,206.72a12.5,12.5,0,0,0,1.62,3,2,2,0,0,1-1.69.29Z"
						style="
                  fill: rgb(237, 132, 126);
                  transform-origin: 190.215px 208.402px;
                "
						id="els9ad8kbsx79" class="animable"></path>
              <path
						d="M174.22,208.38a3.76,3.76,0,0,0,2.25,2.09c1.28.38,1.95-1,1.61-2.46s-1.33-3.06-2.63-2.8S173.65,207.1,174.22,208.38Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 176.077px 207.858px;
                "
						id="elvnxb1inrde" class="animable"></path>
              <path
						d="M183.43,204.27a.25.25,0,0,0,.16-.14,2.2,2.2,0,0,1,1.59-1.22.28.28,0,0,0-.06-.56,2.75,2.75,0,0,0-2,1.53.27.27,0,0,0,.12.37A.26.26,0,0,0,183.43,204.27Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 184.26px 203.314px;
                "
						id="elk52gdsk0hr" class="animable"></path>
              <path
						d="M193,203a.29.29,0,0,0,.19-.08.28.28,0,0,0,0-.39,2.75,2.75,0,0,0-2.4-.79.27.27,0,0,0-.21.33.28.28,0,0,0,.33.21,2.19,2.19,0,0,1,1.89.65A.27.27,0,0,0,193,203Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 191.921px 202.353px;
                "
						id="eldqfpjkzjk39" class="animable"></path>
              <path d="M185.75,205l1.14-.3S186.29,205.56,185.75,205Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 186.32px 204.945px;
                "
						id="el487vgdbeybs" class="animable"></path>
              <path
						d="M183.87,248.47l5.08-.95-.63,5.89s-3.82-.2-6-2l-.2-.78A2.37,2.37,0,0,1,183.87,248.47Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 185.535px 250.465px;
                "
						id="elfhyo9ywwzft" class="animable"></path>
              <path
						d="M192,250.07l-.62,2.49a1.47,1.47,0,0,1-1.67,1.09l-1.43-.24.63-5.89,2.18.82A1.47,1.47,0,0,1,192,250.07Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 190.162px 250.595px;
                "
						id="el9r5xckesx8r" class="animable"></path>
              <path
						d="M172.52,224.55c-.28,1.48-.58,3.14-.81,4.73s-.47,3.2-.61,4.8a48.87,48.87,0,0,0-.14,9.34l.06.55,0,.28,0,.14v0c0-.05,0-.1-.05-.15-.29-.73-.47-.67-.38-.62a5.61,5.61,0,0,0,1.38.87,37.28,37.28,0,0,0,4.33,1.67c3.08,1,6.34,1.92,9.54,2.81h.05a1.86,1.86,0,0,1,1.28,2.28,1.84,1.84,0,0,1-1.81,1.35,67.73,67.73,0,0,1-10.42-1,34.7,34.7,0,0,1-5.36-1.34,11.58,11.58,0,0,1-3.08-1.56,5.1,5.1,0,0,1-1-.89,4.69,4.69,0,0,1-1-1.7l-.09-.29,0-.19,0-.18-.07-.35-.14-.7a35.55,35.55,0,0,1-.57-5.54,48.47,48.47,0,0,1,.11-5.4,66,66,0,0,1,1.49-10.56,3.71,3.71,0,0,1,7.26,1.49Z"
						style="
                  fill: rgb(255, 195, 189);
                  transform-origin: 175.418px 236.356px;
                "
						id="elgmhowko6ssc" class="animable"></path>
            </g>
            <g id="freepik--character-2--inject-99" class="animable"
						style="transform-origin: 297.84px 216.451px">
              <path
						d="M339.54,195a.23.23,0,0,1-.22-.18c-2.64-13.67.91-31.23,4.34-48.21,2.93-14.52,5.71-28.24,4.41-38.46a.22.22,0,0,1,.19-.25.22.22,0,0,1,.25.19c1.3,10.3-1.48,24.05-4.42,38.6-3.42,16.94-7,34.46-4.33,48a.23.23,0,0,1-.18.26Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 343.62px 151.449px;
                "
						id="eleu294hteq7b" class="animable"></path>
              <path
						d="M367.66,85c2-12.13-11.19-16.87-18.29-11.75-9-5.54-19.78-1.79-19.33,10.49.43,11.93,10.2,23.48,16.45,24.29l-.92,1.37a.5.5,0,0,0,.38.78l2.38.17a.51.51,0,0,0,.48-.73l-.72-1.48C353.34,107.57,365.74,96.77,367.66,85Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 348.945px 90.551px;
                "
						id="elryuz4jz5a4p" class="animable"></path>
              <g id="el825h1hi69nr">
                <path
						d="M367.66,85c2-12.13-11.19-16.87-18.29-11.75-9-5.54-19.78-1.79-19.33,10.49.43,11.93,10.2,23.48,16.45,24.29l-.92,1.37a.5.5,0,0,0,.38.78l2.38.17a.51.51,0,0,0,.48-.73l-.72-1.48C353.34,107.57,365.74,96.77,367.66,85Z"
						style="
                    fill: rgb(255, 255, 255);
                    opacity: 0.4;
                    transform-origin: 348.945px 90.551px;
                  "
						class="animable"></path>
              </g>
              <path
						d="M345.71,108.88a.22.22,0,0,1-.22-.21.22.22,0,0,1,.2-.24,14.58,14.58,0,0,0,2.87-.45.22.22,0,0,1,.28.15.22.22,0,0,1-.15.27,15.34,15.34,0,0,1-3,.48Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 347.169px 108.425px;
                "
						id="elm3p0d754vii" class="animable"></path>
              <path
						d="M348.63,109h0a17,17,0,0,1-3-.78.23.23,0,0,1-.13-.29.22.22,0,0,1,.28-.13,15.63,15.63,0,0,0,2.87.76.22.22,0,0,1,0,.44Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 347.178px 108.394px;
                "
						id="eljkezavg7ux" class="animable"></path>
              <path
						d="M338.61,195.76h0a.21.21,0,0,1-.2-.23c1.38-18.87,14.07-37.37,25.27-53.69,5.36-7.81,10.42-15.19,13.56-21.69a.22.22,0,1,1,.39.19c-3.15,6.53-8.22,13.92-13.59,21.74-11.17,16.28-23.82,34.72-25.2,53.48A.22.22,0,0,1,338.61,195.76Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 358.04px 157.876px;
                "
						id="elxvot8g8y56" class="animable"></path>
              <path
						d="M405.88,111.48c8.14-9-.2-20-8.82-19.54-4.46-9.4-15.4-12.09-21.62-1.7-6,10.1-4.16,24.9.58,28.92l-1.5.63a.51.51,0,0,0-.11.86l1.88,1.41a.5.5,0,0,0,.79-.34l.2-1.61C381.91,122.47,398,120.19,405.88,111.48Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 390.426px 102.867px;
                "
						id="el88r3tmy58d" class="animable"></path>
              <path
						d="M377.68,120.67h-.06a14.38,14.38,0,0,1-2.71-1.21.22.22,0,0,1,.22-.38,14.52,14.52,0,0,0,2.61,1.17.21.21,0,0,1,.15.26A.21.21,0,0,1,377.68,120.67Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 376.355px 119.864px;
                "
						id="elfomf96f10o" class="animable"></path>
              <path
						d="M377.35,121.18a.19.19,0,0,1-.14-.05,15.51,15.51,0,0,1-2-2.24.2.2,0,0,1,0-.3.22.22,0,0,1,.3,0,15.81,15.81,0,0,0,2,2.17.21.21,0,0,1,0,.3A.2.2,0,0,1,377.35,121.18Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 376.358px 119.856px;
                "
						id="elhfkvsdmndto" class="animable"></path>
              <path
						d="M339.16,194.94h0a.25.25,0,0,1-.23-.27c1.31-16,8-34.26,14.48-51.88,5.26-14.32,10.23-27.84,11.9-39.11a.24.24,0,0,1,.28-.21.25.25,0,0,1,.21.28c-1.67,11.32-6.65,24.87-11.92,39.21-6.46,17.59-13.14,35.77-14.45,51.75A.25.25,0,0,1,339.16,194.94Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 352.366px 149.204px;
                "
						id="el0bmdszkry7" class="animable"></path>
              <path
						d="M393.73,84.35c5.86-12.63-7.05-21.83-16.36-18.41-8.11-8.78-21-8-24.29,5.55-3.17,13.15,4,28.73,10.54,31.51l-1.43,1.22a.57.57,0,0,0,.18,1l2.54.9a.57.57,0,0,0,.75-.64l-.33-1.84C371.22,104.61,388,96.61,393.73,84.35Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 373.754px 83.1621px;
                "
						id="elsf7p016an78" class="animable"></path>
              <g id="el1h2fq014nvs">
                <path
						d="M393.73,84.35c5.86-12.63-7.05-21.83-16.36-18.41-8.11-8.78-21-8-24.29,5.55-3.17,13.15,4,28.73,10.54,31.51l-1.43,1.22a.57.57,0,0,0,.18,1l2.54.9a.57.57,0,0,0,.75-.64l-.33-1.84C371.22,104.61,388,96.61,393.73,84.35Z"
						style="opacity: 0.4; transform-origin: 373.754px 83.1621px"
						class="animable"></path>
              </g>
              <path
						d="M365.69,104.11a17.43,17.43,0,0,1-3.18-.4.24.24,0,0,1-.19-.29.25.25,0,0,1,.3-.19,16.32,16.32,0,0,0,3.26.38h0a.24.24,0,0,1,.25.24.25.25,0,0,1-.24.26Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 364.222px 103.667px;
                "
						id="el6b6vh584m6" class="animable"></path>
              <path
						d="M365.7,104.78l-.09,0a18,18,0,0,1-3-1.76.24.24,0,0,1-.06-.35.25.25,0,0,1,.35-.05,18.3,18.3,0,0,0,2.9,1.7.25.25,0,0,1,.14.32A.26.26,0,0,1,365.7,104.78Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 364.228px 103.675px;
                "
						id="el5cazat9ntom" class="animable"></path>
              <path
						d="M337.76,198.66h0a.23.23,0,0,1-.18-.26c4.52-25.25,12.48-43.46,27.47-62.84a.21.21,0,0,1,.31,0,.23.23,0,0,1,0,.31c-14.94,19.32-22.88,37.47-27.39,62.65A.21.21,0,0,1,337.76,198.66Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 351.499px 167.076px;
                "
						id="elud43t5s8y5b" class="animable"></path>
              <path
						d="M360.25,105.9c4.46-11.46,18.21-8.87,21.73-.85,10.55-.21,17.95,8.5,11.33,18.85C386.88,134,372.6,139,366.81,136.48l.1,1.64a.5.5,0,0,1-.73.48l-2.13-1.06a.5.5,0,0,1-.05-.87l1.37-.91C361.13,132.62,355.93,117,360.25,105.9Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 377.224px 118.406px;
                "
						id="el63w3e3hepyt" class="animable"></path>
              <g id="elieyzdsx3xv">
                <path
						d="M360.25,105.9c4.46-11.46,18.21-8.87,21.73-.85,10.55-.21,17.95,8.5,11.33,18.85C386.88,134,372.6,139,366.81,136.48l.1,1.64a.5.5,0,0,1-.73.48l-2.13-1.06a.5.5,0,0,1-.05-.87l1.37-.91C361.13,132.62,355.93,117,360.25,105.9Z"
						style="
                    fill: rgb(255, 255, 255);
                    opacity: 0.4;
                    transform-origin: 377.224px 118.406px;
                  "
						class="animable"></path>
              </g>
              <path
						d="M367.16,137.65a.28.28,0,0,1-.13,0,15.15,15.15,0,0,1-2.32-1.92.22.22,0,0,1,0-.31.21.21,0,0,1,.31,0,14.24,14.24,0,0,0,2.24,1.84.22.22,0,0,1,.06.31A.21.21,0,0,1,367.16,137.65Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 366.003px 136.505px;
                "
						id="elni6pb0ghapr" class="animable"></path>
              <path
						d="M367.47,137.12h0a15.39,15.39,0,0,1-3-.84.22.22,0,0,1,.18-.4,17,17,0,0,0,2.86.81.2.2,0,0,1,.17.25A.21.21,0,0,1,367.47,137.12Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 366.021px 136.494px;
                "
						id="elg13d0pbz13" class="animable"></path>
              <path
						d="M338.18,199.76h0a.22.22,0,0,1-.18-.25c2-13.68,0-26.18-1.89-38.28-1.64-10.23-3.18-19.9-2.35-29.93a.21.21,0,0,1,.23-.2.22.22,0,0,1,.2.24c-.83,10,.71,19.62,2.35,29.82,1.93,12.13,3.94,24.67,1.89,38.41A.22.22,0,0,1,338.18,199.76Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 336.409px 165.431px;
                "
						id="elbswpszpe3j8" class="animable"></path>
              <path
						d="M313.88,109.33c-2.46-11.87,10.3-17.1,17.51-12.37,8.62-5.83,19.41-2.6,19.49,9.52.08,11.76-9.05,23.56-15.17,24.62l1,1.31a.5.5,0,0,1-.35.78l-2.33.27a.5.5,0,0,1-.51-.69l.65-1.49C329,131,316.27,120.85,313.88,109.33Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 332.225px 113.802px;
                "
						id="elhe7qmjmqq5" class="animable"></path>
              <g id="elp61opqx8r5">
                <path
						d="M313.88,109.33c-2.46-11.87,10.3-17.1,17.51-12.37,8.62-5.83,19.41-2.6,19.49,9.52.08,11.76-9.05,23.56-15.17,24.62l1,1.31a.5.5,0,0,1-.35.78l-2.33.27a.5.5,0,0,1-.51-.69l.65-1.49C329,131,316.27,120.85,313.88,109.33Z"
						style="opacity: 0.4; transform-origin: 332.225px 113.802px"
						class="animable"></path>
              </g>
              <path
						d="M336.51,131.92h0a14.81,14.81,0,0,1-2.95-.34.2.2,0,0,1-.15-.26.21.21,0,0,1,.26-.16,14.24,14.24,0,0,0,2.84.32.23.23,0,0,1,.22.22A.22.22,0,0,1,336.51,131.92Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 335.065px 131.536px;
                "
						id="elv4vg10pesqc" class="animable"></path>
              <path
						d="M333.64,132.2a.21.21,0,0,1-.21-.19.22.22,0,0,1,.18-.25,15.9,15.9,0,0,0,2.79-.86.22.22,0,0,1,.29.11.23.23,0,0,1-.12.29,15.34,15.34,0,0,1-2.9.89Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 335.066px 131.54px;
                "
						id="el30wywfbsqyh" class="animable"></path>
              <path
						d="M338.15,198.78h0a.25.25,0,0,1-.22-.28c.48-3.94.93-7.94,1.37-11.8,2.55-22.45,5-43.66,13.08-63.68a.24.24,0,0,1,.32-.14.25.25,0,0,1,.14.33c-8.1,20-10.5,41.13-13,63.54-.44,3.87-.89,7.87-1.37,11.81A.26.26,0,0,1,338.15,198.78Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 345.394px 160.824px;
                "
						id="elu7wu97dagt" class="animable"></path>
              <path
						d="M338.11,92.11c1.36-13.85,17.15-15.22,23.45-7.55,11.44-3.45,22.17,3.79,18.11,17.11-3.95,12.93-18,22.74-25.08,21.8l.61,1.77a.57.57,0,0,1-.64.75l-2.65-.51a.58.58,0,0,1-.33-.94l1.23-1.41C347.22,121,336.79,105.57,338.11,92.11Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 359.271px 102.957px;
                "
						id="elzyjvj4abk2f" class="animable"></path>
              <path
						d="M355.26,124.66h-.07a17.64,17.64,0,0,1-3.12-1.38.25.25,0,0,1-.08-.35.25.25,0,0,1,.34-.08,15.85,15.85,0,0,0,3,1.33.26.26,0,0,1,.16.32A.25.25,0,0,1,355.26,124.66Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 353.725px 123.737px;
                "
						id="ele2a7pjs1gte" class="animable"></path>
              <path
						d="M353.55,124.07A11.34,11.34,0,0,1,352,124a.26.26,0,0,1-.21-.29.25.25,0,0,1,.29-.21,17.66,17.66,0,0,0,3.36,0,.24.24,0,0,1,.27.22.25.25,0,0,1-.23.27S354.53,124.07,353.55,124.07Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 353.749px 123.785px;
                "
						id="elt19kyn4izp" class="animable"></path>
              <path
						d="M296.23,205.65c1.85,0,3.92,0,5.88-.09s3.94-.15,5.86-.27,3.81-.33,5.55-.62c.86-.14,1.68-.33,2.4-.51a10.76,10.76,0,0,0,1.63-.56l-.82.68c.29-.29.53-.47.87-.84s.63-.66,1-1.05c.67-.73,1.35-1.52,2-2.32l4.09-4.92c2.74-3.33,5.51-6.71,8.4-10l0,0a3.05,3.05,0,0,1,5.09,3.23c-1.77,4.1-3.78,8-5.93,11.92-1.1,1.93-2.21,3.87-3.42,5.78-.62,1-1.24,1.92-1.93,2.9a32.18,32.18,0,0,1-2.41,3.07,3.29,3.29,0,0,1-.48.44l-.33.23a19,19,0,0,1-4,2.14A32.39,32.39,0,0,1,316,216a53,53,0,0,1-6.86,1.27c-2.24.3-4.45.44-6.65.54s-4.34.11-6.68,0a6.09,6.09,0,0,1,.24-12.18Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 314.137px 200.999px;
                "
						id="elq6z5sdvqer" class="animable"></path>
              <path
						d="M334.46,183.11l2.73-2.62,3.87,7.39s-4.49,3.39-7.07,1.81a1.47,1.47,0,0,1-.6-.77l-.2-.6A5,5,0,0,1,334.46,183.11Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 336.993px 185.3px;
                "
						id="elnkp54qway5i" class="animable"></path>
              <path
						d="M344.41,180.57l.92,2.82a2.39,2.39,0,0,1-1.18,2.88l-3.09,1.61-3.87-7.39,4.13-1.45A2.41,2.41,0,0,1,344.41,180.57Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 341.321px 183.392px;
                "
						id="el7p54qocn9ad" class="animable"></path>
              <path
						d="M264.5,315.06c.12-28.9,8.77-68.44,8.77-68.44l23,13.7s-10.1,42.74-17.11,60.59c-7.28,18.56-45.33,40.89-45.33,40.89l-5.06-6.16S253.8,332.86,264.5,315.06Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 262.52px 304.21px;
                "
						id="el9178x3k3qfg" class="animable"></path>
              <g id="eljor2zytn7va">
                <path
						d="M277.37,274.37l-10,5.94c-.69,4.95-1.32,10.14-1.81,15.34C273.42,287.49,277.37,274.37,277.37,274.37Z"
						style="opacity: 0.4; transform-origin: 271.465px 285.01px"
						class="animable"></path>
              </g>
              <path
						d="M233.61,371.81s-1.13-8.24-.31-10l-4.2-5.5-4.3,1.43,1.4,3.49.77.31-.19,1.11a53.89,53.89,0,0,0,5.78,10.08A1.42,1.42,0,0,0,233.61,371.81Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 229.205px 364.52px;
                "
						id="elmwifhyx5apl" class="animable"></path>
              <polygon
						points="233.79 362.8 228.3 355.82 230.94 352.63 237.63 360.01 233.79 362.8"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 232.965px 357.715px;
                "
						id="elbu4n6igcbf" class="animable"></polygon>
              <path
						d="M236.68,299.19c14.63-24.44,21.5-38.25,30.72-49.38l24.35,12.35s-30.51,33.65-43.9,47.52c-9,9.37-53.09,25.48-53.09,25.48l-4.4-5.93S228.44,302.52,236.68,299.19Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 241.055px 292.485px;
                "
						id="elu23kk99svf" class="animable"></path>
              <path
						d="M190.64,345.64s1.44-9.32,3.05-10.32l-.79-6.06-6.42.72.66,4.94.66.51-.46,1c.39,3,1.11,8,2,9.81A1.39,1.39,0,0,0,190.64,345.64Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 190.085px 337.754px;
                "
						id="elci8uwnymaor" class="animable"></path>
              <polygon
						points="193.57 336.19 189.59 329 193.52 326.47 197.4 335.21 193.57 336.19"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 193.495px 331.33px;
                "
						id="elx5lilg44x" class="animable"></polygon>
              <path
						d="M275.07,201a111.58,111.58,0,0,1,27.8,6.75,9.81,9.81,0,0,1,5.93,9.8c-1,12.29-9.17,35-13.74,53.31-14.87,1.34-37.3-10.6-37.3-10.6,1.74-6.14,5.95-15.56,8.61-22.74.25-8-.93-17.44-.72-28A8.53,8.53,0,0,1,275.07,201Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 283.295px 235.959px;
                "
						id="elb5jtjzgnctg" class="animable"></path>
              <path
						d="M286.79,187.1l7.63,9.81c-1.94,3-3.09,6.23,1.92,8.72.93,2.05-1.73,4.68-4.38,5.34-5.27-2.53-8.14-4.75-9.62-8.2C283.54,200.6,286.61,192.08,286.79,187.1Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 289.435px 199.035px;
                "
						id="eluz1js8on9e" class="animable"></path>
              <g id="elhy7p69matuv">
                <path
						d="M290,191.19l4.45,5.72a12.08,12.08,0,0,0-1.18,2.16c-2.15-.33-4.61-3.14-4.31-5.1A8.26,8.26,0,0,1,290,191.19Z"
						style="opacity: 0.2; transform-origin: 291.693px 195.13px"
						class="animable"></path>
              </g>
              <path
						d="M282.34,202.77s6.31,16.8,7.63,27.94c6.35-11.29,9-20.91,6.37-25.08C295,206.75,290.17,207.62,282.34,202.77Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 289.844px 216.74px;
                "
						id="elsbt4601s3wf" class="animable"></path>
              <path
						d="M283.32,200.6a5.7,5.7,0,0,0-3.58,1,19.6,19.6,0,0,0,8.95,9.45c-.07-1.08,1.51-3.84,2.75-4.65C287.89,205,283.32,200.6,283.32,200.6Z"
						style="
                  fill: rgb(255, 255, 255);
                  transform-origin: 285.59px 205.82px;
                "
						id="elsmc1d7jtet" class="animable"></path>
              <path
						d="M293.38,203.26a9.25,9.25,0,0,1,3.17,2.23s4,4.73-.89,6.07a11.55,11.55,0,0,0-4.22-5.16C295.23,206.68,293.38,203.26,293.38,203.26Z"
						style="
                  fill: rgb(255, 255, 255);
                  transform-origin: 294.765px 207.41px;
                "
						id="elj6nbnbnzwad" class="animable"></path>
              <path
						d="M299.2,174.46c3.14,3.48,5.54,8.1.51,8.81S299.2,174.46,299.2,174.46Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 299.973px 178.884px;
                "
						id="els04jidgoojc" class="animable"></path>
              <path
						d="M284.92,183.76c.87,6,1.08,9.61,4.4,12.44,5,4.27,12.26.8,13.21-5.39.86-5.57-.71-14.5-6.85-16.37A8.41,8.41,0,0,0,284.92,183.76Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 293.785px 186.083px;
                "
						id="elbcvuwismc46" class="animable"></path>
              <path
						d="M285.55,188.06c2.7-.66,5.46-7,3.87-8.76,6.67-.57,13.65-.59,12-5.25-1.21-3.33-7.31-5.12-10.14-4.68,2.23,1,2.72,1.71,2.72,1.71s-6.52-.75-10,2.08a8,8,0,0,1,3.5,0s-8.77.23-6.37,6.4C276.66,183.77,285.55,188.06,285.55,188.06Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 290.769px 178.682px;
                "
						id="elrwx5dutkzd" class="animable"></path>
              <path
						d="M299.57,190.79a40.41,40.41,0,0,0-7.68-1.39,4.88,4.88,0,0,0,4.63,3.74A2.54,2.54,0,0,0,299.57,190.79Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 295.73px 191.296px;
                "
						id="elqxcer16lcz" class="animable"></path>
              <path
						d="M295.25,191.6a5.5,5.5,0,0,1,3.12,1.22,2.9,2.9,0,0,1-1.85.32,5.43,5.43,0,0,1-3.12-1.22A2.85,2.85,0,0,1,295.25,191.6Z"
						style="
                  fill: rgb(237, 137, 62);
                  transform-origin: 295.885px 192.369px;
                "
						id="ele3a54qaocs" class="animable"></path>
              <path
						d="M299.32,190.71a1.14,1.14,0,0,1-.95.77,30.88,30.88,0,0,1-5-1,1.74,1.74,0,0,1-1.23-1A47.38,47.38,0,0,1,299.32,190.71Z"
						style="
                  fill: rgb(255, 255, 255);
                  transform-origin: 295.73px 190.48px;
                "
						id="eltt7bje0p63n" class="animable"></path>
              <g id="elq3v08e8s1d">
                <path
						d="M291.78,188.37s-1.56-.32-1.41,1C290.61,188.82,291.78,188.37,291.78,188.37Z"
						style="opacity: 0.2; transform-origin: 291.07px 188.853px"
						class="animable"></path>
              </g>
              <path
						d="M283.22,187.46a5.22,5.22,0,0,0,2.58,3.1c1.66.84,2.87-.54,2.73-2.3-.13-1.57-1.14-3.91-2.95-4A2.39,2.39,0,0,0,283.22,187.46Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 285.809px 187.535px;
                "
						id="el764mkznn8nx" class="animable"></path>
              <path
						d="M293.39,184.33c0,.49.34.87.66.84s.55-.45.51-.95-.33-.87-.66-.84S293.35,183.84,293.39,184.33Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 293.975px 184.275px;
                "
						id="elylp1d6tblth" class="animable"></path>
              <path
						d="M299.3,184.19c0,.5.33.87.66.84s.55-.45.51-.95-.34-.87-.66-.84S299.26,183.7,299.3,184.19Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 299.885px 184.135px;
                "
						id="eloxdk7nzn0h" class="animable"></path>
              <path
						d="M298.2,184.78a17.53,17.53,0,0,0,2.71,4,2.87,2.87,0,0,1-2.33.66Z"
						style="
                  fill: rgb(237, 137, 62);
                  transform-origin: 299.555px 187.128px;
                "
						id="eluf6d6b7euf" class="animable"></path>
              <path
						d="M292.58,182.68a.26.26,0,0,1-.15,0,.29.29,0,0,1-.16-.38,2.91,2.91,0,0,1,2-1.79.28.28,0,0,1,.34.22.3.3,0,0,1-.23.35h0a2.33,2.33,0,0,0-1.55,1.44A.28.28,0,0,1,292.58,182.68Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 293.432px 181.597px;
                "
						id="elaywxw07skh9" class="animable"></path>
              <path
						d="M302.82,181.91a.35.35,0,0,1-.24-.14,2.33,2.33,0,0,0-1.75-1.15.28.28,0,0,1-.28-.3.29.29,0,0,1,.3-.28,2.89,2.89,0,0,1,2.23,1.42.28.28,0,0,1-.1.4A.3.3,0,0,1,302.82,181.91Z"
						style="
                  fill: rgb(38, 50, 56);
                  transform-origin: 301.838px 180.975px;
                "
						id="el1r8nre7fytd" class="animable"></path>
              <path
						d="M275.25,212.86c-1.77,1-3.63,2-5.45,3l-5.5,2.93-5.48,2.93c-1.8,1-3.61,2-5.37,3l.84-.67c-1.52,1.35-3.06,2.73-4.59,4.16l-4.59,4.36-4.62,4.42c-1.55,1.47-3.11,3-4.68,4.4l0,0a3.06,3.06,0,0,1-4.74-3.74c1.08-2,2.24-3.81,3.43-5.67s2.44-3.66,3.72-5.46,2.62-3.55,4-5.28,2.85-3.45,4.42-5.12a2.05,2.05,0,0,1,.38-.34l.46-.34c3.57-2.58,7.19-4.92,10.87-7.14,1.83-1.11,3.7-2.17,5.57-3.22s3.74-2,5.7-3a6.1,6.1,0,0,1,5.69,10.78Z"
						style="
                  fill: rgb(186, 104, 200);
                  transform-origin: 254.516px 221.838px;
                "
						id="elk0al8f8d4he" class="animable"></path>
              <path
						d="M227.38,248.82l-1.93-2.25a2.41,2.41,0,0,1,0-3.12l2.24-2.67,6.41,5.34-3.26,2.93A2.41,2.41,0,0,1,227.38,248.82Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 229.489px 245.227px;
                "
						id="elg152lzrcuh" class="animable"></path>
              <path
						d="M236.49,240.58l-2.41,5.54-6.41-5.34a12.85,12.85,0,0,1,3.44-3.76,3,3,0,0,1,3.89.6l1.25,1.43A1.45,1.45,0,0,1,236.49,240.58Z"
						style="
                  fill: rgb(255, 181, 115);
                  transform-origin: 232.139px 241.339px;
                "
						id="el6tc8kvjw1oe" class="animable"></path>
            </g>
            <defs>
              <filter id="active" height="200%">
                <feMorphology in="SourceAlpha" result="DILATED"
						operator="dilate" radius="2"></feMorphology>
                <feFlood flood-color="#32DFEC" flood-opacity="1"
						result="PINK"></feFlood>
                <feComposite in="PINK" in2="DILATED" operator="in"
						result="OUTLINE"></feComposite>
                <feMerge>
                  <feMergeNode in="OUTLINE"></feMergeNode>
                  <feMergeNode in="SourceGraphic"></feMergeNode>
                </feMerge>
              </filter>
              <filter id="hover" height="200%">
                <feMorphology in="SourceAlpha" result="DILATED"
						operator="dilate" radius="2"></feMorphology>
                <feFlood flood-color="#ff0000" flood-opacity="0.5"
						result="PINK"></feFlood>
                <feComposite in="PINK" in2="DILATED" operator="in"
						result="OUTLINE"></feComposite>
                <feMerge>
                  <feMergeNode in="OUTLINE"></feMergeNode>
                  <feMergeNode in="SourceGraphic"></feMergeNode>
                </feMerge>
                <feColorMatrix type="matrix"
						values="0   0   0   0   0                0   1   0   0   0                0   0   0   0   0                0   0   0   1   0 "></feColorMatrix>
              </filter>
            </defs>
          </svg>
			</div>
		</div>
	</div>

	<!-- second article -->
	<div class="container-fluid bg-linear2">
		<div
			class="row d-flex flex-row justify-content-center align-items-center">
			<div class="col-2">
				<img src="./images/indexPic/hangout4.svg" alt="" />
			</div>
			<div
				class="
            col-1
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross">x</span>
			</div>
			<div class="col-2">
				<img src="./images/indexPic/hangout2.svg" alt="" />
			</div>
			<div
				class="
            col-1
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross">x</span>
			</div>
			<div class="col-2">
				<img src="./images/indexPic/hangout1.svg" alt="" />
			</div>
		</div>
		<div
			class="
          row
          py-3
          d-flex
          flex-row
          justify-content-center
          align-items-center
        ">
			<div
				class="
            col-2
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross-w">Have Fun</span>
			</div>
			<div class="col-1"></div>
			<div
				class="
            col-2
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross-w">Gathering</span>
			</div>
			<div class="col-1"></div>
			<div
				class="
            col-2
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross-w">Loving</span>
			</div>
		</div>
	</div>

	<!-- go -->
	<div class="container mt-5">
		<div class="row justify-content-center align-items-center">
			<div
				class="
            col-4
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross">>>>></span>
			</div>
			<div
				class="
            col-4
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross shake">立即前往</span>
			</div>
			<div
				class="
            col-4
            d-flex
            flex-row
            justify-content-center
            align-items-center
          ">
				<span class="cross"><<<<</span>
			</div>
		</div>
	</div>

	<!-- picture card -->
	<div class="container mt-5">
		<div class="row py-5">
			<div class="col-12 col-md-3 justify-content-center">
				<div class="card border-0 bg-transparent" style="width: 18rem">
					<img src="./images/indexPic/c3.jpg" class="card-img-top" alt="..." />
					<div class="card-body">
						<h5 class="card-title">夕陽沙灘漫步</h5>
						<p class="card-text">
							想與另一半來場浪漫的約會嗎? <br>交給我們來處理吧!
						</p>
	
						<a href="#" class="btn btn-primary">Go Date</a>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-3 justify-content-center">
				<div class="card border-0 bg-transparent" style="width: 18rem">
					<img src="./images/indexPic/c1.jpg" class="card-img-top" alt="..." />
					<div class="card-body">
						<h5 class="card-title">拿酷碰</h5>
						<p class="card-text">
							想與另一半入住星級大飯店?<br>加入會員折扣立即拿
						</p>
						<a href="#" class="btn btn-primary">Coupon </a>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-3 justify-content-center">
				<div class="card border-0 bg-transparent" style="width: 18rem">
					<img src="./images/indexPic/c3.jpg" class="card-img-top" alt="..." />
					<div class="card-body">
						<h5 class="card-title">熱鬧派對</h5>
						<p class="card-text">
							有心儀的對象但不敢單獨約出門嗎?<br>交給我們吧!
						</p>
						<a href="#" class="btn btn-primary">Party Fun</a>
					</div>
				</div>
			</div>

			<div class="col-3 justify-content-center">
				<div class="card border-0 bg-transparent" style="width: 18rem">
					<img src="./images/indexPic/c2.jpg" class="card-img-top" alt="..." />
					<div class="card-body">
						<h5 class="card-title">好事成雙</h5>
						<p class="card-text">
							想舉辦森林系的浪漫婚禮嗎?<br>交給我們吧!
						</p>
						<a href="#" class="btn btn-primary">Let's Wedding</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- lucky product -->
	<div class="container mt-5">
		<div class="row d-flex justify-content-center">
			<div class="col-4">
				<h1>獨家招桃花小物</h1>
				<br />
				<p>
					本網站招桃花小物一律從泰國空運回台 <br /> 經過泰國高僧的加持 <br /> 幫你展開一段全新的戀愛旅程
				</p>
				<br /> <br />
				<button class="btnn purple">前往選購</button>
			</div>

			<div class="col-6 d-flex flex-row-reverse">
				<img src="./images/indexPic/heart.svg" alt="" />
			</div>
		</div>
	</div>

	<!-- coupon part -->
	<div class="container mt-5 bg-linear2">
		<div class="row d-flex justify-content-center">
			<div class="col-6 d-flex flex-row">
				<img src="./images/indexPic/coupon.png" alt="" />
			</div>
			<div class="col-4 my-5">
				<h1>異業合作酷碰獨享</h1>
				<br />
				<p>
					嚴選合作廠商 <br /> 餐廳、星級飯店、套裝行程、優惠套票 <br /> OnlyFriends 會員獨享
				</p>
				<br /> <br />
				<button class="btnn purple">前往領取</button>
			</div>
		</div>
	</div>

	<!-- eating part -->
	<div class="container mt-5">
		<div class="row d-flex justify-content-center">
			<div class="col-4">
				<h1>找飯友?加入我!</h1>
				<br />
				<p>
					一個人吃飯、旅行 <br /> 覺得生活無趣嗎<br /> 透過我們幫你號召屬於自己的飯友!
				</p>
				<br /> <br />
				<button class="btnn purple">立即加入</button>
			</div>

			<div class="col-6 d-flex flex-row-reverse">
				<img src="./images/indexPic/party.svg" alt="" />
			</div>
		</div>
	</div>

	<!-- coupon part -->
	<div class="container mt-5 bg-linear2">
		<div class="row d-flex justify-content-center">
			<div class="col-6 d-flex flex-row">
				<img src="./images/indexPic/activities.svg" alt="" />
			</div>
			<div class="col-4 my-5">
				<h1>找尋志同道合的朋友</h1>
				<br />
				<p>
					志同道合 <br /> 出社會難找到志同道合的朋友嗎 <br /> OnlyFriends將幫助你拓展交友圈
				</p>
				<br /> <br />
				<button class="btnn purple">立即配對</button>
			</div>
		</div>
	</div>


	<!-- made empty -->
	<div class="container mt-5">
		<div class="row d-flex justify-content-center">
			<div class="col-4"></div>

			<div class="col-6 d-flex flex-row-reverse">
				<br> <br> <br> <br> <br> <br>
			</div>
		</div>
	</div>

	<!-- bubble background -->
	<div class="container">
		<div class="mb-3">
			<ul class="bubbles">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<%@include file="./commonpages/footer.jsp"%>

	<!-- bootstrap js cdn-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>
	<!-- sweetalert js cdn-->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- font awesome  -->
	<script src="https://kit.fontawesome.com/1a950be563.js"
		crossorigin="anonymous"></script>
	<script>
	<!-- check login session -->
		
	
		
	</script>
</body>
</html>
