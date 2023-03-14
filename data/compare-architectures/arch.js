
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

const canvasWidth = 9400;
// const canvasHeight = 3500;
const canvasHeight = 7000;
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
        drawArchitecture(architectures[architectureName], conservedResidues[architectureName], lengths[architectureName], y);
        i++;
    }
}

const unitSize = 20;
function drawArchitecture(architectureString, conservedResidues, sequencelength, y){
    for(const i in architectureString){
        const fillConserved = (...v) => !conservedResidues[i]?fill(...v):fill(0);
        const indent = lengths['max'] - sequencelength;
        switch(architectureString[i]){
            case 'l':
                fillConserved(200);
                drawOutside(i*unitSize+leftMargin+indent*unitSize, y+topMargin);
                break;
            // case '_':
            //     fillConserved(200);
            //     drawInside(i*unitSize+leftMargin+indent*unitSize, y+topMargin); 
            //     break;
            case 'h':
                fillConserved(45, 130, 80);
                drawHelix(i*unitSize+leftMargin+indent*unitSize, y+topMargin, !!conservedResidues[i]);
                break;
            case 'e':
                fillConserved(45, 130, 80);
                drawECHelix(i*unitSize+leftMargin+indent*unitSize, y+topMargin, !!conservedResidues[i]);
                break;
            case 's':
                fillConserved(45, 130, 80);
                drawSheet(i*unitSize+leftMargin+indent*unitSize, y+topMargin, !!conservedResidues[i]);
                break;
        }
        drawConservedResidue(conservedResidues[i], i*unitSize+leftMargin+indent*unitSize, y+topMargin);
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
    rect(x, y+unitSize*2*.5, unitSize, unitSize*2*.5)
}

function drawOutside(x, y){
    noStroke();
    // const color = [150, 0, 0];
    // fill(...color);
    rect(x, y, unitSize, unitSize*2*.5);
}

function drawHelix(x, y, hasConservedResidue){
    if(hasConservedResidue){
        rect(x, y, unitSize, unitSize*2);
        return;
    }
    let i;
    for(i = 0; i<unitSize/2; i++){
        stroke(map(i, 0, unitSize/2, 0, 255));
        line(x+i, y, x+i, y+unitSize*2);
    }
    for(; i< unitSize; i++){
        stroke(map(i, unitSize/2, unitSize, 255, 0));
        line(x+i, y, x+i, y+unitSize*2);
    }
}

function drawECHelix(x, y, hasConservedResidue){
    if(hasConservedResidue){
        rect(x, y, unitSize, unitSize*2);
        return;
    }
    let i;
    for(i = 0; i<unitSize/2; i++){
        stroke(map(i, 0, unitSize/2, 200, 255));
        line(x+i, y, x+i, y+unitSize*2);
    }
    for(; i< unitSize; i++){
        stroke(map(i, unitSize/2, unitSize, 255, 200));
        line(x+i, y, x+i, y+unitSize*2);
    }
}

function drawSheet(x, y){
    const color = [150, 0, 0];
    // fill(...color);
    stroke(color)
    rect(x, y, unitSize, unitSize*2)
}

function drawArchitectureName(architectureName, y){
    const size = 70;
    const color = [0, 0, 0];
    textSize(size);
    fill(...color);
    text(architectureName, leftMargin, y-10);
}