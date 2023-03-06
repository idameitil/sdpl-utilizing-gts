
const colorScheme = [
    {
        color: [255, 165, 0],
        members: ['G', 'A', 'S', 'T']
    },
    {
        color: [0, 255, 0],
        members: ['C', 'V', 'I', 'L', 'P', 'F', 'Y', 'M', 'W']
    },
    {
        color: [255, 0, 255],
        members: ['N', 'Q', 'H']
    },
    {
        color: [255, 0, 0],
        members: ['D', 'E']
    },
    {
        color: [0, 0, 255],
        members: ['K', 'R']
    }
]

const canvasWidth = 10000;
const canvasHeight = 3000;
const spaceBetweenArchitectures = 200;
const leftMargin = 20
const topMargin = 20

function setup(){
    background(255);
    //noStroke();
    createCanvas(canvasWidth, canvasHeight);
    let i = 0;
    for(const architectureName in architectures){
        const y = spaceBetweenArchitectures/2+i*spaceBetweenArchitectures;
        drawArchitectureName(architectureName, y+topMargin);
        drawArchitecture(architectures[architectureName], conservedResidues[architectureName], y);
        i++;
    }
}

const unitSize = 20;
function drawArchitecture(architectureString, conservedResidues, y){
    for(const i in architectureString){
        const fillConserved = (...v) => !conservedResidues[i]?fill(...v):fill(0);
        switch(architectureString[i]){
            case '-':
                fillConserved(200);
                drawOutside(i*unitSize+leftMargin, y+topMargin);
                break;
            case '_':
                fillConserved(200);
                drawInside(i*unitSize+leftMargin, y+topMargin); 
                break;
            case '=':
                fillConserved(45, 130, 80);
                drawHelix(i*unitSize+leftMargin, y+topMargin, !!conservedResidues[i]);
                break;
        }
        drawConservedResidue(conservedResidues[i], i*unitSize, y+topMargin);
    }
}

function getColor(conservedResidue){
    let scheme = colorScheme.filter(({members})=> members.includes(conservedResidue));
    if(scheme.length === 0){
        throw "No color scheme defined for "+conservedResidue;
    }
    return scheme[0].color;
}

function drawConservedResidue(conservedResidue, x, y){
    const size = 140;
    if(!conservedResidue){
        return;
    }
    const color = getColor(conservedResidue);
    textSize(size);
    fill(...color);
    text(conservedResidue, x-size/4, y-5);
}

function drawInside(x, y){
    noStroke();
    rect(x, y+unitSize*.5, unitSize, unitSize*.5)
}

function drawOutside(x, y){
    noStroke();
    rect(x, y, unitSize, unitSize*.5);
}

function drawHelix(x, y, hasConservedResidue){
    if(hasConservedResidue){
        square(x, y, unitSize);
        return;
    }
    let i;
    for(i = 0; i<unitSize/2; i++){
        stroke(map(i, 0, unitSize/2, 0, 255));
        line(x+i, y, x+i, y+unitSize);
    }
    for(; i< unitSize; i++){
        stroke(map(i, unitSize/2, unitSize, 255, 0));
        line(x+i, y, x+i, y+unitSize);
    }
}

function drawArchitectureName(architectureName, y){
    const size = 70;
    const color = [0, 0, 0];
    textSize(size);
    fill(...color);
    text(architectureName, leftMargin, y-50);
}