%트레이닝 시킬 데이터 파일의 목록을 txt 파일로 만들어 주는 프로그램



 strroots = {'E:/노지훈/1123톤/json파일/'};
        
fid = fopen('D:\darknet\build_win_release\Release\data\sun_train.txt','w'); % *valid.txt, *train.txt로 이름 바꿔서 두번 돌릴 것(한번 돌리면 프로그램 1개 생성, 2개프로그램필요)
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