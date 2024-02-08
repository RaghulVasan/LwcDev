import { LightningElement, track } from 'lwc';

export default class Calculator extends LightningElement {

     operand1 = '';
     operand2 = '';
     operator = '';
     result = '';
    handleOperandChange(event) {
        if (this.operator === '') {
            this.operand1 = event.target.value;
        } else {
            this.operand2 = event.target.value;
        }
    }
    handleNumberClick(event) {
        const clickedNumber = event.target.label;
        if (this.operator === '') {
            this.operand1 += clickedNumber;
        } else {
            this.operand2 += clickedNumber;
        }
    }
    handleOperatorClick(event) {

        this.operator = event.target.label;

    }
    calculateResult() {
        const num1 = parseFloat(this.operand1);
        const num2 = parseFloat(this.operand2);
        switch (this.operator) {
            case '+':
                this.result = num1 + num2;
                break;
            case '-':
                this.result = num1 - num2;
                break;
            case '*':
                this.result = num1 * num2;
                break;
            case '/':
                this.result = num1 / num2;
                break;
        }
    }
}