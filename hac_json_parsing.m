%json���Ͽ��� �ʿ��� txt�� �����ϴ� ���α׷�

clear all;
imsize = [1000 1000]; % �̹����� ������

json_result=dir('E:\������\1123��\json����\*.json'); %�� ���丮 ���� json������ �ҷ�����
for j=1:length(json_result) % 1 ~ json_result ������ŭ �ݺ�
    
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
    for i=1:length(data.shapes) %json�� �����Ϳ��� �ʿ��� �κ��� ���� �� ����
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
        fprintf(fid2,'%d %.5f %.5f %.5f %.5f\n',clsid,meanpoint(1),meanpoint(2),width,height); %txt�� �� ����
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