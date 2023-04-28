
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

const spaceBetweenArchitectures = 220;
const leftMargin = 30;
const topMargin = 60;
const canvasWidth = 9300;
const canvasHeight = Object.keys(lengths).length*spaceBetweenArchitectures+topMargin;
const spaceBeforeArchitectureName = 60;
// const sequenceIndent = 600;

function setup(){
    background(255);
    //noStroke();
    createCanvas(canvasWidth, canvasHeight);
    let i = 0;
    for(const family of architectures){
        let y;
        drawBlackLine(10);
        for(const architectureName in family){
            y = spaceBetweenArchitectures/2+i*spaceBetweenArchitectures;
            drawArchitectureName(architectureName, y+topMargin);
            drawArchitecture(family[architectureName], conservedResidues[architectureName], lengths[architectureName], y);
            i++;
        }
        drawBlackLine(y+120);
    }
}

const unitSize = 20;
function drawArchitecture(architectureString, conservedResidues, sequencelength, y){
    for(const i in architectureString){
        const fillConserved = (...v) => !conservedResidues[i]?fill(...v):fill(0);
        const indent = max_length - sequencelength;
        switch(architectureString[i]){
            case 'l':
                fillConserved(200);
                drawLoop(i*unitSize+leftMargin+indent*unitSize, y+topMargin);
                break;
            // case '_':
            //     fillConserved(200);
            //     drawInside(i*unitSize+leftMargin+indent*unitSize, y+topMargin); 
            //     break;
            // case '_':
            //     fillConserved(200);
            //     drawOutside(i*unitSize+leftMargin+indent*unitSize, y+topMargin); 
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
        drawConservedResidue(conservedResidues[i], i, i*unitSize+leftMargin+indent*unitSize, y+topMargin);
    }
}

function getColor(conservedResidue){
    let scheme = colorScheme.filter(({members})=> members.includes(conservedResidue));
    if(scheme.length === 0){
        throw "No color scheme defined for "+conservedResidue;
    }
    return scheme[0].color;
}

function drawConservedResidue(conservedResidue, position, x, y){
    if(!conservedResidue){
        return;
    }
    const size_residue_text = 140;
    const color_residue_text = getColor(conservedResidue);
    textSize(size_residue_text);
    fill(...color_residue_text);
    text(conservedResidue, x-size_residue_text/4, y-5);
    
    const color_position_text = [0, 0, 0];
    const size_position_text = 50;
    textSize(size_position_text);
    fill(...color_position_text);
    text(position, x-size_residue_text/4+5, y-110);
}

function drawInside(x, y){
    noStroke();
    rect(x, y+unitSize*2*.5, unitSize, unitSize*2*.5)
}

function drawOutside(x, y){
    noStroke();
    rect(x, y, unitSize, unitSize*2*.5);
}

function drawLoop(x,y){
    noStroke();
    rect(x, y+unitSize*2*.25, unitSize, unitSize*2*.5);
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
    // text(architectureName.substring(0,4), leftMargin+max_length*unitSize+spaceBeforeArchitectureName, y+40);
    // text(architectureName, leftMargin+max_length*unitSize+spaceBeforeArchitectureName, y+40);
    text(architectureName, leftMargin, y-20);
}

function drawBlackLine(y){
    const color = [0, 0, 0];
    fill(...color);
    stroke(color)
    rect(0, y, canvasWidth, 6)
}