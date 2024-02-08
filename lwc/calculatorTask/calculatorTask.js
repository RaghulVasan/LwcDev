import { LightningElement, track } from 'lwc';

export default class calculatorTask extends LightningElement {
     result = '';

    appendToResult(event) {
        const value = event.target.dataset.value;
        this.result += value;
    }

    calculate() {
        try {
            this.result = eval(this.result);
        } catch (error) {
            this.result = 'Error';
        }
    }

    clearResult() {
        this.result = '';
    }
}