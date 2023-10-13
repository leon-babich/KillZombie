.pragma library

var gameState
var sizeCell
var widthCell
var heightCell
var numberRows = 6
var numberCols = 6

function getGameState() {
    return gameState;
}

var gameField;

var targetComponent = Qt.createComponent("Target.qml");
var bulletComponent = Qt.createComponent("Bullet.qml");
var bloodEffectComponent = Qt.createComponent("BloodEffect.qml");

function newGameState(gameArea) {
    gameState = gameArea;
    gameField = create2DArray(gameState.rows, gameState.cols);
    sizeCell = gameState.squareSize
//    widthCell = gameState.widthCell
//    heightCell = gameState.heightCell
    return gameState;
}

function create2DArray(row, col) {
    var arr = [];

    for(var i = 0; i < row; i++) {
        arr[i] = [];
    }

    return arr;
}

function createTarget(parent, row, col, w, h) {
    var target = targetComponent.createObject(parent, { "row" : row, "col" : col, "widthCell" : w, "heightCell" : h })
    gameField[row][col] = target
}

function createBullet(parent, x, y) {
    var bullet = bulletComponent.createObject(parent, { "x" : x, "y" : y })
}

function createBloodEffect(parent, x, y) {
    var bloodEffect = bloodEffectComponent.createObject(parent, { "x" : x, "y" : y })
}

function getRandomRound(min, max) {
    return Math.round(Math.random() * (max - min) + min)
}

function destroyTarget(row, col) {
    gameField[row][col] = null;
}

function checkEmptyField(row, col) {
    if(gameField[row][col] == null) {
        return true;
    }
    else {
        return false;
    }
}
