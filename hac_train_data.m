%Ʈ���̴� ��ų ������ ������ ����� txt ���Ϸ� ����� �ִ� ���α׷�



 strroots = {'E:/������/1123��/json����/'};
        
fid = fopen('D:\darknet\build_win_release\Release\data\sun_train.txt','w'); % *valid.txt, *train.txt�� �̸� �ٲ㼭 �ι� ���� ��(�ѹ� ������ ���α׷� 1�� ����, 2�����α׷��ʿ�)
for i=1:length(strroots)
    strroot = strroots{i};
    strfilename = strcat(strroot,'*.jpg');
    filelist = dir(strfilename);
    for j=1:length(filelist)
        
        strfilename = strcat(strroot,filelist(j).name);
        fprintf(fid,'%s\n',strfilename);
    end
end
fclose(fid);