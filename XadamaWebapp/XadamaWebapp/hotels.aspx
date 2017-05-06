<%@ Page Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="hotels.aspx.cs" Inherits="XadamaWebapp.hotels" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama Hotels</title>
    <link rel="stylesheet" type="text/css" href="Style/hotels.css" />
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $("#europe1").click(function () {
                $('.background:nth-child(2)').css({ 'background-image': 'url("/Media/Hotels/europeanpalace5-opacity.png")' });
            });
            $("#europe2").click(function () {
                $('.background:nth-child(2)').css({ 'background-image': 'url("/Media/Hotels/europeanpalace3-opacity.png")' });
            });
            $("#europe3").click(function () {
                $('.background:nth-child(2)').css({ 'background-image': 'url("/Media/Hotels/europeanpalace6-opacity.png")' });
            });
            $("#europe4").click(function () {
                $('.background:nth-child(2)').css({ 'background-image': 'url("/Media/Hotels/europeanpalace7-opacity.png")' });
            });
        });
    </script>
    <script>
        var ticking = false;
        var isFirefox = (/Firefox/i.test(navigator.userAgent));
        var isIe = (/MSIE/i.test(navigator.userAgent)) || (/Trident.*rv\:11\./i.test(navigator.userAgent));
        var scrollSensitivitySetting = 30;
        var slideDurationSetting = 600;
        var currentSlideNumber = 0;
        var totalSlideNumber = 7;

        function parallaxScroll(evt) {

            if (isFirefox) {
                delta = evt.detail * (-120);
            } else if (isIe) {
                delta = -evt.deltaY;
            } else {
                delta = evt.wheelDelta;
            }

            if (ticking != true) {
                if (delta <= -scrollSensitivitySetting) {
                    
                    ticking = true;
                    if (currentSlideNumber !== totalSlideNumber - 1) {
                        currentSlideNumber++;
                        nextItem();
                    }
                    slideDurationTimeout(slideDurationSetting);
                }
                if (delta >= scrollSensitivitySetting) {
                    
                    ticking = true;
                    if (currentSlideNumber !== 0) {
                        currentSlideNumber--;
                    }
                    previousItem();
                    slideDurationTimeout(slideDurationSetting);
                }
            }

            if (currentSlideNumber > 0) {
                $('.bar').css({ transition: 'height 1s', height: 'auto' });
                $('.logo-small').css({ transition: 'height 1s', height: '25px' });
                $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '6px 12px' });
                $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '14px' });
                $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '12px', padding: '6px 12px' });
                $('.to-top').css({ display: 'inherit' });
            }
            else {
                $('.bar').css({ transition: 'height 1s', height: 'auto' });
                $('.logo-small').css({ transition: 'height 1s', height: '40px' });
                $('#nav-menu .menu').css({ transition: 'margin 1s', margin: '12px 24px' });
                $('.bar-item').css({ transition: 'font-size 1s', 'font-size': '18px' });
                $('.button-sign').css({ transition: 'font-size 1s, padding 1s', 'font-size': '18px', padding: '12px 24px' });
                $('.to-top').css({ display: 'none' });
            }
        }

        function slideDurationTimeout(slideDuration) {
            setTimeout(function () {
                ticking = false;
            }, slideDuration);
        }

        var mousewheelEvent = isFirefox ? "DOMMouseScroll" : "wheel";
        window.addEventListener(mousewheelEvent, _.throttle(parallaxScroll, 60), false);

        function nextItem() {
            var $previousSlide = $(".background").eq(currentSlideNumber - 1);
            $previousSlide.removeClass("up-scroll").addClass("down-scroll");
        }

        function previousItem() {
            var $currentSlide = $(".background").eq(currentSlideNumber);
            $currentSlide.removeClass("down-scroll").addClass("up-scroll");
        }
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="contain">
        <section class="background">
            <div class="content-wrapper content-tittle content container">
                <div class="display-middle">
                    <asp:label runat="server" CssClass="center padding-medium darkblue xxlarge wide" text="HOTELS"></asp:label>
                </div>
                <div class="display-middle-sub">
                <asp:Label runat="server" CssClass="center padding-medium darkblue large wide" Text="We have five hotels available, 
                    one for each continent" ></asp:Label>
                </div>
            </div>
        </section>

        <section class="background">
            <div class="content-wrapper content container">
                <div class="left">
                    <div class="hotel-name">
                        <asp:label runat="server" CssClass="padding-medium europe xxlarge wide" text="EUROPEAN PALACE"></asp:label>
                    </div>
                    <div class="hotel-stars">
                        <asp:label runat="server" CssClass="padding-medium europe xxlarge wide" text="★★★★"></asp:label>
                    </div>
                </div>

                <p class="left large europe bold padding-medium">Set in the european zone, the European Palace is a hotel with free WiFi set across the road 
                    from the London Eye. Its elegant rooms feature air conditioning and satellite TV. The hotel's International Cafè restaurant serves 
                    typical local products combined with intense fragrances and aromas. Breakfast is an American buffet. The bar is open till late 
                    at night and offers tasty snacks and excellent cocktails prepared by the skilled barman.</p>
    
                <div class="col three-quarter">
                    <asp:Image ID="europe1" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/europeanpalace5.jpg" />
                    <asp:Image ID="europe2" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/europeanpalace3.jpg" />
                    <asp:Image ID="europe3" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/europeanpalace6.jpg" />
                    <asp:Image ID="europe4" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/europeanpalace7.jpg" />
                </div>

                <div class="col quarter margin-top-button">
                    <asp:Button runat="server" text="See more!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
            </div>
        </section>

        <section class="background">
            <div class="content-wrapper content container">
                <div class="left">
                    <div class="hotel-name">
                        <asp:label runat="server" CssClass="padding-medium asia xxlarge wide" text="ASIAN GARDENS"></asp:label>
                    </div>
                    <div class="hotel-stars">
                        <asp:label runat="server" CssClass="padding-medium asia xxlarge wide" text="★★★★★"></asp:label>
                    </div>
                </div>

                <p class="left large asia bold padding-medium">This impressive Thai-style hotel is set in the asian zone, with magnificent 
                    views over the african one. Surrounded by pine woods, it offers 7 outdoor pools and a spa. Thai massages are available in the 
                    traditional stilt houses which are set in charming gardens with various Asian-style fountains and infinity pools. The spa is equipped 
                    with a heated indoor pool and hot tub, and there is also a fitness centre. Children will enjoy the pirates kids' club. The hotel's 4 
                    restaurants include the Udaipur buffet restaurant and an à la carte Asian restaurant. There is also a Mediterranean and international 
                    restaurant, as well as 3 distinctive bars.</p>
    
                <div class="col three-quarter">
                    <asp:Image ID="Image1" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/asiangardens.jpg" />
                    <asp:Image ID="Image2" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/asiangardens5.jpg" />
                    <asp:Image ID="Image10" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/asiangardens6.jpg" />
                    <asp:Image ID="Image11" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/asiangardens7.jpg" />
                </div>

                <div class="col quarter margin-top-button">
                    <asp:Button runat="server" text="See more!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
            </div>
        </section>

        <section class="background">
            <div class="content-wrapper content container">
                <div class="left">
                    <div class="hotel-name">
                        <asp:label runat="server" CssClass="padding-medium africa xxlarge wide" text="AFRICAN SAVANNAH"></asp:label>
                    </div>
                    <div class="hotel-stars">
                        <asp:label runat="server" CssClass="padding-medium africa xxlarge wide" text="★★★★"></asp:label>
                    </div>
                </div>

                <p class="left large africa bold padding-medium">We warmly welcome you to African Savannah Hotel on the beautiful east coast of the 
                    african zone. Here you can relax in the peaceful surroundings, while you are being swept away by the adventurous Zanzibar 
                    with its countless senses of impressions. We wish to inspire our guests with an authentic atmosphere and give them the opportunity 
                    to experience the many facets of Zanzibar and Tanzania. Our friendly and obliging staff will make sure that you get exactly what 
                    you wish for, out of your stay.</p>
    
                <div class="col three-quarter">
                        <asp:Image ID="Image14" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/africansavannah.jpg" />
                        <asp:Image ID="Image15" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/africansavannah2.jpg" />
                        <asp:Image ID="Image16" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/africansavannah3.jpg" />
                        <asp:Image ID="Image17" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/africansavannah5.jpg" />
                </div>

                <div class="col quarter margin-top-button">
                    <asp:Button runat="server" text="See more!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
            </div>
        </section>

        <section class="background">
            <div class="content-wrapper content container">
                <div class="left">
                    <div class="hotel-name">
                        <asp:label runat="server" CssClass="padding-medium america xxlarge wide" text="AMERICAN LUXURY"></asp:label>
                    </div>
                    <div class="hotel-stars">
                        <asp:label runat="server" CssClass="padding-medium america xxlarge wide" text="★★★★★"></asp:label>
                    </div>
                </div>

                <p class="left large america bold padding-medium">Set behind the famous Fountains of Bellagio, this luxury hotel offers an upscale 
                    day spa, multiple dining options and elegant rooms with marble en suite bathrooms. American Luxury guests can experience a variety 
                    of treatments at the spa or enjoy a massage beside one of 5 beautiful courtyard pools. Lush botanical gardens and a fine art 
                    gallery are open for viewing.</p>
    
                <div class="col three-quarter">
                        <asp:Image ID="Image3" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/americanluxury.jpg" />
                        <asp:Image ID="Image4" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/americanluxury2.jpg" />
                        <asp:Image ID="Image5" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/americanluxury3.jpg" />
                        <asp:Image ID="Image6" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/americanluxury5.tif" />
                </div>

                <div class="col quarter margin-top-button">
                    <asp:Button runat="server" text="See more!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
            </div>
        </section>

        <section class="background">
            <div class="content-wrapper content container">
                <div class="left">
                    <div class="hotel-name">
                        <asp:label runat="server" CssClass="padding-medium oceania xxlarge wide" text="OCEANIC PARADISE"></asp:label>
                    </div>
                    <div class="hotel-stars">
                        <asp:label runat="server" CssClass="padding-medium oceania xxlarge wide" text="★★★★"></asp:label>
                    </div>
                </div>

                <p class="left large oceania bold padding-medium">Featuring free WiFi and a spa, Hotel Oceanic Paradise offers accommodation in the 
                    oceanic zone. The hotel has water-ski-to-door access and water sports facilities, and guests can enjoy a drink at the bar. Each room at 
                    this hotel is air conditioned and comes with a flat-screen TV. A balcony or patio are featured in certain rooms. The rooms are equipped 
                    with a private bathroom equipped with either a bath or shower.</p>
    
                <div class="col three-quarter">
                        <asp:Image ID="Image13" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/oceanicparadise.jpg" />
                        <asp:Image ID="Image19" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/oceanicparadise3.jpg" />
                        <asp:Image ID="Image20" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/oceanicparadise4.jpg" />
                        <asp:Image ID="Image21" runat="server" CssClass="hotel-image-small" ImageUrl="~/Media/Hotels/oceanicparadise5.jpg" />
                </div>

                <div class="col quarter margin-top-button">
                    <asp:Button runat="server" text="See more!" CssClass="center button padding-medium xxlarge wide button-slice" />
                </div>
            </div>
        </section>
    </div>
</asp:Content>