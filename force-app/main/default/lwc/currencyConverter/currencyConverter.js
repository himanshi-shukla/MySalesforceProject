import { LightningElement } from 'lwc';

export default class CurrencyConverter extends LightningElement {
    amount = 1;
    fromCurrency = 'USD';
    toCurrency = 'INR';
    convertedAmount = this.convertCurrency(this.amount, this.fromCurrency, this.toCurrency);
    currencyOptions = [
        {
            label: 'US Dollar (USD)',
            value: 'USD'
        },
        {
            label: 'INdian Rupees (INR)',
            value: 'INR'
        },
    ];

    handleAmountChange(event) {
        this.amount = event.target.value;
        this.convertAndDisplay();

    }

    handleFromCurrencyChange(event) {
        this.fromCurrency = event.detail.value;
        this.convertAndDisplay();
    }

    handleToCurrencyChange(event) {
        this.toCurrency = event.detail.value;
        this.convertAndDisplay();
    }

    convertAndDisplay() {
        this.convertedAmount = this.convertCurrency(this.amount, this.fromCurrency, this.toCurrency);
    }

    convertCurrency(amount, fromCurrency, toCurrency) {
        // Define fixed exchange rates (example rates, replace with actual rates)
        const exchangeRates = {
            'USD': 1,
            'INR': 83.88,
            // Add more rates as needed
        };

        // Perform currency conversion
        const convertedAmount = (amount / exchangeRates[fromCurrency]) * exchangeRates[toCurrency];


        // Round to two decimal places
        return Math.round(convertedAmount * 100) / 100;
    }

}