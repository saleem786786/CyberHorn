<!-- Slider Section -->
<div class="main-container slider" id="storeslider">
    <div class="silder-container">
        <div class="carousel header-main-slider">
            <!-- 1 Slider -->
            <div class="carousel-cell overlay">
                <div class="special-note"><span class="badge">{$LANG.domainCheckerSalesGroup.hot}</span><span class="text">25% discount in all Hosting Plans</span></div>
                <div class="slider-content w-55">
                    <h5 data-aos="fade-up" data-aos-duration="800">{$LANG.sslservertype}</h5>
                    <p data-aos="fade-up" data-aos-duration="1200">{$LANG.cartnameserversdesc}</p>
                    <a class="btn btn-medium btn-prussian" href="cart.php?gid=3">{$LANG.store.ssl.landingPage.buyNow} <i class="ico-chevron-right w-icon"></i></a>
                </div>
                <div class="silder-video">
                    <div class="cover-wrapper">
                        <video class="cover-video" autoplay loop muted>
                            <source src="{$WEB_ROOT}/templates/{$template}/assets/videos/cpu.mp4" type="video/mp4">
                        </video>
                    </div>
                </div>
            </div>
            <!-- 2 Slider -->
            <div class="carousel-cell overlay">
                <div class="special-note"><span class="badge">{$LANG.top}</span><span class="text">Search a domain of your choise from <b>$6.00/yr</b></span></div>
                <div class="slider-content w-55">
                    <h5 data-aos="fade-up" data-aos-duration="800">{$LANG.findyourdomain}</h5>
                    <p data-aos="fade-up" data-aos-duration="1200">{$LANG.cartdomainsconfigdesc}</p>
                    <form class="domains-search w-75" method="post" action="domainchecker.php">
                        <input type="text" class="inputdomainsearch" name="domain" placeholder="{$LANG.exampledomain}" autocapitalize="none" />
                        <span class="ds-content">
                            <button data-toggle="tooltip" data-placement="bottom" title="{$LANG.domainsregister}" type="submit" class="btn-search" value="{$LANG.domainsregister}"><i class="ico-globel f-16"></i></button>
                            <button data-toggle="tooltip" data-placement="bottom" title="{$LANG.domainstransfer}" type="submit" name="transfer" class="btn-transfer" value="{$LANG.domainstransfer}"><i class="ico-repeat f-16"></i></button>
                        </span>
                    </form>
                </div>
                <div class="carousel full-slider">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/sliders/globe.jpg" alt="Web Hosting"/>
                </div>
            </div>
            <!-- 3 Slider -->
            <div class="carousel-cell overlay">
                <div class="slider-content w-55">
                    <h5 data-aos="fade-up" data-aos-duration="800">{$LANG.orderForm.chooseFromRange}</h5>
                    <p data-aos="fade-up" data-aos-duration="1200">{$LANG.cloudSlider.feature01DescriptionTwo}</p>
                    <a class="btn btn-medium btn-prussian" href="cart.php">{$LANG.orderForm.addHosting} <i class="ico-chevron-right w-icon"></i></a>
                </div>
                <div class="carousel full-slider">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/sliders/hosting.jpg" alt="Web Hosting"/>
                </div>
            </div>
            <!-- 4 Slider -->
            <div class="carousel-cell overlay">
                <div class="slider-content w-55">
                    <h5>{$LANG.supportticketsintro}</h5>
                    <p>{$LANG.cloudSlider.feature02DescriptionTwo}</p>
                    <a class="btn btn-medium btn-prussian" href="submitticket.php">{$LANG.supportticketspagetitle} <i class="ico-chevron-right w-icon"></i></a>
                </div>
                <div class="carousel full-slider">
                    <img src="{$WEB_ROOT}/templates/{$template}/assets/img/sliders/support.jpg" alt="Helpdesk"/>
                </div>
            </div>
        </div>
    </div>
</div>