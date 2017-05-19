<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="XadamaWebapp.WebForm1" %>

<%@ Register Src="~/carousel.ascx" TagPrefix="uc1" TagName="carousel" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Xadama</title>
    <script type="text/javascript">
        $( function() {
            $( ".draggable" ).draggable();
        } );
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            window.onscroll = function () {
                if (window.pageYOffset >= 100) {
                    $('#ContentPlaceHolder1_buyButton').removeClass('buy-button');
                    $('#ContentPlaceHolder1_buyButton').addClass('buy-button-small');
                }
                else {
                    $('#ContentPlaceHolder1_buyButton').removeClass('buy-button-small');
                    $('#ContentPlaceHolder1_buyButton').addClass('buy-button');
                }

                if (window.pageYOffset >= 1850) {
                    $('.image-appear1').css({ transition: 'transform 2s', transform: 'translateX(0px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(0px)' });
                    $('.image-appear3').css({ transition: 'transform 1.6s', transform: 'translateX(0px)' });
                    $('.image-appear4').css({ transition: 'transform 1.4s', transform: 'translateX(0px)' });
                }
                else {
                    $('.image-appear3').css({ transition: 'transform 2s', transform: 'translateX(2000px)' });
                    $('.image-appear2').css({ transition: 'transform 1.8s', transform: 'translateX(2000px)' });
                    $('.image-appear4').css({ transition: 'transform 1.6s', transform: 'translateX(2000px)' });
                    $('.image-appear1').css({ transition: 'transform 1.4s', transform: 'translateX(2000px)' });
                }
            }
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            window.onscroll = function() {
                if (window.pageYOffset >= 100){
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
        });
    </script>
    <script type="text/javascript">
        $(window).load(function () {
            var pos = 0;
            $("#slide-prev").click(function () {
                if (pos > -30) {
                    pos -= 33.33333;
                    $(".swiper").css({ 'transform': 'translateX(' + pos + '%)' });
                }
            });
            $("#slide-next").click(function () {
                if (pos < 30) {
                    pos += 33.33333;
                    $(".swiper").css({ 'transform': 'translateX(' + pos + '%)' });
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Button id="buyButton" runat="server" Text="BUY Tickets" CssClass="buy-button front orange center padding-left-large" PostBackUrl="~/tickets.aspx"/>

    <!--Video-->
    <div class="video-container display-container">
        <div class="display-middle front">
            <asp:Label ID="Label1" runat="server" CssClass="center padding-large black xxlarge wide appear" Text="XADAMA"></asp:Label>
        </div>
        <div class="display-middle-sub front">
            <asp:Label ID="Label2" runat="server" CssClass="center padding-large black large wide appear" Text="Amusement Park in Alicante"></asp:Label>
        </div>
        <video loop muted autoplay>
            <source src="/Media/Logo/XadamaSpot.webm" type="video/webm">
            <source src="/Media/Logo/XadamaSpot.mp4" type="video/mp4">
        </video>
    </div>

    <div class="content container padding-64">
        <p class="center xxlarge text-orange margin-bottom-large bold uppercase padding-large">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
        <p class="center large text-darkblue margin-bottom-large padding-large margin-large">Discover the six continents of one of Europe&#39;s most iconic theme parks. An ideal destination for 
            a family getaway in the Costa Blanca, one of Spain&#39;s most popular tourist areas; 
            and just half an hour from Alicante!</p>
    </div>

    <div class="backimg2 display-container">
        <div class="display-middle no-opacity">
            <asp:LinkButton runat="server" CssClass="center button padding-medium xxlarge wide button-slice" text="ZONES"></asp:LinkButton>
        </div>
    </div>

    <uc1:carousel runat="server" ID="carousel" />

    <div class="backimg1 display-container">
        <div class="display-middle front">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="RIDES"></asp:LinkButton>
        </div>
    </div>

    <div class="content container padding-64 margin-32 no-overflow">
        <p class="center xlarge text-orange bold margin-bottom uppercase">Enjoy our best rides:</p>
        <p class="center medium text-darkblue margin-bottom-large">Drag the images around</p>
        <div class="row-padding center">
            <div class="col quarter image-appear1 draggable">
                <div class="shadow" style="transform: rotate(10deg); z-index: -1;">
                    <asp:Image ID="Image1" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Africa/AfricanCobra.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">African Cobra</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear3 draggable">
                <div class="shadow" style="transform: rotate(-3deg)">
                    <asp:Image ID="Image2" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/America/AmericanLasVegas.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">American Las Vegas</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear2 draggable">
                <div class="shadow" style="transform: rotate(9deg)">
                    <asp:Image ID="Image3" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Asia/AsianCars.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Asian Cars</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear4 draggable" style="transform: rotate(1deg)">
                <div class="shadow">
                    <asp:Image ID="Image7" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Europe/EuropeanCastle.jpeg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">European Castle</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-padding center">
            <div class="col quarter image-appear3 draggable">
                <div class="shadow" style="transform: rotate(-5deg);">
                    <asp:Image ID="Image4" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Asia/AsianCars.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Asian Cars</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear2 draggable">
                <div class="shadow" style="transform: rotate(2deg);">
                    <asp:Image ID="Image5" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">Oceanian Turtleaux</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear4 draggable">
                <div class="shadow" style="transform: rotate(-1deg);">
                    <asp:Image ID="Image6" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/America/AmericanNiagaraFalls.jpeg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">American Niagara Falls</p>
                    </div>
                </div>
            </div>
            <div class="col quarter image-appear1 draggable">
                <div class="shadow" style="transform: rotate(6deg);">
                    <asp:Image ID="Image8" runat="server" CssClass="image-menu" ImageUrl="~/Media/Rides/Africa/AfricanDinosaur.jpg" />
                    <div class="center padding-16 white">
                        <p class="text-darkblue large">African Dinosaur</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="backimg3 display-container">
        <div class="display-middle">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="SHOP"></asp:LinkButton>
        </div>
    </div>
    <div class="backimg4 display-container">
        <div class="display-middle">
            <asp:LinkButton runat="server" CssClass="center button padding-medium button-slice xxlarge wide" text="HOTELS"></asp:LinkButton>
        </div>
    </div>

</asp:Content>