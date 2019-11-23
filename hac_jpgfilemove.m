%json파일과 이름이 같은 jpg 파일만 불러서 json 위치에 복사

strjsontxtroot = 'E:\노지훈\1123톤\json파일\'; %json 파일의 디렉토리
strimageroot = 'E:\노지훈\1123톤\[ICT콕] 항공사진 이미지\color\'; %jpg 파일의 디렉토리
idx = strfind(strjsontxtroot,'\');

filelist = dir(strcat(strjsontxtroot,'*.*'));
for i=1:length(filelist)
    if strcmp(filelist(i).name,'.')==0 && strcmp(filelist(i).name,'..')==0
        
        strfileroot = strjsontxtroot; 
        strfilename = strcat(strfileroot,'*.json');
        filelist2 = dir(strfilename);
        for j=1:length(filelist2)
            strfiletitle = filelist2(j).name(1:end-4);
            strfiletitle = strcat(strfiletitle,'jpg');
            strfilename = strcat(strimageroot,strfiletitle);
            strfilename2 = strcat(strfileroot,strfiletitle);
            copyfile(strfilename,strfilename2);
        end
    end    
end