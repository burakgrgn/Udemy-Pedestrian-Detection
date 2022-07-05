
% Show the LSI FIR Pedetrian Detection Database.
% © Daniel Olmeda 2012

function dshowLSIDetection(subset, class)
% Example: dshowLSIDetection('Test', 'neg')
% Subsect: 'Train' or 'Test'
% class: 'pos' or 'neg'

if (nargin<1)
    subset = 'Train';
end;
if (nargin<2)
    class = 'pos';
end;

if(strcmp(class, 'pos'))
    
    %Open Annotations list.
    colormap(jet);
    fid = fopen(fullfile(subset, 'annotations.lst'), 'r');
    tline = fgetl(fid);
    while ischar(tline)
        
        % Read annotation in Pascal Format.
        rec=PASreadrecord(tline);
        
        % Read, adjust and show image.
        I = imread(rec.imgname);
        imagesc(I, [31000 35000]);
        axis equal;
        
        % Draw Bounding Boxes.
        hold on
        for i = 1:length(rec.objects)
            bbox = rec.objects(i).bbox;
            bbox(3) = bbox(3) - bbox(1);
            bbox(4) = bbox(4) - bbox(2);
            rectangle('Position', bbox, 'Linewidth', 3, 'EdgeColor', 'black');
        end
        hold off
        pause(0.03);
        
        % Read new line of annotations list.
        tline = fgetl(fid);
    end
    %Close annotations list.
    fclose(fid);
    
elseif strcmp(class, 'neg')
    % Show negatives
    fid = fopen(fullfile(subset, 'neg.lst'), 'r');
    tline = fgetl(fid);
    while ischar(tline)
        
        % Read, adjust and show image.
        I = imread(tline);
        imagesc(I, [31000 34000]);
        axis equal;
        
        hold off
        pause(0.03);
        
        % Read new line of annotations list.
        tline = fgetl(fid);
    end
    %Close annotations list.
    fclose(fid);
end