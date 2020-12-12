const readline = require('readline')

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

console.log("Welcome to the calculator app!")
console.log("To use this, you start with a running total of 0 and modify it using the following operators")
console.log("+ X, this is used to add X to the running total")
console.log("* X, this is used to multiply X by the running total")
console.log("- X, this is used to subtract X from the running total")
console.log("/ X, this is used to divide the running total by X")
console.log("^ X, this is used to raise the running total to the power of X")
console.log("")
console.log("You can start with a valid input and press enter, or type \'exit\' to end program")

let runTot: number = 0.0
let choice: string = ""
let line: string[] = []

function addNum(a: number){
    runTot += a
}
function multiNum(a: number){
    runTot *= a
}
function subNum(a: number){
    runTot -= a
}
function divNum(a: number){
    if (a == 0){
        console.log("You cannot divide by 0. Nice try, but you'll have to be quicker than that!")
    } else {
        runTot /= a
    }
}
function powNum(a: number){
    runTot **= a
}
function printTotal(){
    console.log("Your running total is: ${runTot}")
}
function printX(a: string){
    console.log(a)
}

var recursiveAsyncReadLine = function () {
  rl.question('Please enter a valid input: ', function (answer) {
    if (answer == 'exit') //we need some base case, for recursion
      return rl.close(); //closing RL and returning from function.
    else if (answer != "DONE"){
        line = answer.split(" ")
        if (line.length > 1){
            //Addition
            if (line[0] === "+"){
                addNum(parseInt(line[1]))
            }
            //Multiplication
            if (line[0] === "*"){
                multiNum(parseInt(line[1]))
            }
            //Subtraction
            if (line[0] === "-"){
                subNum(parseInt(line[1]))
            }
            //Division
            if (line[0] === "/"){
                divNum(parseInt(line[1]))
            }
            //Exponeniation
            if (line[0] === "^"){
                powNum(parseInt(line[1]))
            }
            console.log("Your running total is: " + runTot)
        }
    }
    recursiveAsyncReadLine() //Calling this function again to ask new question
  });
}

recursiveAsyncReadLine()
