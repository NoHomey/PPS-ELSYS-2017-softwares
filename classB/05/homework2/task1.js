const fs=require("fs");
const csv_parse=require("csv-parse/lib/sync");
let matric1=csv_parse(fs.readFileSync("matric.csv").toString(),{auto_parse: true})
let matric2=csv_parse(fs.readFileSync("matric1.csv").toString(),{auto_parse:true})
if(matric1.length==matric2.length && matric1[0].length==matric2[0].length){
    sum_matric=sumMatrix(matric1,matric2)
    tran_matric=transponition(sum_matric);
    neg_matric=negative(sum_matric);
    if(equalMatrixes(res_matric,neg_matric)){
        console.log(true);
    }
    else{
        console.log(false);
    }
}
else{
    console.log(undefined);
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
function negative(matric){
    for(let i=0;i<matric.length;i++){
        for(let a=0;a<matric[i].length;a++){
            matric[i][a]=-matric[i][a]
        }
    }
    return matric
}
function sumMatrix(matric1,matric2){
    let res_matrics=matric1;
    for(let i=0;i<matric1.length;i++){
        for(let a=0;a<matric1[i].length;a++){
            res_matrics[i][a]=matric1[i][a]+matric2[i][a]
        }
    }
    return res_matrics
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

//arr_of_arrs.push(row);