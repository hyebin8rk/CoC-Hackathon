clear all;
strroot = 'E:\³ëÁöÈÆ\1123Åæ\'
filelist = dir(strcat(strroot,'*.*'));
count = 0;
for i=1:length(filelist)
    if strcmp(filelist(i).name,'.')==0 && strcmp(filelist(i).name,'..')==0
        strroot2 = strcat(strroot,filelist(i).name);
        strfilename = strcat(strroot2,'\*.json');        
        jsonlist = dir(strfilename);
        for j=1:length(jsonlist)
            path = strcat(strcat(strroot2,'\'),jsonlist(j).name);
            fid = fopen(path);
            raw = fread(fid);
            str = char(raw');
            data = jsondecode(str);
            count = count+length(data.shapes);
            fclose(fid);
        end        
    end
end
sprintf('ÃÑ ¶óº§¸µÇÑ ÆÐ³Î ¼ö %d',count)