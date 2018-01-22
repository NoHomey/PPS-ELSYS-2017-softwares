const fs=require("fs");
const csv_parse=require("csv-parse/lib/sync");
let matric1=csv_parse(fs.readFileSync("matric.csv").toString(),{auto_parse: true})
let matric2=csv_parse(fs.readFileSync("matric1.csv").toString(),{auto_parse:true})

if(matric1[0].length==matric2.length){
    let resOfMul=mulMatrix(matric1,matric2);
    console.log(matric1,matric2)
    console.log(resOfMul)
    let transpondMatrix=transponition(resOfMul);
    if(equalMatrixes(resOfMul,transpondMatrix)){
        console.log(true);
    }else{
        console.log(false);
    }
}
function transponition(matric){
    let res_matrics=[];
    for(let i=0;i<matric[0].length;i++){
        let vector=[];
        for(let a=0;a<matric.length;a++){
            vector.push(matric[a][i]);
        }
        res_matrics.push(vector);
    }
    return res_matrics
}
function mulMatrix(matric1,matric2){
    let resMatrix=[]
        for(let r=0;r<matric1.length;r++){
            let vector=[];
            for(let c=0;c<matric2[0].length;c++){
                vector.push(0);
            }
            resMatrix.push(vector);
        }
        for(let r=0;r<matric2[0].length;r++){
                for(let i=0;i<matric1.length;i++){
                    let sum=0;
                    for(let c=0;c<matric1[0].length;c++){
                        sum+=matric1[i][c]*matric2[c][r]
                    }
                    resMatrix[i][r]=sum;
                }
        }
        
    return resMatrix
}
function equalMatrixes(matric1,matric2){
    for(let i=0;i<matric1.length;i++){
        for(let a=0;a<matric1[i].length;a++){
            if(matric1[i][a]!=matric2[i][a]){
                return false;
            }
        }
    }
    return true;
}