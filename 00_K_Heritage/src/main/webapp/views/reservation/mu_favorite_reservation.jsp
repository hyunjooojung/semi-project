<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>

<!-- 이거 추가함 -->
<head>
   <link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet" type="text/css">
</head> 
<!--  -->

    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 me-lg-auto">
                    <div class="card border-0 shadow mb-6 mb-lg-0">
                        <div class="card-header bg-gray-100 py-4 border-0 text-center">
                            <a class="d-inline-block" href="#"><img class="d-block avatar avatar-xxl p-2 mb-2" src="<%=path%>/resources/img/user.jpg" alt="안됌"></a>
                            <h5>김보성</h5>
                            <p class="text-muted text-sm mb-0">대한민국, 서울 </p>
                        </div>

                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="icon-rounded icon-rounded-sm bg-primary-light flex-shrink-0 me-2">
                                    <svg class="svg-icon text-primary svg-icon-md">
                      					<use xlink:href="#checkmark-1"></use>
                    				</svg>
                                </div>

                                <div>
                                    <p class="mb-0">1,756 reviews</p>
                                </div>
                            </div>
                            <hr>
                            <h6>김보성님의 정보</h6>
                            <ul class="card-text text-muted">
                                <li>rlaqhtjd1127</li>
                                <li>rlaqhtjd789@naver.com</li>
                                <li>010-5402-6740</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9 ps-lg-5">
                    <h1 class="hero-heading mb-0">박물관 즐겨찾기 & 예약내역</h1>
                    <div class="text-block">
                        <p> <span class="badge badge-secondary-light">2022년 08월</span></p>
                        <p class="text-muted">박물관 즐겨찾기와 예약내역을 조회할 수 있습니다.</p>
                    </div>
                    <div class="text-block">
                        <h4 class="mb-5">박물관 즐겨찾기</h4>
                        <div class="row">
                       
                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                                <div class="card h-100 border-0 shadow">
                                
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-10.jpg" alt="Modern, Well-Appointed Room">
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white"><use xlink:href="#heart-1"> </use></svg>
                                            </a>
                                        </div>
                                    </div>



                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">국립중앙박물관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">서울시 용산구</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ 23,000</span>
                                            </p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-1.PNG" alt="Cute Quirky Garden apt, NYC adjacent" />
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                        </div>
                                    </div>

                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">대한민국 역사박물관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">서울시 종로구</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ Free</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e3a31e62979bf147c9">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-2.PNG" alt="Modern Apt - Vibrant Neighborhood!" />
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                        </div>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">옛길 박물관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">경상북도 문경시</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ 10,000</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-3.PNG" alt="Sunny Private Studio-Apartment" />
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                        </div>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">국립익산박물관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">전라북도 익산시</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ 10,000</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e39aa2eed0626e485d">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-4.PNG" alt="Mid-Century Modern Garden Paradise" />
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                        </div>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">국립춘천박물관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">강원도 춘천시</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ 12,000</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- place item-->
                            <div class="col-sm-6 col-lg-4 mb-30px hover-animate" data-marker-id="59c0c8e39aa2edasd626e485d">
                                <div class="card h-100 border-0 shadow">
                                    <div class="card-img-top overflow-hidden gradient-overlay"> <img class="museumsize-bs" src="<%=path%>/resources/img/museum-5.PNG" alt="Brooklyn Life, Easy to Manhattan" />
                                        <a class="tile-link" href="mu_det.html"></a>

                                        <div class="card-img-overlay-top text-end">
                                            <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                                <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                        </div>
                                    </div>
                                    <div class="card-body d-flex align-items-center">
                                        <div class="w-100">
                                            <h6 class="card-title"><a class="text-decoration-none text-dark" href="mu_det.html">서대문형무소 역사관</a></h6>
                                            <div class="d-flex card-subtitle mb-3">
                                                <p class="flex-grow-1 mb-0 text-muted text-sm">서울시 서대문구</p>
                                                <p class="flex-shrink-1 mb-0 card-stars text-xs text-end"><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-warning"></i><i class="fa fa-star text-gray-300">                                  </i>
                                                </p>
                                            </div>
                                            <p class="h4 card-text text-color-black">₩ 3,000</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-block">
                        <h4 class="mb-4">예약내역 </h4>
                        <div class="d-flex d-block d-sm-flex review">
                            <div>
                                <h5 class="mt-2 mb-1">국립중앙박물관</h5>
                                <p class="text-muted text-sm">날짜 : 2022.08.22<br>시간 : PM 3:00 - PM 6:00 </p>
                                <button class="btn btn-outline-primary-mi" type="button" onclick="location.href='<%=path%>/views/reservation/res_det.jsp'">상세내역&nbsp;></button>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
<%@ include file="/views/common/footer.jsp"%>