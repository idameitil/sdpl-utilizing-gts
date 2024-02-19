const colorScheme = [
    {
        color: [255, 0, 255],
        members: ['G', 'Y', 'S', 'T', 'N', 'C', 'Q']
    },
    {
        color: [70, 156, 118],
        members: ['V', 'I', 'L', 'P', 'F', 'M', 'W', 'A']
    },
    {
        // color: [255, 0, 0],
        color: [255, 140, 0],
        members: ['D', 'E', 'H']
    },
    {
        color: [0, 0, 255],
        members: ['K', 'R']
    }
]


// const spaceBetweenArchitectures = 500;
// const spaceBetweenClans = 650;
// const leftMargin = 150;
// const rightMargin = 150;
// const topMargin = 100;
// const canvasWidth = 9350 + rightMargin + leftMargin;
// const canvasHeight = Object.keys(lengths).length*spaceBetweenArchitectures+topMargin+3*spaceBetweenClans-65;
// const spaceBeforeArchitectureName = 60;
// const blastLineThickness = 16
// const sequenceIndent = 600;
const spaceBetweenArchitectures = 500*2;
const spaceBetweenClans = 650*2;
const leftMargin = 150*2;
const rightMargin = 150*2;
const topMargin = 100*2;
const canvasWidth = 9350*2 + rightMargin + leftMargin;
const canvasHeight = (Object.keys(lengths).length*spaceBetweenArchitectures+topMargin+3*spaceBetweenClans-(65*2));
const spaceBeforeArchitectureName = 60*2;
const blastLineThickness = 16*2;
console.log(canvasWidth);

function setup(){
    background(255);
    //noStroke();
    createCanvas(canvasWidth, canvasHeight);
    let i = 0;
    let j = 0;
    for(const familyDetails of architectures){
        let y;
        const family = familyDetails.sequences;
        drawBlackLine(10*2);
        const familyYOffset = spaceBetweenArchitectures/2+(i+1)*spaceBetweenClans+topMargin;
        drawFamilyName(familyDetails, familyYOffset+j*spaceBetweenArchitectures);
        for(const architectureName in family){
            y = familyYOffset+j*spaceBetweenArchitectures;
            drawArchitectureName(architectureName, y-(150*2));
            drawArchitecture(family[architectureName], conservedResidues[architectureName], lengths[architectureName], y);
            j++;
        }
        drawBlackLine(y+(170*2));
        i++;
    }
    drawVerticalLine(0)
    drawVerticalLine(canvasWidth-blastLineThickness)
}

const unitSize = 20*2;
function drawArchitecture(architectureString, conservedResidues, sequencelength, y){
    for(const i in architectureString){
        if(i==190 && !!conservedResidues[191]){
            console.log('hello');
        }
        const isConserved = !!conservedResidues[parseInt(i)+1];
        const fillConserved = (...v) => !isConserved?fill(...v):fill(0);
        const indent = max_length - sequencelength;
        switch(architectureString[i]){
            case 'l':
                fillConserved(200);
                drawLoop(i*unitSize+leftMargin+indent*unitSize, y);
                break;
            // case '_':
            //     fillConserved(200);
            //     drawInside(i*unitSize+leftMargin+indent*unitSize, y); 
            //     break;
            // case '_':
            //     fillConserved(200);
            //     drawOutside(i*unitSize+leftMargin+indent*unitSize, y); 
            //     break;
            case 'h':
                fillConserved(45, 130, 80);
                drawHelix(i*unitSize+leftMargin+indent*unitSize, y-(10*2), isConserved);
                break;
            case 'e':
                fillConserved(45, 130, 80);
                drawECHelix(i*unitSize+leftMargin+indent*unitSize, y-(10*2), isConserved);
                break;
            case 's':
                // fillConserved(45, 130, 80);
                // drawSheet(i*unitSize+leftMargin+indent*unitSize, y, !!conservedResidues[i]);
                fillConserved(200);
                drawLoop(i*unitSize+leftMargin+indent*unitSize, y);
                break;
        }
        drawConservedResidue(conservedResidues[i], i, (i)*unitSize+leftMargin+indent*unitSize, y);
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
    let conservedResidueAminoacid = conservedResidue;
    let offset = 0;
    if(!conservedResidue){
        return;
    }
    if (typeof conservedResidue == 'object'){
        conservedResidueAminoacid = conservedResidue.aminoacid;
        offset = conservedResidue.offset*2;
    }
    const size_residue_text = 180*2;
    const color_residue_text = getColor(conservedResidueAminoacid);
    textSize(size_residue_text);
    fill(...color_residue_text);
    text(conservedResidueAminoacid, x-size_residue_text/4+offset-(27*2), y-(20*2));

    const color_position_text = [0, 0, 0];
    // const size_position_text = 50;
    const size_position_text = 100*2;
    textSize(size_position_text);
    fill(...color_position_text);
    text(position, x-size_residue_text/4-(10*2)+offset-(27*2), y-(170*2));
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
        rect(x, y, unitSize, unitSize*3);
        return;
    }
    fill(130, 130, 130);
    rect(x, y, unitSize, unitSize*3);
    // let i;
    // for(i = 0; i<unitSize/2; i++){
    //     stroke(map(i, 0, unitSize/2, 0, 255));
    //     line(x+i, y, x+i, y+unitSize*3);
    // }
    // for(; i< unitSize; i++){
    //     stroke(map(i, unitSize/2, unitSize, 255, 0));
    //     line(x+i, y, x+i, y+unitSize*3);
    // }
}

function drawECHelix(x, y, hasConservedResidue){
    if(hasConservedResidue){
        rect(x, y, unitSize, unitSize*3);
        return;
    }
    fill(200, 200, 200);
    rect(x, y, unitSize, unitSize*3);
    // let i;
    // for(i = 0; i<unitSize/2; i++){
    //     stroke(map(i, 0, unitSize/2, 175, 255));
    //     line(x+i, y, x+i, y+unitSize*3);
    // }
    // for(; i< unitSize; i++){
    //     stroke(map(i, unitSize/2, unitSize, 255, 175));
    //     line(x+i, y, x+i, y+unitSize*3);
    // }
}

function drawSheet(x, y){
    const color = [150, 0, 0];
    stroke(color)
    rect(x, y, unitSize, unitSize*2)
}

function drawFamilyName({familyName, subFamilyName}, y){
    const fontSize = 300*2;
    fill(0, 0, 0);
    textSize(fontSize);
    const topMargin = 550*2;
    textStyle(BOLD);
    text(familyName, leftMargin, y-topMargin);
    textSize(fontSize*.4);
    text(subFamilyName, leftMargin+(2.4*fontSize), y-topMargin+(fontSize*.1));
    textStyle(NORMAL);
}

function drawArchitectureName(architectureName, y){
    const size = 160*2;
    const color = [0, 0, 0];
    textSize(size);
    fill(...color);
    // text(architectureName.substring(0,4), leftMargin+max_length*unitSize+spaceBeforeArchitectureName, y+40);
    // text(architectureName, leftMargin+max_length*unitSize+spaceBeforeArchitectureName, y+40);
    text(architectureName+':', leftMargin, y-40);
}

function drawBlackLine(y){
    const color = [150, 150, 150];
    fill(...color);
    stroke(color)
    rect(0, y, canvasWidth, blastLineThickness)
}

function drawVerticalLine(x){
    const color = [150, 150, 150];
    fill(...color);
    stroke(color)
    rect(x, blastLineThickness, blastLineThickness, canvasHeight)
}