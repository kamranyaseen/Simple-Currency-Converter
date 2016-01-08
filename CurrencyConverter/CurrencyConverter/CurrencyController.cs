using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

namespace CurrencyConverter
{
    public class CurrencyController : ApiController
    {
        [HttpGet]
        [ActionName("convertcurrency")]
        public Double ConvertCurrency(string incurrcode, string incurrvalue, string outcurrcode)
        {
            string currencyUrl = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml";
            string rate = "";
            string incurrcodetoeuro = "";
            string outcurrcodetoeuro = "";

            Double outcurrencyvalue = 0;
            try
            {
                if (incurrvalue.Equals("0"))
                {
                    outcurrencyvalue = 0;
                }
                else
                {
                    if (incurrcode.Equals(outcurrcode))
                    {
                        outcurrencyvalue = Convert.ToDouble(incurrvalue);
                    }
                    else
                    {
                        XDocument xmlDoc = XDocument.Load(currencyUrl);
                        foreach (XElement element in xmlDoc.Root.Descendants())
                        {
                            XName name = element.Name;
                            if (name.LocalName == "Cube")
                            {
                                foreach (XElement elem in element.DescendantNodes())
                                {
                                    foreach (XElement element1 in elem.DescendantNodes())
                                    {
                                        if (element1.Attribute("currency").Value.Equals(incurrcode))
                                        {
                                            incurrcodetoeuro = element1.LastAttribute.Value.ToString();
                                        }
                                        else if (element1.Attribute("currency").Value.Equals(outcurrcode))
                                        {
                                            outcurrcodetoeuro = element1.LastAttribute.Value.ToString();
                                        }

                                    }

                                }
                            }

                        }

                        if (incurrcode.Equals("EUR"))
                        {
                            rate = outcurrcodetoeuro;
                            Double currVal = Convert.ToDouble(rate) * Convert.ToDouble(incurrvalue);
                            outcurrencyvalue = currVal;
                        }

                        else if (outcurrcode.Equals("EUR"))
                        {
                            rate = incurrcodetoeuro;
                            Double currVal = (1 / Convert.ToDouble(rate)) * Convert.ToDouble(incurrvalue);
                            outcurrencyvalue = currVal;

                        }

                        else
                        {
                            Double fromVal = Convert.ToDouble(incurrcodetoeuro);
                            Double toVal = Convert.ToDouble(outcurrcodetoeuro);
                            Double baseResult = (1 / fromVal);
                            Double currVal = baseResult * toVal * Convert.ToDouble(incurrvalue);
                            outcurrencyvalue = currVal;
                        }
                    }
                }
                return Math.Round(outcurrencyvalue, 4);
            }
            catch (FormatException fex)
            {
                return 0;
            }
        }
    }
}