%json���ϰ� �̸��� ���� jpg ���ϸ� �ҷ��� json ��ġ�� ����

strjsontxtroot = 'E:\������\1123��\json����\'; %json ������ ���丮
strimageroot = 'E:\������\1123��\[ICT��] �װ����� �̹���\color\'; %jpg ������ ���丮
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