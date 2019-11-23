%json파일에서 필요한 txt만 추출하는 프로그램

clear all;
imsize = [1000 1000]; % 이미지의 사이즈

json_result=dir('E:\노지훈\1123톤\json파일\*.json'); %이 디렉토리 내의 json파일을 불러오기
for j=1:length(json_result) % 1 ~ json_result 갯수만큼 반복
    
    fname = json_result(j).name;
    path=strcat(json_result(j).folder,'\',fname);
    fid = fopen(path);
    raw = fread(fid);
    str = char(raw');
    fclose(fid);
    data = jsondecode(str);
    fname2 = json_result(j).name;
    fname2 = erase(fname2,".json")
    path2 =strcat(json_result(j).folder,'\',fname2,'.txt')
    fid2 = fopen(path2, 'w');
    for i=1:length(data.shapes) %json의 데이터에서 필요한 부분을 추출 및 정제
        strlabel = data.shapes(i).label;
        points   = data.shapes(i).points;
        meanpoint = mean(data.shapes(i).points,1);
        meanpoint = meanpoint./imsize;    
        maxval = max(data.shapes(i).points,[],1);
        minval = min(data.shapes(i).points,[],1);
        width = maxval(1) - minval(1);
        height= maxval(2) - minval(2);
        width = width/imsize(1);
        height= height/imsize(2);
        clsid = GetClsId(strlabel);
        fprintf(fid2,'%d %.5f %.5f %.5f %.5f\n',clsid,meanpoint(1),meanpoint(2),width,height); %txt에 들어갈 내용
    end
    fclose(fid2);
end

function clsid = GetClsId(str)
switch str
    case 'sun'
        clsid = 0;        
    otherwise
        clsid = 1; 
end
end