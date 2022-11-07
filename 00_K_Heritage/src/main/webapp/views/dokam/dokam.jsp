<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

    <!-- 제목 타이틀 -->
    <div class="container-ks py-sm-0 overlay-content">
        <div class="row">
            <div class="col-xl-8">
                <h1 class="font1 display-3 text-black fw-bold">문화재 도감</h1>
                <p class="font1 text-lg text-orange mb-6"> 모은 문화재 도감을 확인해 보세요!</p>
            </div>
        </div>
    </div>
    <hr class="hr-ks">
    <br><br><br>

    <!-- 검색기능 -->
    <div class="container position-relative mt-n8 z-index-20">
        <div class="search-bar search-bar-with-tabs p-3 p-lg-3">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="search" role="tabpanel">
                    <form action="#">
                        <div class="row">
                            <div class="col-lg-5 d-flex align-items-center form-group no-divider">
                                <select class="selectpicker form-control font1" title="지역" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                          <option value="city_0">수도권</option>
                          <option value="city_1">경상권</option>
                          <option value="city_2">충청권</option>
                          <option value="city_3">강원권</option>
                          <option value="city_4">전라권</option>
                          <option value="city_5">제주권</option>
                        </select>
                            </div>
                            <div class="col-lg-5 d-flex align-items-center form-group no-divider">
                                <select class="selectpicker form-control font1" title="지정종목" data-style="btn-form-control" multiple data-selected-text-format="count &gt; 2">
                          <option value="type_0">국보</option>
                          <option value="type_1">천연기념물</option>
                        </select>
                            </div>
                            <div class="col-lg-2 d-grid form-group mb-1">
                                <button class="btn btn-primary h-100" type="submit">검색 </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 완성된 도감 -->
    <section class="py-4">
        <div class="container-ks2">
            <div class="row mb-lg-6">
                <div class="col-md-8">
                    <h2 class="mb-md-0 font1 h1">완성된 도감</h2>
                </div>
            </div>
        </div>
        </div>
        <div class="container-fluid">
            <!-- Slider main container-->
            <div class="swiper-container swiper-container-mx-negative items-slider-full px-lg-5 pt-3 font1">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- 완성된 문화재-->
                    <!-- 중복으로 나오는 속성은 추후 문화재 개수에 따라 변경 필요 -->
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/석굴암.jpg" alt="경주 석굴암 석굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">경주 석굴암 석굴</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>경상권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>통일신라시대</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/신예리의왕벚나무꽃.jpg" alt="제주 신례리 왕벚나무 자생지" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title">
                                            <a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">제주 신례리 왕벚나무 자생지</a>
                                        </h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>제주권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center float-start"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>천연기념물 </span>
                                    </div>
                                    <!-- <span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span> -->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/국보_청자_음각연화당초문_매병.jpg" alt="청자 음각연화당초문 매병" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">청자 음각연화당초문 매병</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>수도권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>고려시대(12세기)</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/훈민정음.jpg" alt="훈민정음" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">훈민정음</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>수도권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>조선 세종 28년(1446)</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/산호동굴.JPG" alt="정선 산호동굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">정선 산호동굴</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>강원권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center float-start"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i> 천연기념물 </span>
                                    </div>
                                    <!-- <span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span> -->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 여기부터 위 사진들 반복 -->
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/석굴암.jpg" alt="경주 석굴암 석굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">경주 석굴암 석굴</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>경상권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>통일신라시대</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/신예리의왕벚나무꽃.jpg" alt="제주 신례리 왕벚나무 자생지" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title">
                                            <a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">제주 신례리 왕벚나무 자생지</a>
                                        </h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>제주권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center float-start"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>천연기념물 </span>
                                    </div>
                                    <!-- <span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span> -->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/국보_청자_음각연화당초문_매병.jpg" alt="청자 음각연화당초문 매병" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">청자 음각연화당초문 매병</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>수도권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>고려시대(12세기)</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e3503eb77d487e8082">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/훈민정음.jpg" alt="훈민정음" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">훈민정음</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>수도권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i>국보</span>
                                            <span class="me-1"><i class="fa fa-clock text-primary opacity-7 me-2"></i>조선 세종 28년(1446)</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100 hover-animate" data-marker-id="59c0c8e322f3375db4d89128">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden gradient-overlay"> <img class="img-full-main" src="<%=request.getContextPath()%>/resources/img/culture/산호동굴.JPG" alt="정선 산호동굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        <a class="card-fav-icon position-relative z-index-40" href="javascript: void();">
                                            <svg class="svg-icon text-white">
                            <use xlink:href="#heart-1"> </use>
                          </svg></a>
                                    </div>
                                </div>
                                <div class="card-body d-flex align-items-center bottom-0">
                                    <div class="w-100 h-0">
                                        <h6 class="card-title"><a class="text-decoration-none text-dark font1 h4 bold-ks" href="detail-rooms.html">정선 산호동굴</a></h6>
                                        <p class="text-sm text-orange card-subtitle mb-2"><i class="fa fa-map-marker text-orange opacity-4 me-1"></i>강원권</p><br>
                                        <p class="card-text d-flex justify-content-around text-gray-800 text-md-center float-start"><span class="me-1"><i class="fa fa-info text-primary opacity-7 me-2"></i> 천연기념물 </span>
                                    </div>
                                    <!-- <span class="me-1"><i class="fa fa-bath text-primary opacity-4 text-xs me-1"></i>2</span> -->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- If we need pagination-->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>
    <!-- 미완성 도감 -->
    <section class="py-0">
        <div class="container-ks2">
            <div class="row mb-lg-6">
                <div class="col-md-8">
                    <h2 class="mb-md-0 font1 h1">미완성 도감</h2>
                </div>
            </div>
        </div>
        </div>
        <div class="container-fluid">
            <!-- Slider main container-->
            <div class="swiper-container swiper-container-mx-negative swiper-loop items-slider-full px-lg-5 pt-3 font1">
                <!-- Additional required wrapper-->
                <div class="swiper-wrapper pb-5">
                    <!-- 물음표 -->
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden"> <img class="img-full" src="<%=request.getContextPath()%>/resources/img/culture/물음표.png" alt="경주 석굴암 석굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden"> <img class="img-full" src="<%=request.getContextPath()%>/resources/img/culture/물음표.png" alt="경주 석굴암 석굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide h-auto px-2">
                        <div class="w-100 h-100" data-marker-id="59c0c8e33b1527bfe2abaf92">
                            <div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden"> <img class="img-full" src="<%=request.getContextPath()%>/resources/img/culture/물음표.png" alt="경주 석굴암 석굴" />
                                    <a class="tile-link" href="detail-rooms.html"></a>
                                    <div class="card-img-overlay-top text-end">
                                        </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- If we need pagination-->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </section>
    <br><br><br>
    <!-- 도움말 버튼
    <div>
        <a href="#" class="ButtonPOP right-ks">도움말</a>
    </div>
    <br><br><br><br><br><br> -->
<%@ include file="/views/common/footer.jsp"%>