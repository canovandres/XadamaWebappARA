<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="carousel.ascx.cs" Inherits="XadamaWebapp.carousel" %>

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

<div class="slider-container padding-64">
    <p class="center xlarge text-orange margin-bottom-large bold uppercase">Our park is distributed in 5 zones, one for each continent. Find them out!</p>
    <div class="swiper">
        <div id="slide1" class="slide" style="left: -33.3333%">
            <asp:Image ID="Image9" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Africa/AfricanPyramid.jpg" />
            <div class="show-text show-text-africa">
                <asp:Label ID="Label3" runat="server" CssClass="text-white" Text="AFRICA"></asp:Label>
                <div class="text-white">
                    <p>Enjoy the wild animals and beautiful sabannahs</p>
                    <asp:Button runat="server" text="GO!" CssClass="button-africa button-sign" />
                </div>
            </div>
        </div>
        <div id="slide2" class="slide" style="left: 0%">
            <asp:Image ID="Image10" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/America/AmericanHollywood.jpg" />
            <div class="show-text show-text-america">
                <asp:Label ID="Label12" runat="server" CssClass="text-white" Text="AMERICA"></asp:Label>
                <div class="text-white">
                    <p>Live an authentic american experience</p>
                    <asp:Button runat="server" text="GO!" CssClass="button-america button-sign" />
                </div>
            </div>
        </div>
        <div id="slide3" class="slide" style="left: 33.3333%">
            <asp:Image ID="Image11" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Europe/EuropeanLondonEye.jpg" />
            <div class="show-text show-text-europe">
                <asp:Label ID="Label13" runat="server" CssClass="text-white" Text="EUROPE"></asp:Label>
                <div class="text-white">
                    <p>Immerse yourself in the different cultures Europe has to offer</p>
                    <asp:Button runat="server" text="GO!" CssClass="button-europe button-sign" />
                </div>
            </div>
        </div>
        <div id="slide4" class="slide" style="left: 66.6666%">
            <asp:Image ID="Image12" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Asia/AsianChina.jpg" />
            <div class="show-text show-text-asia">
                <asp:Label ID="Label10" runat="server" CssClass="text-white" Text="ASIA"></asp:Label>
                <div class="text-white">
                    <p>Travel to the amazing China and explore the oriental culture</p>
                    <asp:Button runat="server" text="GO!" CssClass="button-asia button-sign" />
                </div>
            </div>
        </div>
        <div id="slide5" class="slide" style="left: 99.9999%">
            <asp:Image ID="Image13" runat="server" CssClass="slide-image" ImageUrl="~/Media/Rides/Oceania/OceanianTurtleaux.jpg" />
            <div class="show-text show-text-oceania">
                <asp:Label ID="Label14" runat="server" CssClass="text-white" Text="OCEANIA"></asp:Label>
                <div class="text-white">
                    <p>Love the long beaches and the paradisiac landscapes</p>
                    <asp:Button runat="server" text="GO!" CssClass="button-oceania button-sign" />
                </div>
            </div>
        </div>
    </div>
    <div id="slide-prev" class=" arrow arrow-prev left front text-white xlarge">
        <p style="margin: 13px">❮</p>
    </div>
    <div id="slide-next" class="arrow arrow-next right front text-white xlarge">
        <p style="margin: 15px">❯</p>
    </div>
</div>