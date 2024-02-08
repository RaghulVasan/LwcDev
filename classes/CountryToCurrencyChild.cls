public with sharing class CountryToCurrencyChild extends CountryWebServices {
    public void CountryInfoImpl(){
     CountryWebServices.CountryInfoServiceSoap countryInfo = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.tCountryInfo countryInfoResponse = countryInfo.FullCountryInfo('US');
     System.debug(countryInfoResponse.sISOCode);
     System.debug(countryInfoResponse.sName);
     System.debug(countryInfoResponse.sCapitalCity);
     System.debug(countryInfoResponse.sPhoneCode);
     System.debug(countryInfoResponse.sContinentCode);
     System.debug(countryInfoResponse.sCurrencyISOCode);
     System.debug(countryInfoResponse.sCountryFlag);
    }
    public  void CountryFlag(){
     CountryWebServices.CountryInfoServiceSoap countryFlagImage = new CountryWebServices.CountryInfoServiceSoap();
     System.debug(countryFlagImage.CountryFlag('IN'));
    }
    public void CountryCurrencyImpl(){
     Countrywebservices.CountryInfoServiceSoap currencyInfo = new Countrywebservices.CountryInfoServiceSoap();
     Countrywebservices.tCurrency CountryCurrencyResponse = currencyInfo.CountryCurrency('US');
     System.debug(CountryCurrencyResponse);
     System.debug(CountryCurrencyResponse.sISOCode);
     System.debug(CountryCurrencyResponse.sName);
    }
    public void CountryNameImpl(){
     Countrywebservices.CountryInfoServiceSoap countryNameInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(countryNameInfo.CountryName('AE'));
    }
    public void CountryCodeImpl(){
     Countrywebservices.CountryInfoServiceSoap countryCodeInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(countryCodeInfo.CountryIntPhoneCode('AE'));
    }
    public void CurrencyByNameImpl(){
     Countrywebservices.CountryInfoServiceSoap currencyInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(currencyInfo.CurrencyName('INR'));
    }
    public void LanguageCodeImpl(){
     Countrywebservices.CountryInfoServiceSoap languagrCodeInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(languagrCodeInfo.LanguageISOCode('Arabic'));
    }
    public void CapitalImpl(){
     Countrywebservices.CountryInfoServiceSoap CapitalInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(CapitalInfo.CapitalCity('United Arab Emirates'));
    }
    public void LanguageNameImpl(){
     Countrywebservices.CountryInfoServiceSoap LanguageInfo = new Countrywebservices.CountryInfoServiceSoap();
     System.debug(LanguageInfo.LanguageName('ENG'));
    }
    public void CountryISOCodeImpl(){
     CountryWebServices.CountryInfoServiceSoap CountryISOCodeInfo = new CountryWebServices.CountryInfoServiceSoap();
     System.debug(CountryISOCodeInfo.CountryISOCode('India'));
    }
    public void ListOfCurrenciesByCodeImpl(){ 
     CountryWebServices.CountryInfoServiceSoap ListOfCurrencies = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftCurrency currencyList = ListOfCurrencies.ListOfCurrenciesByCode();
     for (CountryWebServices.tCurrency codecurrency : currencyList.tCurrency)
        {
          System.debug('Currency Code: ' + Codecurrency.sISOCode + '  Currency Name: ' + codecurrency.sName);
        }
    }
    public void ListOfCurrenciesByNameImpl(){
     CountryWebServices.CountryInfoServiceSoap ListOfCurrenciesName = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftCurrency currencyList = ListOfCurrenciesName.ListOfCurrenciesByName();
     for (CountryWebServices.tCurrency currencyName : currencyList.tCurrency)
        {
          System.debug('Currency Code: ' + currencyName.sISOCode + '  Currency Name: ' + currencyName.sName);
        }
    }
    public void ListOfCountryNamesByCodeImpl(){
     CountryWebServices.CountryInfoServiceSoap CountryNamesByCode = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftCountryCodeAndName currencyList = CountryNamesByCode.ListOfCountryNamesByCode();
     for (CountryWebServices.tCountryCodeAndName countryCodeAndName : currencyList.tCountryCodeAndName)
        {
          System.debug('Country Code: ' + countryCodeAndName.sISOCode + ', Country Name: ' + countryCodeAndName.sName);
        }
    }
    
    public  void AllCurrencyListImpl(){
     CountryWebServices.CountryInfoServiceSoap AllCurrencyInfo = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftCurrency currencyList = AllCurrencyInfo.ListOfCurrenciesByName();
     for (CountryWebServices.tCurrency allCodeCurrency : currencyList.tCurrency)
        {
          System.debug('Currency Code: ' + allCodeCurrency.sISOCode + ', Currency Name: ' + allCodeCurrency);
        }
    }

    public void ListOfLanguagesByNameImpl() {
     CountryWebServices.CountryInfoServiceSoap AllLanguagesByNameList = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftLanguage LanguagesList = AllLanguagesByNameList.ListOfLanguagesByName();
     for (CountryWebServices.tLanguage allLangName : LanguagesList.tLanguage) 
        {   
          System.debug('Currency Code: ' + allLangName.sISOCode + ', Currency Name: ' + allLangName.sName);
        }
    }
    public  void ListOfCountryNamesByNameImpl(){
     CountryWebServices.CountryInfoServiceSoap AllCountryNamesList = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftCountryCodeAndName currencyList = AllCountryNamesList.ListOfCountryNamesByName();
     for (CountryWebServices.tCountryCodeAndName allCountryNames : currencyList.tCountryCodeAndName)
        {
          System.debug('Currency Code: ' + allCountryNames.sISOCode + ', Currency Name: ' + allCountryNames.sName);
        }
    }
    public void ListOfContinentsByNameImpl() {
     CountryWebServices.CountryInfoServiceSoap AllContinentsNamesList = new CountryWebServices.CountryInfoServiceSoap();
     CountryWebServices.ArrayOftContinent currencyList = AllContinentsNamesList.ListOfContinentsByName();
     for (CountryWebServices.tContinent allContinent : currencyList.tContinent) 
        {
          System.debug('Continent Code:' + allContinent.sCode + ', Continent Name:' + allContinent.sName);
        }
    }  

    public  void FullCountryInfoAllCountriesImpl(){
     CountryWebService.CountryInfoServiceSoap AllCountryNamesList = new CountryWebService.CountryInfoServiceSoap();
     CountryWebService.ArrayOftCountryInfo currencyList = AllCountryNamesList.FullCountryInfoAllCountries();
     for (CountryWebService.tCountryInfo currentContinent : currencyList.tCountryInfo)
        {
          System.debug('Country Name: ' + currentContinent.sName);
        }
    }  
    public  void CountriesUsingCurrencyImpl(){
     CountryWebService.CountryInfoServiceSoap CountriesCurrencyList = new CountryWebService.CountryInfoServiceSoap();
     CountryWebService.ArrayOftCountryCodeAndName CountriesNameList = CountriesCurrencyList.CountriesUsingCurrency('INR');
     for (CountryWebService.tCountryCodeAndName currentContinent : CountriesNameList.tCountryCodeAndName)
        {
          System.debug('Country Name: ' + currentContinent.sName);
        }
    }
    public  void ListOfContinentsByCodeImpl(){ 
     CountryWebService.CountryInfoServiceSoap ListOfContinents = new CountryWebService.CountryInfoServiceSoap();
     CountryWebService.ArrayOftContinent currencyList = ListOfContinents.ListOfContinentsByCode();
     for (CountryWebService.tContinent currentContinent : currencyList.tContinent)
        {
         System.debug('Continent Name: ' + currentContinent.sName+' Continent Code is : '+currentContinent.sCode);
        }
    }
}
    

    
    
    