<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CurrencyConverter.Index" %>

<!DOCTYPE html>

<html data-ng-app="currencyApp" style="background-attachment: scroll;">
<head runat="server">
    <title>Currency Calculator</title>
    <link href="Style/custom.css" rel="stylesheet" />
    <script src="scripts/angular.min.js"></script>
    <script src="scripts/app.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box10" data-ng-controller="currencyController">
           <strong><p>Currency Converter</p></strong> 
            <table>
                <tr>
                    <td>
                        <div>
                            <asp:TextBox ID="tbFromCurrency" runat="server" name="number" data-ng-model="fromcurrval" is-number></asp:TextBox><br />
                            <asp:TextBox ID="tbToCurrency" runat="server" Text="{{outcurrvalue}}" ReadOnly="true" data-ng-model="outcurrvalue"></asp:TextBox><br />
                        </div>
                    </td>
                    <td>
                        <div class="select_style">
                            <asp:DropDownList ID="ddFromCurrency" runat="server" data-ng-model="fromcurrency" data-ng-change="update()">
                                <asp:ListItem Value="EUR">EURO</asp:ListItem>
                                <asp:ListItem Value="USD">US DOLLAR</asp:ListItem>
                                <asp:ListItem Value="JPY">JAPANESE YEN</asp:ListItem>
                                <asp:ListItem Value="BGN">BULGARIAN LEV</asp:ListItem>
                                <asp:ListItem Value="CZK">CZECH REPUBLIC KORUNA</asp:ListItem>
                                <asp:ListItem Value="DKK">DANISH KRONE</asp:ListItem>
                                <asp:ListItem Value="GBP">BRITISH POUND STERLING</asp:ListItem>
                                <asp:ListItem Value="HUF">HUNGARIAN FORINT</asp:ListItem>
                                <asp:ListItem Value="LTL">LITHUANIAN LITAS</asp:ListItem>
                                <asp:ListItem Value="LVL">LATVIAN LATS</asp:ListItem>
                                <asp:ListItem Value="PLN">POLISH ZLOTY</asp:ListItem>
                                <asp:ListItem Value="RON">ROMANIAN LEU</asp:ListItem>
                                <asp:ListItem Value="SEK">SWEDISH KRONA</asp:ListItem>
                                <asp:ListItem Value="CHF">SWISS FRANC</asp:ListItem>
                                <asp:ListItem Value="NOK">NORWEGIAN KRONE</asp:ListItem>
                                <asp:ListItem Value="HRK">CROATIAN KNA</asp:ListItem>
                                <asp:ListItem Value="RUB">RUSSIAN RUBLE</asp:ListItem>
                                <asp:ListItem Value="TRY">TURKISH LURA</asp:ListItem>
                                <asp:ListItem Value="AUD">AUSTRALIAN DOLLAR</asp:ListItem>
                                <asp:ListItem Value="BRL">BRAZILIAN REAL</asp:ListItem>
                                <asp:ListItem Value="CAD">CANADIAN DOLLAR</asp:ListItem>
                                <asp:ListItem Value="CNY">CHINESE YUAN</asp:ListItem>
                                <asp:ListItem Value="HKD">HONG KONG DOLLAR</asp:ListItem>
                                <asp:ListItem Value="IDR">INDONESIAN RUPIAH</asp:ListItem>
                                <asp:ListItem Value="ILS">ISREALI NEW SHEQEL</asp:ListItem>
                                <asp:ListItem Value="INR">INDIAN RUPEE</asp:ListItem>
                                <asp:ListItem Value="KRW">SOUTH KOREAN WON</asp:ListItem>
                                <asp:ListItem Value="MXN">MEXICAN PESO</asp:ListItem>
                                <asp:ListItem Value="MYR">MALAYSIAN RINGITT</asp:ListItem>
                                <asp:ListItem Value="NZD">NEW ZEALAND DOLLAR</asp:ListItem>
                                <asp:ListItem Value="PHP">PHILIPPINE PESO</asp:ListItem>
                                <asp:ListItem Value="SGD">SINGAPORE DOLLAR</asp:ListItem>
                                <asp:ListItem Value="THB">THAI BAHT</asp:ListItem>
                                <asp:ListItem Value="ZAR">SOUTH AFRICAN RAND</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <br />
                        <div class="select_style">
                            <asp:DropDownList ID="ddToCurrency" runat="server" data-ng-model="tocurrency" CssClass="selectWrap" data-ng-change="update()">
                                <asp:ListItem Value="EUR">EURO</asp:ListItem>
                                <asp:ListItem Value="USD">US DOLLAR</asp:ListItem>
                                <asp:ListItem Value="JPY">JAPANESE YEN</asp:ListItem>
                                <asp:ListItem Value="BGN">BULGARIAN LEV</asp:ListItem>
                                <asp:ListItem Value="CZK">CZECH REPUBLIC KORUNA</asp:ListItem>
                                <asp:ListItem Value="DKK">DANISH KRONE</asp:ListItem>
                                <asp:ListItem Value="GBP">BRITISH POUND STERLING</asp:ListItem>
                                <asp:ListItem Value="HUF">HUNGARIAN FORINT</asp:ListItem>
                                <asp:ListItem Value="LTL">LITHUANIAN LITAS</asp:ListItem>
                                <asp:ListItem Value="LVL">LATVIAN LATS</asp:ListItem>
                                <asp:ListItem Value="PLN">POLISH ZLOTY</asp:ListItem>
                                <asp:ListItem Value="RON">ROMANIAN LEU</asp:ListItem>
                                <asp:ListItem Value="SEK">SWEDISH KRONA</asp:ListItem>
                                <asp:ListItem Value="CHF">SWISS FRANC</asp:ListItem>
                                <asp:ListItem Value="NOK">NORWEGIAN KRONE</asp:ListItem>
                                <asp:ListItem Value="HRK">CROATIAN KNA</asp:ListItem>
                                <asp:ListItem Value="RUB">RUSSIAN RUBLE</asp:ListItem>
                                <asp:ListItem Value="TRY">TURKISH LURA</asp:ListItem>
                                <asp:ListItem Value="AUD">AUSTRALIAN DOLLAR</asp:ListItem>
                                <asp:ListItem Value="BRL">BRAZILIAN REAL</asp:ListItem>
                                <asp:ListItem Value="CAD">CANADIAN DOLLAR</asp:ListItem>
                                <asp:ListItem Value="CNY">CHINESE YUAN</asp:ListItem>
                                <asp:ListItem Value="HKD">HONG KONG DOLLAR</asp:ListItem>
                                <asp:ListItem Value="IDR">INDONESIAN RUPIAH</asp:ListItem>
                                <asp:ListItem Value="ILS">ISREALI NEW SHEQEL</asp:ListItem>
                                <asp:ListItem Value="INR">INDIAN RUPEE</asp:ListItem>
                                <asp:ListItem Value="KRW">SOUTH KOREAN WON</asp:ListItem>
                                <asp:ListItem Value="MXN">MEXICAN PESO</asp:ListItem>
                                <asp:ListItem Value="MYR">MALAYSIAN RINGITT</asp:ListItem>
                                <asp:ListItem Value="NZD">NEW ZEALAND DOLLAR</asp:ListItem>
                                <asp:ListItem Value="PHP">PHILIPPINE PESO</asp:ListItem>
                                <asp:ListItem Value="SGD">SINGAPORE DOLLAR</asp:ListItem>
                                <asp:ListItem Value="THB">THAI BAHT</asp:ListItem>
                                <asp:ListItem Value="ZAR">SOUTH AFRICAN RAND</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>
            </table>
            <div class="spinner" data-ng-show="loading">
                <div class="rect1"></div>
                <div class="rect2"></div>
                <div class="rect3"></div>
                <div class="rect4"></div>
                <div class="rect5"></div>
            </div>
        </div>
    </form>
</body>
</html>
